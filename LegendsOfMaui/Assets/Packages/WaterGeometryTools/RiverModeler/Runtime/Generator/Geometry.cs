// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

//#define FLOW_RAYCAYSTS

#if SWS_DEV
//#define FLOW_RAYCAYSTS
#endif

using System;
using System.Collections.Generic;
using UnityEngine;

#if MATHEMATICS
using Unity.Mathematics;
#endif
#if SPLINES
using UnityEngine.Splines;
using Interpolators = UnityEngine.Splines.Interpolators;
#endif

namespace sc.modeling.river.runtime
{
    public static class Geometry
    {
        #if MATHEMATICS
        
        //Mesh data
        private static readonly List<Vector3> vertices = new List<Vector3>();
        //private static readonly List<Vector3> normals = new List<Vector3>();
        private static readonly List<Vector4> tangents = new List<Vector4>();
        private static readonly List<Vector2> uv0 = new List<Vector2>();
        private static readonly List<Vector2> uv1 = new List<Vector2>();
        private static readonly List<Vector2> flow = new List<Vector2>();
        private static readonly List<int> triangles = new List<int>();
        private static readonly List<Color> colors = new List<Color>();
        private static Mesh mesh = new Mesh();
        
        private static readonly Interpolators.LerpFloat3 float3Interpolator = new Interpolators.LerpFloat3();
        private static readonly Interpolators.LerpFloat floatInterpolator = new Interpolators.LerpFloat();
        
        /// <summary>
        /// Generates river geometry from a spline
        /// </summary>
        /// <param name="splineContainer"></param>
        /// <param name="settings"></param>
        /// <param name="worldToLocal">The transformation matrix of the Transform holding the mesh (MeshFilter)</param>
        /// <param name="lod">Percentage to multiple the vertex count with</param>
        /// <param name="scaleData"></param>
        /// <param name="transparencyData"></param>
        /// <param name="foamData"></param>
        /// <returns></returns>
        #if SPLINES
        public static Mesh Create(SplineContainer splineContainer, Settings settings, Matrix4x4 worldToLocal, float lod = 100f, 
            List<SplineData<float3>> scaleData = null, List<SplineData<float>> transparencyData = null, List<SplineData<float>> foamData = null)
        {
            if (splineContainer.Splines.Count == 0) return null;
            
            float resolutionScale = (lod * 0.01f);
            
            mesh = new Mesh();
            mesh.Clear();

            #if SPLINES && MATHEMATICS
            mesh.name = $"{splineContainer.gameObject.name} (LOD {lod}%)";

            float3 boundsMin = Vector3.one * -math.INFINITY;
            float3 boundsMax = Vector3.one * math.INFINITY;
            
            //Spline sampling data

            float width = settings.shape.width;
            float vertexDistanceWidth = settings.triangulation.vertexDistanceWidth;
            float vertexDistance = settings.triangulation.vertexDistance;
            var widthCurve = settings.shape.widthCurve;
            float2 offset = settings.shape.offset;

            //float worldLength = length / splineContainer.transform.lossyScale.z;
            float yScalar = 1f / splineContainer.transform.lossyScale.y;
            
            float sampleDist = vertexDistance / resolutionScale;
            
            var splineCount = splineContainer.Splines.Count;
            CombineInstance[] combineInstances = new CombineInstance[splineCount];
            
            #if FLOW_RAYCAYSTS
            RaycastHit hit = new RaycastHit();
            float2 prevFlowCoords = 0f;
            float3 prevFlowVector = 0f;
            #endif
            float3 flowVector = 0f;

            for (int s = 0; s < splineCount; s++)
            {
                var subMesh = new Mesh();
                
                vertices.Clear();
                //normals.Clear();
                tangents.Clear();
                uv0.Clear();
                if(settings.uv.lightmapUV) uv1.Clear();
                if(settings.uv.flowVectors) flow.Clear();
                triangles.Clear();
                colors.Clear();
                
                float length = splineContainer.Splines[s].CalculateLength(splineContainer.transform.localToWorldMatrix);

                //The scale of the spline's transform affects the geometry scale, so would make this value in the inspector seem inaccurate
                //Divide the scale so that the 'width' parameter remains constant
                float m_width = width / splineContainer.transform.lossyScale.x;
                
                //Number of edge loops across the width
                int widthSegments = Mathf.CeilToInt(width / (vertexDistanceWidth / resolutionScale));
                widthSegments = (int)Mathf.Clamp(widthSegments, 1, 100);

                int xCount = widthSegments + 1;

                /*
                //Check if the spline's first knot is linked, if so consider this river a child branch
                KnotLinkCollection knotLinks = splineContainer.KnotLinkCollection;
                if (knotLinks.TryGetKnotLinks(new SplineKnotIndex(s, 0), out var _))
                {
                    parentWidth = width;
                    //m_width *= 0.5f;
                }
                */

                if (length < settings.triangulation.vertexDistance)
                {
                    throw new Exception($"[{splineContainer.gameObject.name}] Cannot create a river mesh from Spline (#{s}) with a length of {length}m. It is too short");
                }
               
                int sampleCount = Mathf.RoundToInt(length / sampleDist);
                
                //Default
                Color color = Color.black;
                
                int rows = 0;
                float lastRowT = 0f;
                
                for (int y = 0; y <= sampleCount; y++)
                {
                    float t = (float)y / (float)(sampleCount); //Normalized position
                    float distance = t * length; //Position in metric units
                    
                    splineContainer.Splines[s].Evaluate(t, out var origin, out var tangent, out var normal);
                    float3 forward = math.normalize(tangent);
                    
                    quaternion rotation = quaternion.LookRotationSafe(tangent, normal);
                    if (settings.shape.twistCorrection) rotation = TwistCorrectedRotation(tangent);
                    
                    float rowStride = 1f / sampleCount;

                    //Skip edge loops based on turning strength or flatness
                    if (settings.triangulation.flatFilter > 0 || settings.triangulation.turnFilter > 0)
                    {
                        float3 acceleration = splineContainer.Splines[s].EvaluateAcceleration(t);
                        float turn = CalculateTurnFactor(tangent, acceleration);

                        //Scale the distance between rows up based on the flatness of the curve
                        rowStride *= math.lerp(1f, 0.5f, (math.dot(normal, math.up())) * settings.triangulation.flatFilter);
                        //Same for turns
                        rowStride *= math.lerp(1f, 0.5f, ((turn)) * settings.triangulation.turnFilter * 10f);
                    }
                    
                    //Always create an edge loop at the very start & end.
                    bool createRow = (y == 0 || y == sampleCount);
                    //If current distance at sampling point crosses the desired threshold
                    createRow |= (lastRowT - t) <= rowStride;
                    
                    if (createRow)
                    {
                        lastRowT = t;
                        
                        float3 scale = scaleData != null ? scaleData[s].Evaluate(splineContainer.Splines[s], distance, scaleData[s].PathIndexUnit, float3Interpolator) : Vector3.one;
                        float opacity = transparencyData != null ? math.clamp(transparencyData[s].Evaluate(splineContainer.Splines[s], distance, transparencyData[s].PathIndexUnit, floatInterpolator), 0, 1) : 0f;

                        //Normalized value. 0=0, 0.5f=1, 1f=2f
                        float foamWeight = foamData != null ? foamData[s].Evaluate(splineContainer.Splines[s], distance, foamData[s].PathIndexUnit, floatInterpolator) : 0.5f;
                        
                        float slopeAngle = CalculateSlopeAngle(normal);
                        
                        for (int x = 0; x <= widthSegments; x++)
                        {
                            float xt = (float)x / (widthSegments);
                            float heightCurve = widthCurve.Evaluate(xt) * yScalar;
                            
                            float3 localPosition = new Vector3(x * (m_width / widthSegments) - (m_width / 2f), heightCurve, 0);
                            float sideAlpha = EdgeDistanceMask(x, widthSegments, (opacity * xCount) - 1f, 1f);
                            float alpha = sideAlpha;
                            
                            //The spline could very well be used for something else as well. Allow offsetting the geometry
                            localPosition.x += offset.x;
                            localPosition.y += offset.y;

                            float displacementSum = 0f;
                            float displacementFoam = 0f;
                            foreach (Settings.Displacement.Layer d in settings.displacement.layers)
                            {
                                var dispFoamMask = SlopeMask(slopeAngle, d.minMaxSlopeAngle.x, d.minMaxSlopeAngle.y);

                                if (dispFoamMask > 0)
                                {
                                    float displacement = noise.cnoise(new float2(xt * d.noiseFrequency.x * width * scale.x, t * d.noiseFrequency.y * length));
                                    displacementFoam += displacement * dispFoamMask * d.noiseAmplitude;

                                    displacement = math.lerp(displacement * 0.5f - 0.5f, displacement * 0.5f + 0.5f, d.normalization);

                                    displacement *= d.noiseAmplitude * scale.y * dispFoamMask;

                                    displacementSum += displacement;
                                }
                            }
                            //Local-space displacement... create overlapping triangles on pinches and crevices
                            //localPosition += new float3(0f, displacementSum * yScalar, 0);

                            float3 position = origin + math.rotate(rotation, localPosition * (new float3(scale.x, 1f, 1f)));
                            
                            if (settings.uv.flowVectors)
                            {
                                float3 tangentWS = splineContainer.transform.TransformDirection(forward);
                                flowVector = tangentWS;

                                #if FLOW_RAYCAYSTS
                                float minSamplePos = 1f;
                                
                                float3 positionWS = splineContainer.transform.TransformPoint(position);

                                //if (math.abs(prevFlowCoords.x - (xt * width)) >= minSamplePos )
                                if(math.abs(prevFlowCoords.x - (xt * width)) >= minSamplePos || math.abs(prevFlowCoords.y - distance) >= minSamplePos)
                                {
                                    if (Physics.Raycast(positionWS, tangentWS, out hit, settings.triangulation.vertexDistance * 2f, -1, QueryTriggerInteraction.Ignore))
                                    {
                                        if (hit.collider.GetType() != typeof(TerrainCollider))
                                        {
                                            flowVector = math.reflect(hit.normal, tangentWS) * 2f;
                                            
                                            prevFlowCoords.x = xt * width;
                                            prevFlowCoords.y = distance;
                                            
                                            prevFlowVector = flowVector;
                                        }

                                    }
                                    else if (Physics.Raycast(positionWS, -forward, out hit, settings.triangulation.vertexDistance * 2f, -1, QueryTriggerInteraction.Ignore))
                                    {
                                        if (hit.collider.GetType() != typeof(TerrainCollider))
                                        {
                                            flowVector = math.reflect(-hit.normal, tangentWS) * 0.25f;
                                            
                                            prevFlowCoords.x = xt * width;
                                            prevFlowCoords.y = distance;
                                            
                                            prevFlowVector = flowVector;
                                        }
                                    }
                                }
                                else
                                {
                                    flowVector = prevFlowVector;
                                }
                                #endif

                                flow.Add(new Vector2(flowVector.x, flowVector.z));
                            }

                            //Transform back to object-space of spline so it matches 1:1, regardless of the MeshFilter's transform
                            position = splineContainer.transform.localToWorldMatrix.MultiplyPoint(position);
                            position += math.up() * displacementSum;


                            //Make that the local-space position of the mesh filter
                            position = worldToLocal.MultiplyPoint(position);
                            
                            uv0.Add(CalculateUV(xt, t, width * scale.x, length, settings.uv.tiling.x, settings.uv.tiling.y, settings.uv.edgeDrag, settings.uv.rotate, settings.uv.reverse));

                            if(settings.uv.lightmapUV) uv1.Add(CalculateUV(xt, t, 1f, 1f, 1f, 1f, 0f, false, false));
                            
                            tangents.Add(new float4(0,0,1, 1f));

                            float foamNoise = 0f;
                            float foamMask = 1f;
                            if (settings.foam.opacity > 0)
                            {
                                foamNoise = noise.cnoise(new float2(xt * settings.foam.noiseFrequency.x * width * scale.x, t * settings.foam.noiseFrequency.y * length)) * settings.foam.noiseAmplitude;
                                foamNoise = math.smoothstep(settings.foam.noiseLevels.x, settings.foam.noiseLevels.y, foamNoise);
                                
                                foamNoise += math.smoothstep(settings.foam.displacementLevels.x, settings.foam.displacementLevels.y, (displacementFoam * settings.foam.displacementFoam));
                                
                                foamNoise += settings.foam.uniformAmount;
                                foamNoise *= settings.foam.opacity;

                                //Values between 0.5/1.0 contribute uniform foam
                                foamNoise += (foamWeight - 0.5f) * 2f;

                                //Nullify foam on the very edges
                                foamMask *= (x == 0 ? 0f : 1f);
                                foamMask *= (x == xCount-1 ? 0f : 1f);

                                //Values between 0.0/1.0 subtract generated foam
                                //foamMask *= (foamWeight - 0.5f * 2.0f);
                                
                                foamNoise *= (foamMask);
                            }

                            //float sideFade = Geometry.EdgeDistanceMask(x, (m_width * scale.x) + settings.geometry.vertexDistanceWidth, settings.transparency.sideFadeDistance, settings.transparency.sideFadeFalloff);
                            //alpha = math.max(sideFade, alpha);
                            
                            //foamNoise = math.smoothstep(0.5f, 1f, math.max(xt, 1f-xt)) * settings.uv.edgeDrag;

                            color[(int)settings.foam.vertexColorChannel] = foamNoise;
                            color[(int)settings.transparency.vertexColorChannel] = alpha;
                            colors.Add(color);

                            vertices.Add(position);
                            
                            //Extend bounds as it expands
                            boundsMin = math.min(position, boundsMin);
                            boundsMax = math.max(position, boundsMax);
                        }
                        
                        if (y <= sampleCount - 1) //Stop at 2nd last row
                        {
                            for (int x = 0; x < widthSegments; x++)
                            {
                                triangles.Insert(0, (rows * xCount) + x);
                                triangles.Insert(1, ((rows + 1) * xCount) + x);
                                triangles.Insert(2, (rows * xCount) + x + 1);

                                triangles.Insert(3, ((rows + 1) * xCount) + x);
                                triangles.Insert(4, ((rows + 1) * xCount) + x + 1);
                                triangles.Insert(5, (rows * xCount) + x + 1);
                            }
                        }

                        rows++;
                    }
                }
                
                subMesh.SetVertices(vertices);

                subMesh.SetUVs(0, uv0);
                if (settings.uv.lightmapUV) subMesh.SetUVs(1, uv1);
                if (settings.uv.flowVectors) subMesh.SetUVs(2, flow);

                subMesh.subMeshCount = 1;
                subMesh.SetIndices(triangles, MeshTopology.Triangles, 0);

                subMesh.SetColors(colors);
                subMesh.SetTangents(tangents);

                //subMesh.SetNormals(normals);
                subMesh.RecalculateNormals();
                
                combineInstances[s].mesh = subMesh;
                combineInstances[s].transform = worldToLocal;
            }
            
            mesh.CombineMeshes(combineInstances, true, false);
            
            mesh.bounds.SetMinMax(boundsMin, boundsMax);
            #endif

            return mesh;
        }
        #endif
        
        private static float2 CalculateUV(float xt, float yt, float width, float length, float tilingX, float tilingY, float edgeDrag, bool rotateUV, bool reverse)
        {
            int sign = (reverse ? 1 : -1);
            //Will map the 0-1 UV scale over 1 world-space unit
            float uvFactorX = width * tilingX * sign;
            float uvFactorY = length * tilingY * sign;
            
            var u = xt * uvFactorX;
            var v = yt * uvFactorY;
            if (rotateUV) (u,v) = (v,u);
            
            v -= math.smoothstep(0.25f, 1f, math.max(xt, 1f-xt)) * edgeDrag;
            
            return new Vector2(1f+u, v+1f);
        }
        
        private static float EdgeDistanceMask(float position, float maxWidth, float distance, float falloff)
        {
            float start = Mathf.Clamp01(((distance + falloff) - (position - distance)) / (falloff));
            float end = Mathf.Clamp01(((maxWidth - distance) - (position + distance)) / (falloff));

            return Mathf.Max(start, 1f - end);
        }

        private static float CalculateTurnFactor(float3 tangent, float3 acceleration)
        {
            float2 firstDerivativeNormSq = math.lengthsq(tangent.xz);
            float2 secondDerivativeNormSq = math.lengthsq(acceleration.xz);
            float2 derivativesDot = math.dot(tangent.xz, acceleration.xz);

            var kappa = math.sqrt((firstDerivativeNormSq * secondDerivativeNormSq ) - (derivativesDot * derivativesDot)) / (firstDerivativeNormSq * math.length(tangent.xz));

            return kappa.x;
        }

        #if MATHEMATICS
        public static quaternion TwistCorrectedRotation(float3 tangent)
        {
            //Classic function (needs conversion to radians)
            //float3 euler = Quaternion.LookRotation(tangent, math.up()).eulerAngles;
            
            quaternion q = quaternion.LookRotation(tangent, math.up());
            var euler = float3.zero;

            #if !MATHEMATICS_1_3_1
            const float epsilon = 1e-6f;
            const float cutoff = (1f - 2f * epsilon) * (1f - 2f * epsilon);
            
            var qv = q.value;
            var d1 = qv * qv.wwww * math.float4(2f); //xw, yw, zw, ww
            var d2 = qv * qv.yzxw * math.float4(2f); //xy, yz, zx, ww
            var d3 = qv * qv;

            var y1 = d2.x + d1.z;
            if (y1 * y1 < cutoff)
            {
                var x1 = -d2.y + d1.x;
                var x2 = d3.y + d3.w - d3.z - d3.x;
                var z1 = -d2.z + d1.y;
                var z2 = d3.x + d3.w - d3.y - d3.z;
                euler = math.float3(math.atan2(x1, x2), math.asin(y1), math.atan2(z1, z2));
            }
            else //xyx
            {
                y1 = math.clamp(y1, -1f, 1f);
                var abcd = math.float4(d2.x, d1.z, d2.z, d1.y);
                var x1 = 2f * (abcd.x * abcd.w + abcd.y * abcd.z); //2(ad+bc)
                var x2 = math.csum(abcd * abcd * math.float4(-1f, 1f, -1f, 1f));
                euler = math.float3(math.atan2(x1, x2), math.asin(y1), 0f);
            }

            euler.xyz = euler.xzy;
            #else
            //NOTE: Mathematics v1.3.1+ has a "math.Euler" function to be used here. Also note that the angles are then already in radians
            euler = math.Euler(q, math.RotationOrder.XZY);
            #endif
            
            //Create a new rotation from just the Y-axis
            return quaternion.AxisAngle(math.up(), euler.y);
        }
        #endif
        
        public static float CalculateSlopeAngle(float3 normal)
        {
            return ((float)math.acos(math.dot(normal, math.up())) * Mathf.Rad2Deg);
        }
        
        public static float SlopeMask(float slope, float minAngle, float maxAngle)
        {
            float slopeMask = 0f;

            if (slope >= minAngle && slope <= maxAngle) slopeMask = 1f;

            return slopeMask;
        }
        #endif
    }
}
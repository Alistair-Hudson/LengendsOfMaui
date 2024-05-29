// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System.Collections.Generic;
using sc.modeling.water.common.runtime;
using UnityEngine;

#if SPLINES
using UnityEngine.Splines;
using Interpolators = UnityEngine.Splines.Interpolators;
#endif

#if MATHEMATICS
using Unity.Mathematics;
#endif

namespace sc.modeling.river.runtime
{
    [AddComponentMenu("Water/River/River Cascade VFX")]
    [HelpURL("https://staggart.xyz/river-modeler-docs/?section=cascade-vfx")]
    public class CascadeVFX : RiverVFX
    {
        [Tooltip("Consider a point of the river as being part of a cascade if its height dropped low enough, compared to a point before it.")]
        [Min(0.05f)]
        public float heightDropThreshold = 0.1f;
        [Tooltip("Shift the particle back/forward along the spline")]
        public float shifting = 0f;
        [Range(0f, 1f)]
        public float randomOffset = 1f;

        [Tooltip("Minimum particle distance over the width of the river. Lower values provide better coverage, but a particle cloud too dense will impact performance negatively")]
        [Min(0.05f)]
        public float minParticleDistance = 0.5f;
        public float margin;
        
        public override void GenerateEmitters()
        {
            #if VFX_GRAPH && MATHEMATICS && SPLINES
            if (!river || !targetEffect) return;
            
            var splineContainer = river.splineContainer;
            Interpolators.LerpFloat3 scaleInterpolator = new Interpolators.LerpFloat3();

            emitters = new List<VFX.Emitter>();
            
            if (confines == Confines.Bounds) bounds = new Bounds(this.transform.position, boundsSize);

            for (int s = 0; s < splineContainer.Splines.Count; s++)
            {
                float length = splineContainer.Splines[s].CalculateLength(splineContainer.transform.localToWorldMatrix);
                int sampleCount = Mathf.RoundToInt(length / 0.25f);

                float stride = 1f / sampleCount;
                
                for (int y = 0; y <= sampleCount; y++)
                {
                    float t = (float)y / (float)(sampleCount); //Normalized position

                    if(t < stride) continue;

                    splineContainer.Splines[s].Evaluate(t, out var position, out var tangent, out var normal);
                    //position = splineContainer.transform.TransformPoint(position);
                    
                    if (confines == Confines.Bounds)
                    {
                        //Early out if spline point falls outside of bounds
                        if (bounds.Contains(splineContainer.transform.TransformPoint(position)) == false) continue;
                    }
                    
                    //Analyze the next point to check if there is a large enough drop
                    splineContainer.Splines[s].Evaluate(t + stride, out var nextPosition, out _, out _);
                    //nextPosition = splineContainer.transform.TransformPoint(nextPosition);

                    float delta = position.y - nextPosition.y;

                    if (delta >= heightDropThreshold)
                    {
                        float distance = t * length;
                        float3 scale = river.ScaleData[s].Evaluate(splineContainer.Splines[s], distance, river.ScaleData[s].PathIndexUnit, scaleInterpolator);
                        //bi-tangent
                        float3 right = math.normalize(math.cross(math.normalize(tangent), normal));

                        float riverWidth = river.settings.shape.width * scale.x;

                        //Distance between emitters along the width of the edge
                        float minDistance = minParticleDistance;

                        int widthSegments = Mathf.CeilToInt(riverWidth / (minDistance));
                        //float margin = minDistance;
                        for (int x = 0; x < widthSegments; x++)
                        {
                            float xt = (float)x / (float)widthSegments;
                            float width = xt * riverWidth;
                            
                            if(width < margin || width > (riverWidth - margin)) continue;
                            
                            float3 newPos;
                            float shift = shifting / length; //Shifting value from meters to t

                            //New sampling position (shifted up/down the spline randomly)
                            float t2 = t + shift + (stride * UnityEngine.Random.value * randomOffset);
                            
                            splineContainer.Splines[s].Evaluate(t2, out newPos, out _, out _);
                            newPos = splineContainer.transform.TransformPoint(newPos);
                            
                            float cascadeWidth = ((float)x * minDistance) - margin;
                            float3 spawnPoint = 
                                newPos
                                - (right * (riverWidth * 0.5f))  //Offset to left by half
                                //+ (right * margin) //Offset forward by margin
                                + (right * cascadeWidth); //Relative offset over width

                            if (confines == Confines.Bounds)
                            {
                                if (bounds.Contains(spawnPoint) == false) continue;
                            }
                            
                            //To effect's local space
                            spawnPoint = targetEffect.transform.InverseTransformPoint(spawnPoint);
                            
                            VFX.Emitter emitter = new VFX.Emitter
                            {
                                position = spawnPoint,
                                //Spline local to world
                                velocity = splineContainer.transform.TransformDirection(tangent)
                            };
                            
                            //World to local of effect
                            emitter.velocity = targetEffect.transform.InverseTransformDirection(emitter.velocity);
                            
                            emitters.Add(emitter);
                        }
                    }

                }
            }
            
            ApplyEmitters();

            #endif
        }
    }
}
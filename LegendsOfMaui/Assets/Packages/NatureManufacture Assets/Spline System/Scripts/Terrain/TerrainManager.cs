using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.TerrainTools;

namespace NatureManufacture.RAM
{
    public class TerrainManager
    {
        private Bounds _brushBounds;
        private Vector3 _brushCenter;
        private static readonly int BrushTex = Shader.PropertyToID("_BrushTex");
        private static readonly int ParamsTex = Shader.PropertyToID("_ParamsTex");
        private static readonly int BrushParams = Shader.PropertyToID("_BrushParams");
        private static readonly int NoiseParams = Shader.PropertyToID("_NoiseParams");
        public static readonly int HeightmapOrig = Shader.PropertyToID("_HeightmapOrig");
        private float _terrainHeight;
        private static readonly int HeightMax = Shader.PropertyToID("_heightMax");
        private static readonly int BlurAdditionalSize = Shader.PropertyToID("_BlurAdditionalSize");
        private static readonly int BlurSize = Shader.PropertyToID("_BlurSize");
        private static readonly int ConvexParams = Shader.PropertyToID("_ConvexParams");
        private static readonly int MaskTex = Shader.PropertyToID("_MaskTex");
        private static readonly int NoiseParamsSecond = Shader.PropertyToID("_NoiseParamsSecond");
        private static readonly int MainParams = Shader.PropertyToID("_MainParams");
        private static readonly int PassNumber = Shader.PropertyToID("_PassNumber");
        private static readonly int HeightOffset = Shader.PropertyToID("_heightOffset");


        private RenderTexture _texture2DPaint;
        private RenderTexture _texture2DCarve;
        private Vector2 _textureCoord = Vector3.zero;
        private float _brushSize;
        private Terrain _terrainUV;
        private Texture2D _paramsTextureCarve;
        private RenderTexture _texture2DMask;
        private HashSet<MeshFilter> _meshFilters = new();

        public TerrainManager(MeshFilter meshFilter)
        {
            MeshFilters.Add(meshFilter);
        }

        public TerrainManager(HashSet<MeshFilter> meshFilters)
        {
            MeshFilters = meshFilters;
        }

        public TerrainManager()
        {
        }


        public RenderTexture Texture2DPaint
        {
            get => _texture2DPaint;
            set => _texture2DPaint = value;
        }

        public RenderTexture Texture2DCarve
        {
            get => _texture2DCarve;
            set => _texture2DCarve = value;
        }

        public Vector2 TextureCoord
        {
            get => _textureCoord;
            set => _textureCoord = value;
        }

        public float BrushSize
        {
            get => _brushSize;
            set => _brushSize = value;
        }

        public Terrain TerrainUV
        {
            get => _terrainUV;
            set => _terrainUV = value;
        }

        public Texture2D ParamsTextureCarve
        {
            get => _paramsTextureCarve;
            set => _paramsTextureCarve = value;
        }

        public RenderTexture Texture2DMask
        {
            get => _texture2DMask;
            set => _texture2DMask = value;
        }

        public HashSet<MeshFilter> MeshFilters
        {
            get => _meshFilters;
            set => _meshFilters = value;
        }

        public void GenerateTerrainBrushTexture(TerrainPainterData terrainPainterData)
        {
            if (_texture2DCarve)
            {
                RenderTexture.ReleaseTemporary(_texture2DCarve);
            }

            if (_texture2DMask)
            {
                RenderTexture.ReleaseTemporary(_texture2DMask);
            }


            _terrainHeight = terrainPainterData.WorkTerrain.terrainData.size.y;

            //get bounds from mesh filters

            //create bounds from mesh filters in a loop
            Bounds bounds = MeshFilters.First().GetComponent<MeshRenderer>().bounds;
            foreach (MeshFilter meshFilter in MeshFilters)
            {
                var renderer = meshFilter.GetComponent<MeshRenderer>();
                bounds.Encapsulate(renderer.bounds);
            }

            Vector3 center = bounds.center;
            Vector3 extents = bounds.extents;

            float extent = Mathf.Max(extents.x, extents.z);

            float minX = center.x - extent;
            float maxX = center.x + extent;

            minX -= terrainPainterData.BrushAdditionalSize;
            maxX += terrainPainterData.BrushAdditionalSize;

            BrushSize = maxX - minX;

            _brushCenter = center;
            _brushBounds = bounds;
            //Debug.Log($"brush center {center} brush bounds {bounds} brush size {BrushSize}");

            GetTerrainUV();
            Texture2DCarve = GenerateBrushFromCamera(terrainPainterData);

            int textureParamsSize = (int)(0.5f * (int)terrainPainterData.TerrainCarveQuality);
            ushort[] paramsColors = new ushort[textureParamsSize];

            ParamsTextureCarve = new Texture2D(textureParamsSize, 1, TextureFormat.R16, false)
            {
                wrapMode = TextureWrapMode.Clamp
            };
            for (int i = 0; i < textureParamsSize; i++)
            {
                float power = RamMath.Remap(i, 0, textureParamsSize - 1, -BrushSize, BrushSize);

                power = terrainPainterData.TerrainCarve.Evaluate(power);

                //power = 100 * i / (float) textureParamsSize;
                power = RamMath.Remap(power, -_terrainHeight, _terrainHeight, 0, 1);

                //Debug.Log(i + " " + power);

                paramsColors[i] = (ushort)(power * ushort.MaxValue);
            }

            ParamsTextureCarve.SetPixelData(paramsColors, 0);
            ParamsTextureCarve.Apply();
        }

        /// <summary>
        /// r - height of spline
        /// g - distance to border
        /// b - mask of spline
        /// a - blend distance by brush additional
        /// </summary>
        /// <param name="terrainPainterData"></param>
        /// <returns></returns>
        private RenderTexture GenerateBrushFromCamera(TerrainPainterData terrainPainterData)
        {
            var currentActiveRT = RenderTexture.active;

            var depthRenderTexture = GenerateDepthMask(terrainPainterData);


            RenderTexture renderTexture = RenderTexture.GetTemporary(depthRenderTexture.width, depthRenderTexture.height, 0, RenderTextureFormat.ARGB64, RenderTextureReadWrite.Linear);
            RenderTexture renderTextureSecond = RenderTexture.GetTemporary(depthRenderTexture.width, depthRenderTexture.height, 0, RenderTextureFormat.ARGB64, RenderTextureReadWrite.Linear);

            var materialRenderBrush = new Material(Shader.Find("Hidden/NatureManufacture Shaders/BrushGenerator"));

            Graphics.Blit(depthRenderTexture, renderTexture, materialRenderBrush, 1);

            float brushAdditionalSize = terrainPainterData.BrushAdditionalSize / BrushSize;
            materialRenderBrush.SetFloat(BlurAdditionalSize, brushAdditionalSize);

            for (int i = 0; i < (int)(0.25f * (int)terrainPainterData.TerrainCarveQuality); i++)
            {
                materialRenderBrush.SetFloat(BlurSize, (i * 2) / (float)(depthRenderTexture.height));
                materialRenderBrush.SetFloat(PassNumber, i * 2);
                Graphics.Blit(renderTexture, renderTextureSecond, materialRenderBrush, 2);
                materialRenderBrush.SetFloat(BlurSize, (i * 2 + 1) / (float)(depthRenderTexture.height));
                materialRenderBrush.SetFloat(PassNumber, i * 2 + 1);
                Graphics.Blit(renderTextureSecond, renderTexture, materialRenderBrush, 2);
            }


            for (int i = 0; i < 0.25f * (int)terrainPainterData.TerrainCarveQuality; i++)
            {
                Graphics.Blit(renderTexture, renderTextureSecond, materialRenderBrush, 3);
                Graphics.Blit(renderTextureSecond, renderTexture, materialRenderBrush, 3);
            }


            Graphics.Blit(renderTexture, depthRenderTexture, materialRenderBrush, 0);


            RenderTexture.ReleaseTemporary(renderTexture);
            RenderTexture.ReleaseTemporary(renderTextureSecond);

            RenderTexture.active = currentActiveRT;
            return depthRenderTexture;
        }

        private RenderTexture GenerateDepthMask(TerrainPainterData terrainPainterData)
        {
            var cameraGameObject = new GameObject();
            var depthCamera = cameraGameObject.AddComponent<Camera>();
            Vector3 position = _brushCenter;

            //if (terrainPainterData.CameraView == TerrainPainterData.CameraViewEnum.Top)
            position.y = _brushBounds.max.y + 10;
            //else
            //    position.y = _brushBounds.min.y - 10;

            depthCamera.transform.position = position;
            depthCamera.transform.LookAt(_brushCenter);

            //depthCamera.transform.Rotate(0, 0, 180, Space.Self);

            depthCamera.nearClipPlane = 0.1f;
            depthCamera.farClipPlane = _brushBounds.size.y + 10;
            depthCamera.orthographic = true;
            depthCamera.orthographicSize = _brushSize * 0.5f;
            depthCamera.rect = new Rect(0, 0, 1, 1);

            var depthMaterial = new Material(Shader.Find("Hidden/NatureManufacture Shaders/WorldDepth"));
            depthMaterial.SetFloat(HeightMax, _terrainHeight);
            depthMaterial.SetFloat(HeightOffset, -_terrainUV.transform.position.y);
            Matrix4x4 orthoMatrix;

            //if (terrainPainterData.CameraView == TerrainPainterData.CameraViewEnum.Top)
            orthoMatrix = Matrix4x4.Ortho(-_brushSize * 0.5f, _brushSize * 0.5f, -_brushSize * 0.5f, _brushSize * 0.5f, 2, 2000);
            //else
            //    orthoMatrix = Matrix4x4.Ortho(_brushSize * 0.5f, -_brushSize * 0.5f, -_brushSize * 0.5f, _brushSize * 0.5f, 2, 2000);

            RenderTexture depthRenderTexture =
                RenderTexture.GetTemporary((int)terrainPainterData.TerrainCarveQuality, (int)terrainPainterData.TerrainCarveQuality, 0, RenderTextureFormat.ARGB64, RenderTextureReadWrite.Linear);

            //RenderTexture renderTexture =
            //    RenderTexture.GetTemporary((int)terrainPainterData.TerrainCarveQuality, (int)terrainPainterData.TerrainCarveQuality, 0, RenderTextureFormat.ARGB64, RenderTextureReadWrite.Linear);

            var depthCommandBuffer = new CommandBuffer();
            depthCommandBuffer.name = "ModelWorldDepthBaker";


            depthCommandBuffer.Clear();
            depthCommandBuffer.SetRenderTarget(depthRenderTexture);
            depthCommandBuffer.ClearRenderTarget(true, true, Color.black);
            depthCommandBuffer.SetViewProjectionMatrices(depthCamera.worldToCameraMatrix, orthoMatrix);
            //Debug.Log($"{filter.sharedMesh} {NmSpline.Transform}");
            foreach (MeshFilter meshFilter in MeshFilters)
            {
                depthCommandBuffer.DrawMesh(meshFilter.sharedMesh, meshFilter.transform.localToWorldMatrix, depthMaterial, 0);
            }

            Graphics.ExecuteCommandBuffer(depthCommandBuffer);
            depthCommandBuffer.Release();

            //Graphics.Blit(renderTexture, depthRenderTexture, new Vector2(-1.0f, -1.0f), new Vector2(1.0f, 1.0f));

            //RenderTexture.ReleaseTemporary(renderTexture);

            Object.DestroyImmediate(cameraGameObject);
            return depthRenderTexture;
        }

        private void GetTerrainUV()
        {
            // Debug.DrawLine(_brushCenter, _brushCenter + Vector3.up * 1000, Color.cyan, 20);
            var ray = new Ray(_brushCenter + Vector3.up * 10000, Vector3.down);

            RaycastHit[] hits = Physics.RaycastAll(ray, Mathf.Infinity);

            if (hits.Length <= 0) return;


            foreach (var hit in hits)
            {
                if (hit.collider is not TerrainCollider) continue;


                TextureCoord = hit.textureCoord;
                TerrainUV = hit.collider.GetComponent<Terrain>();
                break;
            }
        }

        public void CarveTerrain(TerrainPainterData terrainPainterData)
        {
            GenerateTerrainBrushTexture(terrainPainterData);
            if (TerrainUV == null)
                return;

#if UNITY_EDITOR
            Undo.RegisterCompleteObjectUndo(TerrainUV.terrainData, "Carve");
#endif


            BrushTransform brushTransform = TerrainPaintUtility.CalculateBrushTransform(TerrainUV, TextureCoord, BrushSize, 0);
            PaintContext paintContext = TerrainPaintUtility.BeginPaintHeightmap(TerrainUV, brushTransform.GetBrushXYBounds());

            BrushCarve(paintContext, terrainPainterData.Smooth, ParamsTextureCarve, terrainPainterData.TerrainNoiseParametersCarve, Texture2DCarve, brushTransform);

            TerrainPaintUtility.EndPaintHeightmap(paintContext, "Terrain Paint - Raise or Lower Height");
            //Debug.Log(paintContext.terrainCount);

            //get terraincount from paint context then loop through terrain 
            //and call terrain.terrainData.SyncHeightmap() on each terrain
            int terrainCount = paintContext.terrainCount;
            for (int i = 0; i < terrainCount; i++)
            {
                Terrain terrain = paintContext.GetTerrain(i);
                terrain.terrainData.SyncHeightmap();
            }
        }

        public void BrushCarve(PaintContext paintContext, float brushStrength, Texture2D paramsTexture, TerrainNoiseParameters terrainNoiseParameters, Texture brushTexture, BrushTransform brushTransform)
        {
            Material mat = Object.Instantiate(TerrainPaintUtility.GetBuiltinPaintMaterial());
            mat.shader = Shader.Find("Hidden/NatureManufacture Shaders/PaintHeight");

            var noiseParams = new Vector4(terrainNoiseParameters.NoiseMultiplierInside, terrainNoiseParameters.NoiseSizeX, terrainNoiseParameters.NoiseSizeZ, terrainNoiseParameters.NoiseMultiplierOutside);
            mat.SetVector(NoiseParams, noiseParams);
            var noiseParamsSecond = new Vector4(terrainNoiseParameters.NoiseMultiplierPower, 0, 0, 0);
            mat.SetVector(NoiseParamsSecond, noiseParamsSecond);

            var brushParams = new Vector4(brushStrength, terrainNoiseParameters.UseNoise ? 1 : 0, 1, 0.0f);
            mat.SetTexture(BrushTex, brushTexture);
            mat.SetTexture(ParamsTex, paramsTexture);
            mat.SetVector(BrushParams, brushParams);


            TerrainPaintUtility.SetupTerrainToolMaterialProperties(paintContext, brushTransform, mat);

            Graphics.Blit(paintContext.sourceRenderTexture, paintContext.destinationRenderTexture, mat, (int)TerrainBuiltinPaintMaterialPasses.StampHeight);
        }

        public void PaintTerrain(TerrainPainterData terrainPainterData)
        {
            if (_texture2DCarve)
            {
                RenderTexture.ReleaseTemporary(_texture2DCarve);
            }

            if (_texture2DMask)
            {
                RenderTexture.ReleaseTemporary(_texture2DMask);
            }


            GenerateTerrainBrushTexture(terrainPainterData);


            if (TerrainUV == null)
                return;

            if (TerrainUV.terrainData.terrainLayers.Length == 0)
                return;

            if (terrainPainterData.WorkTerrain.terrainData.terrainLayers.Length == 0)
                return;


            BrushTransform brushTransform = TerrainPaintUtility.CalculateBrushTransform(TerrainUV, TextureCoord, BrushSize, 0.0f);

            int textureParamsSize = (int)(0.5f * (int)terrainPainterData.TerrainCarveQuality);
            Color[] paramsColors = new Color[textureParamsSize];
            foreach (var terrainLayerData in terrainPainterData.TerrainLayersData)
            {
                if (!terrainLayerData.IsActive)
                    continue;
                int layerID = terrainLayerData.SplatMapID;

                if (terrainPainterData.WorkTerrain.terrainData.terrainLayers.Length <= layerID)
                {
                    Debug.LogWarning($"Error in paint layer \"{terrainLayerData.LayerName}\" - Terrain \"{terrainPainterData.WorkTerrain.name}\" does not have {layerID + 1} layers.");
                    continue;
                }

                PaintContext paintContext = TerrainPaintUtility.BeginPaintTexture(TerrainUV, brushTransform.GetBrushXYBounds(), terrainPainterData.WorkTerrain.terrainData.terrainLayers[layerID]);


                var paramsTexture = new Texture2D(textureParamsSize, 1, TextureFormat.RGB24, false)
                {
                    wrapMode = TextureWrapMode.Clamp
                };
                for (int i = 0; i < textureParamsSize; i++)
                {
                    float angle = terrainLayerData.Angle.Evaluate(90 * i / (float)textureParamsSize);
                    float power = terrainLayerData.Power.Evaluate(RamMath.Remap(i, 0, textureParamsSize - 1, -BrushSize, BrushSize));

                    float height = terrainLayerData.Height.Evaluate(RamMath.Remap(i, 0, textureParamsSize - 1, 0, TerrainUV.terrainData.size.y));


                    paramsColors[i] = new Color(angle, power, height);
                }

                paramsTexture.SetPixels(paramsColors, 0);
                paramsTexture.Apply();

                var mainParams = new Vector4(terrainLayerData.PowerMultiplier, terrainLayerData.HeightMultiplier, terrainLayerData.HeightPower, 0.0f);

                Texture2DMask = GenerateMaskFromTerrainHeight(brushTransform, terrainLayerData.ConvexParameters);

                BrushPaint(paintContext, mainParams, terrainLayerData.NoiseParameters.UseNoise ? 1 : 0, paramsTexture, terrainLayerData.NoiseParameters, Texture2DMask, Texture2DCarve, brushTransform);

                RenderTexture.ReleaseTemporary(Texture2DMask);
                TerrainPaintUtility.EndPaintTexture(paintContext, "Terrain Paint - Texture");
            }
        }

        private RenderTexture GenerateMaskFromTerrainHeight(BrushTransform brushTransform, TerrainConvexParameters convexParameters)
        {
            PaintContext paintContextHeight = TerrainPaintUtility.BeginPaintHeightmap(TerrainUV, brushTransform.GetBrushXYBounds());
            RenderTexture source = paintContextHeight.sourceRenderTexture;
            RenderTexture renderTexture = RenderTexture.GetTemporary(source.width, source.height, source.depth, RenderTextureFormat.ARGB64);


            var materialPaintHeight = new Material(Shader.Find("Hidden/NatureManufacture Shaders/PaintHeight"));

            var brushParams = new Vector4(0, 0, TerrainUV.terrainData.size.y, 0);
            materialPaintHeight.SetVector(BrushParams, brushParams);

            //Debug.Log((int)convexParameters.Convex);

            var convexParams = new Vector4(convexParameters.Steps, convexParameters.StepSize, convexParameters.Strength, (int)convexParameters.Convex);
            materialPaintHeight.SetVector(ConvexParams, convexParams);


            TerrainPaintUtility.SetupTerrainToolMaterialProperties(paintContextHeight, brushTransform, materialPaintHeight);

            Graphics.Blit(paintContextHeight.sourceRenderTexture, renderTexture, materialPaintHeight, 3);
            Graphics.Blit(paintContextHeight.sourceRenderTexture, paintContextHeight.destinationRenderTexture, materialPaintHeight, 0);

            TerrainPaintUtility.EndPaintHeightmap(paintContextHeight, "Generate normal");

            return renderTexture;
        }

        private void BrushPaint(PaintContext paintContext, Vector4 mainParams, float noise, Texture2D paramsTexture, TerrainNoiseParameters terrainNoiseParameters, RenderTexture maskTexture, Texture brushTexture,
            BrushTransform brushTransform)
        {
            Material materialPaintHeight = Object.Instantiate(TerrainPaintUtility.GetBuiltinPaintMaterial());
            materialPaintHeight.shader = Shader.Find("Hidden/NatureManufacture Shaders/PaintHeight");

            var brushParams = new Vector4(1, noise, TerrainUV.terrainData.size.y, 0.0f);

            materialPaintHeight.SetTexture(BrushTex, brushTexture);
            materialPaintHeight.SetTexture(MaskTex, maskTexture);
            materialPaintHeight.SetTexture(ParamsTex, paramsTexture);
            materialPaintHeight.SetVector(BrushParams, brushParams);
            materialPaintHeight.SetVector(MainParams, mainParams);


            var noiseParams = new Vector4(terrainNoiseParameters.NoiseMultiplierInside, terrainNoiseParameters.NoiseSizeX, terrainNoiseParameters.NoiseSizeZ, terrainNoiseParameters.NoiseMultiplierOutside);
            var noiseParamsSecond = new Vector4(terrainNoiseParameters.NoiseMultiplierPower, 0, 0, 0);
            materialPaintHeight.SetVector(NoiseParams, noiseParams);
            materialPaintHeight.SetVector(NoiseParamsSecond, noiseParamsSecond);

            TerrainPaintUtility.SetupTerrainToolMaterialProperties(paintContext, brushTransform, materialPaintHeight);

            Graphics.Blit(paintContext.sourceRenderTexture, paintContext.destinationRenderTexture, materialPaintHeight, (int)TerrainBuiltinPaintMaterialPasses.PaintTexture);
        }
    }
}
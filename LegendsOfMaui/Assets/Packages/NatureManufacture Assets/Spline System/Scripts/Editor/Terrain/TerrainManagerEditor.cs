//  * Created by Pawel Homenko on  08/2022
//  */


using UnityEditor;
using UnityEditor.TerrainTools;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.TerrainTools;

namespace NatureManufacture.RAM.Editor
{
    public class TerrainManagerEditor
    {
        public TerrainManagerEditor(RamTerrainManager baseRamTerrainManager)
        {
            BaseRamTerrainManager = baseRamTerrainManager;
            GetTerrains = new UnityEvent();


            _terrainPainterDataEditor = (TerrainPainterDataEditor)UnityEditor.Editor.CreateEditor(BaseRamTerrainManager.BasePainterData);
            if (BaseRamTerrainManager.BasePainterData != null)
                _terrainLayersDataCount = BaseRamTerrainManager.BasePainterData.TerrainLayersData.Count;
        }

        private bool _showCarveTerrain;
        private RamTerrainManager BaseRamTerrainManager { get; }

        public UnityEvent GetTerrains { get; set; }

        private int _terrainLayersDataCount;

        public bool ShowCarveTerrain
        {
            get => _showCarveTerrain;
            set => _showCarveTerrain = value;
        }

        private TerrainPainterDataEditor _terrainPainterDataEditor;

        public void UITerrain()
        {
            if (BaseRamTerrainManager.BasePainterData != null)
            {
                if (_terrainLayersDataCount == 0 && BaseRamTerrainManager.BasePainterData.TerrainLayersData.Count == 1)
                {
                    BaseRamTerrainManager.BasePainterData.TerrainLayersData[0].Reset();
                }

                _terrainLayersDataCount = BaseRamTerrainManager.BasePainterData.TerrainLayersData.Count;
            }

            //_lakePolygon.LakePolygonTerrainManager.paramsTexture = (Texture2D) EditorGUILayout.ObjectField("Add a Texture:", _lakePolygon.LakePolygonTerrainManager.paramsTexture, typeof(Texture2D), false);
            //TerrainManager.Texture2DCarve = (RenderTexture) EditorGUILayout.ObjectField("Add a Texture:", TerrainManager.Texture2DCarve, typeof(RenderTexture), false);
            //BaseTerrainManager.Texture2DCarve = (RenderTexture) EditorGUILayout.ObjectField("Add a Texture:", BaseTerrainManager.Texture2DCarve, typeof(RenderTexture), false);
            //if (GUILayout.Button("save carve texture"))
            //    TextureManager.SaveTexture(TerrainManager.Texture2DCarve, TextureFormat.ARGB32);


           // BaseRamTerrainManager.TerrainManager.Texture2DCarve = (RenderTexture)EditorGUILayout.ObjectField("Add a Texture:", BaseRamTerrainManager.TerrainManager.Texture2DCarve,
           //     typeof(RenderTexture), false, GUILayout.MinWidth(512), GUILayout.MinHeight(512));
            //if (GUILayout.Button("save paint texture"))
            //    TextureManager.SaveTexture(BaseRamTerrainManager.TerrainManager.Texture2DCarve, TextureFormat.ARGB32);

            BaseRamTerrainManager.TerrainPainterGetData = (TerrainPainterData)EditorGUILayout.ObjectField("Terrain Painter Profile", BaseRamTerrainManager.TerrainPainterGetData, typeof(TerrainPainterData), false);


            if (GUILayout.Button("Create profile from settings"))
            {
                var asset = ScriptableObject.CreateInstance<TerrainPainterData>();

                asset.SetProfileData(BaseRamTerrainManager.BasePainterData);

                string path = EditorUtility.SaveFilePanelInProject("Save new spline profile",
                    BaseRamTerrainManager.NmSpline.gameObject.name + ".asset", "asset", "Please enter a file name to save the spline profile to");

                if (!string.IsNullOrEmpty(path))
                {
                    AssetDatabase.CreateAsset(asset, path);
                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();
                    BaseRamTerrainManager.TerrainPainterGetData = asset;
                }
            }

            if (BaseRamTerrainManager.TerrainPainterGetData != null && GUILayout.Button("Save profile from settings"))
            {
                //spline.currentProfile.meshCurve = spline.meshCurve;


                BaseRamTerrainManager.TerrainPainterGetData.SetProfileData(BaseRamTerrainManager.BasePainterData);

                EditorUtility.SetDirty(BaseRamTerrainManager.TerrainPainterGetData);

                AssetDatabase.SaveAssets();
                AssetDatabase.Refresh();
            }


            if (BaseRamTerrainManager.TerrainPainterGetData != null && BaseRamTerrainManager.TerrainPainterGetData != BaseRamTerrainManager.TerrainPainterGetDataOld)
            {
                ResetToProfile();
                EditorUtility.SetDirty(BaseRamTerrainManager.BasePainterData);
            }

            bool profileChanged = CheckProfileChange();

           if (BaseRamTerrainManager.TerrainPainterGetData != null &&
                GUILayout.Button("Reset to profile" + (profileChanged ? " (Profile data changed)" : "")))
                if (EditorUtility.DisplayDialog("Reset to profile", "Are you sure you want to reset spline to profile?", "Reset", "Do Not Reset"))
                    ResetToProfile();

            if (BaseRamTerrainManager.BasePainterData == null)
                return;


            int terrainNumber = BaseRamTerrainManager.BasePainterData.TerrainsUnder.Count;


            string[] optionsTerrain = new string[terrainNumber];
            for (int i = 0; i < terrainNumber; i++)
            {
                optionsTerrain[i] = i + " - ";

                if (BaseRamTerrainManager.BasePainterData.TerrainsUnder[i] != null) optionsTerrain[i] += BaseRamTerrainManager.BasePainterData.TerrainsUnder[i].name;
            }


            if (BaseRamTerrainManager.BasePainterData.TerrainsUnder is { Count: > 0 } &&
                BaseRamTerrainManager.BasePainterData.CurrentWorkTerrain >= BaseRamTerrainManager.BasePainterData.TerrainsUnder.Count)
            {
                BaseRamTerrainManager.BasePainterData.CurrentWorkTerrain = 0;
            }
            else if (BaseRamTerrainManager.BasePainterData.TerrainsUnder == null || BaseRamTerrainManager.BasePainterData.TerrainsUnder.Count == 0)
            {
                Debug.Log("No terrain under Spline, add terrain and regenerate Spline");
            }


            if (BaseRamTerrainManager.BasePainterData.WorkTerrain == null)
            {
                EditorGUILayout.HelpBox("No terrain under Spline, add terrain and regenerate Spline", MessageType.Warning);
                if (GUILayout.Button("Generate polygon"))
                {
                    GetTerrains?.Invoke();
                }

                return;
            }

            EditorGUILayout.Space();

            BaseRamTerrainManager.BasePainterData.CurrentWorkTerrain = EditorGUILayout.Popup("Terrain:", BaseRamTerrainManager.BasePainterData.CurrentWorkTerrain, optionsTerrain);


            if (BaseRamTerrainManager.BasePainterData != null && BaseRamTerrainManager.BasePainterData.WorkTerrain != null &&
                BaseRamTerrainManager.BasePainterData.WorkTerrain.terrainData != null)
            {
                if (_terrainPainterDataEditor == null || _terrainPainterDataEditor != null && _terrainPainterDataEditor.target != BaseRamTerrainManager.BasePainterData)
                {
                    _terrainPainterDataEditor = (TerrainPainterDataEditor)UnityEditor.Editor.CreateEditor(BaseRamTerrainManager.BasePainterData);
                }

                if (BaseRamTerrainManager.BasePainterData.TerrainCarveQuality == 0)
                    BaseRamTerrainManager.BasePainterData.TerrainCarveQuality = TerrainPainterData.TerrainCarveQualityEnum.Medium;


                BaseRamTerrainManager.BasePainterData.TerrainCarveQuality = (TerrainPainterData.TerrainCarveQualityEnum)EditorGUILayout.EnumPopup(
                    new GUIContent("Brush quality", "Select the quality level for the terrain carving: VeryLow (256), Low (512), Medium (1024), High (2048), VeryHigh (4096)"),
                    BaseRamTerrainManager.BasePainterData.TerrainCarveQuality);

                bool carveDataChange = _terrainPainterDataEditor.UIBrushAdditional();

                EditorGUILayout.Space();

                BaseRamTerrainManager.BasePainterData.ToolbarInt = GUILayout.Toolbar(BaseRamTerrainManager.BasePainterData.ToolbarInt, BaseRamTerrainManager.BasePainterData.ToolbarStrings);


                if (BaseRamTerrainManager.BasePainterData.ToolbarInt == 0)
                {
                    //EditorGUI.indentLevel++;


                    EditorGUILayout.Space();

                    carveDataChange = carveDataChange || _terrainPainterDataEditor.UICarve();


                    //EditorGUI.indentLevel--;

                    if (!ShowCarveTerrain)
                    {
                        if (GUILayout.Button("Show Terrain Carve"))
                        {
                            ShowCarveTerrain = true;
                            BaseRamTerrainManager.TerrainManager.GenerateTerrainBrushTexture(BaseRamTerrainManager.BasePainterData);
                        }
                    }
                    else
                    {
                        if (GUILayout.Button("Hide Terrain Carve"))
                        {
                            ShowCarveTerrain = false;
                        }
                    }


                    if (GUILayout.Button("Carve Terrain"))
                    {
                        ShowCarveTerrain = false;
                        BaseRamTerrainManager.TerrainManager.CarveTerrain(BaseRamTerrainManager.BasePainterData);
                    }

                    if (carveDataChange)
                    {
                        if (ShowCarveTerrain)
                            BaseRamTerrainManager.TerrainManager.GenerateTerrainBrushTexture(BaseRamTerrainManager.BasePainterData);
                    }
                }
                else if (BaseRamTerrainManager.BasePainterData.ToolbarInt == 1)
                {
                    ShowCarveTerrain = false;
                    EditorGUILayout.Space();
                    //EditorGUI.indentLevel++;

                    //_lakePolygon.TerrainPainterData.TerrainLayerData.power =EditorGUILayout.CurveField("Terrain paint", _lakePolygon.TerrainPainterData.TerrainLayerData.power);

                    int splatNumber = BaseRamTerrainManager.BasePainterData.WorkTerrain.terrainData.terrainLayers.Length;
                    if (splatNumber > 0)
                    {
                        if (BaseRamTerrainManager.BasePainterData != null)
                        {
                            _terrainPainterDataEditor.UILayers(true);
                        }


                        if (GUILayout.Button("Paint Terrain"))
                        {
                            BaseRamTerrainManager.TerrainManager.PaintTerrain(BaseRamTerrainManager.BasePainterData);
                        }
                    }
                    else
                    {
                        EditorGUILayout.Space();
                        EditorGUILayout.HelpBox("Terrain has no Splatmaps.", MessageType.Info);
                    }
                }
                else
                {
                    ShowCarveTerrain = false;
                    EditorGUILayout.Space();
                    _terrainPainterDataEditor.UIDistanceClearFoliage();


                    if (GUILayout.Button("Remove Details Foliage"))
                    {
                        ShowCarveTerrain = false;
                        TerrainClearFoliage.TerrainClearTrees(BaseRamTerrainManager.NmSpline, BaseRamTerrainManager.BasePainterData.DistanceClearFoliage);
                    }

                    _terrainPainterDataEditor.UIDistanceClearFoliageTrees();

                    if (GUILayout.Button("Remove Trees"))
                    {
                        ShowCarveTerrain = false;
                        TerrainClearFoliage.TerrainClearTrees(BaseRamTerrainManager.NmSpline, BaseRamTerrainManager.BasePainterData.DistanceClearFoliageTrees, false);
                    }
                }
            }
            else
            {
                EditorGUILayout.Space();
                EditorGUILayout.HelpBox("No Terrain On Scene. Try to regenerate lake.", MessageType.Info);

                if (GUILayout.Button("Remove Trees"))
                {
                    ShowCarveTerrain = false;
                    TerrainClearFoliage.TerrainClearTrees(BaseRamTerrainManager.NmSpline, BaseRamTerrainManager.BasePainterData.DistanceClearFoliageTrees, false);
                }
            }
        }

        private bool CheckProfileChange()
        {
            return BaseRamTerrainManager.BasePainterData.CheckProfileChange(BaseRamTerrainManager.TerrainPainterGetData);
        }

        private void ResetToProfile()
        {
            BaseRamTerrainManager.BasePainterData.SetProfileData(BaseRamTerrainManager.TerrainPainterGetData);

            BaseRamTerrainManager.TerrainPainterGetDataOld = BaseRamTerrainManager.TerrainPainterGetData;
        }

        public void OnSceneGui()
        {
            if (!_showCarveTerrain)
                return;


            // Don't render preview if this isn't a repaint. losing performance if we do
            if (Event.current.type != EventType.Repaint)
            {
                return;
            }


            //Debug.Log("DrawBrushPreview " + texture2D + " " + terrain.name);

            //Debug.Log($"textureCoord {raycastHit.textureCoord.x} {raycastHit.textureCoord.y}");
            BrushTransform brushTransform = TerrainPaintUtility.CalculateBrushTransform(BaseRamTerrainManager.TerrainManager.TerrainUV, BaseRamTerrainManager.TerrainManager.TextureCoord,
                BaseRamTerrainManager.TerrainManager.BrushSize, 0);

            //Debug.Log(brushXform.brushOrigin + " " + brushXform.targetOrigin);
            PaintContext paintContext = TerrainPaintUtility.BeginPaintHeightmap(BaseRamTerrainManager.TerrainManager.TerrainUV, brushTransform.GetBrushXYBounds(), 1);

            Material material = TerrainPaintUtilityEditor.GetDefaultBrushPreviewMaterial();
            // Material material =  new Material(Shader.Find("Debug Terrain Carve"));

            TerrainPaintUtilityEditor.DrawBrushPreview(
                paintContext, TerrainBrushPreviewMode.SourceRenderTexture, BaseRamTerrainManager.TerrainManager.Texture2DCarve, brushTransform, material, 0);


            // draw result preview
            {
                //Debug.Log($"strength {_newHeight / terrain.terrainData.size.y}");
                BaseRamTerrainManager.TerrainManager.BrushCarve(paintContext, BaseRamTerrainManager.BasePainterData.Smooth, BaseRamTerrainManager.TerrainManager.ParamsTextureCarve,
                    BaseRamTerrainManager.BasePainterData.TerrainNoiseParametersCarve, BaseRamTerrainManager.TerrainManager.Texture2DCarve, brushTransform);

                // restore old render target
                RenderTexture.active = paintContext.oldRenderTexture;

                material.SetTexture(TerrainManager.HeightmapOrig, paintContext.sourceRenderTexture);
                TerrainPaintUtilityEditor.DrawBrushPreview(
                    paintContext, TerrainBrushPreviewMode.DestinationRenderTexture, BaseRamTerrainManager.TerrainManager.Texture2DCarve, brushTransform, material, 2);
            }

            TerrainPaintUtility.ReleaseContextResources(paintContext);
        }
    }
}
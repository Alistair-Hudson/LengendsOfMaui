using UnityEditorInternal;

namespace NatureManufacture.RAM.Editor
{
    using System.Collections;
    using System.Collections.Generic;
    using NatureManufacture.RAM;
    using UnityEditor;
    using UnityEngine;

    public class TerrainSplinesManager : EditorWindow
    {
        private readonly TerrainManager _terrainManager = new TerrainManager();
        private TerrainSplinesManagerDataHolder _dataHolder;

        private SerializedObject _serializedDataHolder;
        private ReorderableList _reorderableList;
        private SerializedProperty _terrainPainterData;

        [MenuItem("Tools/Nature Manufacture/Terrain Splines Manager")]
        public static void ShowWindow()
        {
            GetWindow<TerrainSplinesManager>("Terrain Splines Manager");
        }

        private void OnEnable()
        {
            GetDataObject();
        }

        private void GetDataObject()
        {
            GameObject dataHolderObject = GameObject.Find("TerrainSplineDataHolder");

            if (dataHolderObject == null)
            {
                dataHolderObject = new GameObject("TerrainSplineDataHolder");
            }

            // This makes the GameObject hidden in the hierarchy
            dataHolderObject.hideFlags = HideFlags.HideInHierarchy | HideFlags.DontSaveInBuild;
            //dataHolderObject.hideFlags = HideFlags.None;

            _dataHolder = dataHolderObject.GetComponent<TerrainSplinesManagerDataHolder>();

            if (_dataHolder == null)
            {
                _dataHolder = dataHolderObject.AddComponent<TerrainSplinesManagerDataHolder>();
            }

            _serializedDataHolder = new SerializedObject(_dataHolder);
            _terrainPainterData = _serializedDataHolder.FindProperty("terrainPainterData");

            _reorderableList = new ReorderableList(_serializedDataHolder, _serializedDataHolder.FindProperty("terrainPainterObjects"), true, true, true, true)
            {
                drawHeaderCallback = (Rect rect) => { EditorGUI.LabelField(rect, "Terrain Splines"); },

                drawElementCallback = (Rect rect, int index, bool isActive, bool isFocused) =>
                {
                    SerializedProperty element = _reorderableList.serializedProperty.GetArrayElementAtIndex(index);
                    rect.y += 2;
                    EditorGUI.PropertyField(new Rect(rect.x, rect.y, rect.width, EditorGUIUtility.singleLineHeight), element, GUIContent.none);
                }
            };
        }

        private void OnGUI()
        {
            if (_serializedDataHolder.targetObject == null)
            {
                GetDataObject();
                return;
            }

            _serializedDataHolder.Update();

            EditorGUILayout.Space();


            _reorderableList.DoLayoutList();


            //get only terrain splines
            if (GUILayout.Button("Get Only Terrain Splines"))
            {
                TerrainSpline[] terrainSplines = FindObjectsByType<TerrainSpline>(FindObjectsSortMode.None);
                _dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(terrainSplines);
                _serializedDataHolder.Update();
            }

            //get only lake polygons
            if (GUILayout.Button("Get Only Lake Polygons"))
            {
                LakePolygon[] lakePolygons = FindObjectsByType<LakePolygon>(FindObjectsSortMode.None);
                _dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(lakePolygons);
                _serializedDataHolder.Update();
            }

            //get only ram splines
            if (GUILayout.Button("Get Only Ram Splines"))
            {
                RamSpline[] ramSplines = FindObjectsByType<RamSpline>(FindObjectsSortMode.None);
                _dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(ramSplines);
                _serializedDataHolder.Update();
            }


            if (GUILayout.Button("Get All Spline Painters"))
            {
                TerrainSpline[] terrainSplines = FindObjectsByType<TerrainSpline>(FindObjectsSortMode.None);
                LakePolygon[] lakePolygons = FindObjectsByType<LakePolygon>(FindObjectsSortMode.None);
                RamSpline[] ramSplines = FindObjectsByType<RamSpline>(FindObjectsSortMode.None);

                _dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(terrainSplines);
                AddRangeWithoutDuplicates(lakePolygons);
                AddRangeWithoutDuplicates(ramSplines);
                _serializedDataHolder.Update();
            }

            if (GUILayout.Button("Clear All Spline Painters"))
            {
                _dataHolder.TerrainPainterObjects.Clear();
                _serializedDataHolder.Update();
            }


        

            EditorGUILayout.Space();


            if (GUILayout.Button("Paint All Terrain Splines"))
            {
                if (EditorUtility.DisplayDialog("Confirmation", "Are you sure you want to paint all terrains?", "Yes", "No"))
                {
                    List<ITerrainPainterGetData> terrainPainterDatas = _dataHolder.GetTerrainPainterObjects();

                    for (int i = 0; i < terrainPainterDatas.Count; i++)
                    {
                        ITerrainPainterGetData terrainSpline = terrainPainterDatas[i];

                        if (PrepareTerrainSpline(terrainSpline)) continue;

                        _terrainManager.PaintTerrain(terrainSpline.RamTerrainManager.BasePainterData);

                        // Calculate progress as a float between 0 and 1 and display it
                        float progress = (float)i / terrainPainterDatas.Count;
                        if (EditorUtility.DisplayCancelableProgressBar("Painting progress", $"Painting {i + 1}/{terrainPainterDatas.Count}", progress))
                        {
                            // If the user clicked the Cancel button, break out of the loop
                            break;
                        }
                    }

                    // Clear the progress bar when the operation is complete
                    EditorUtility.ClearProgressBar();
                }
            }

            if (GUILayout.Button("Carve All Terrains"))
            {
                // Display a confirmation dialog
                if (EditorUtility.DisplayDialog("Confirmation", "Are you sure you want to carve all terrains?", "Yes", "No"))
                {
                    List<ITerrainPainterGetData> terrainPainterDatas = _dataHolder.GetTerrainPainterObjects();
                    for (int i = 0; i < terrainPainterDatas.Count; i++)
                    {
                        ITerrainPainterGetData terrainSpline = terrainPainterDatas[i];

                        if (PrepareTerrainSpline(terrainSpline)) continue;

                        _terrainManager.CarveTerrain(terrainSpline.RamTerrainManager.BasePainterData);

                        // Calculate progress as a float between 0 and 1 and display it
                        float progress = (float)i / terrainPainterDatas.Count;
                        if (EditorUtility.DisplayCancelableProgressBar("Carving progress", $"Carving {i + 1}/{terrainPainterDatas.Count}", progress))
                        {
                            // If the user clicked the Cancel button, break out of the loop
                            break;
                        }
                    }
                }
            }

            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(_terrainPainterData, true);

            if (GUILayout.Button("Paint All Terrain Splines"))
            {
                // Display a confirmation dialog
                if (EditorUtility.DisplayDialog("Confirmation", "Are you sure you want to paint all terrains?", "Yes", "No"))
                {
                    if (PrepareForTerrainData())
                        _terrainManager.PaintTerrain(_dataHolder.PainterData);
                }
            }

            if (GUILayout.Button("Carve All Terrains With Painter Data"))
            {
                // Display a confirmation dialog
                if (EditorUtility.DisplayDialog("Confirmation", "Are you sure you want to carve all terrains?", "Yes", "No"))
                {
                    if (PrepareForTerrainData())
                        _terrainManager.CarveTerrain(_dataHolder.PainterData);
                }
            }
            
            _serializedDataHolder.ApplyModifiedProperties();
        }

        private bool PrepareForTerrainData()
        {
            List<ITerrainPainterGetData> terrainPainterDatas = _dataHolder.GetTerrainPainterObjects();
            _terrainManager.MeshFilters.Clear();
            HashSet<Terrain> terrainsUnder = new HashSet<Terrain>();
            for (int i = 0; i < terrainPainterDatas.Count; i++)
            {
                ITerrainPainterGetData terrainSpline = terrainPainterDatas[i];
                if (terrainSpline == null) continue;

                terrainSpline.GenerateForTerrain();

                if (terrainSpline.MainMeshFilter == null) continue;
                _terrainManager.MeshFilters.Add(terrainSpline.MainMeshFilter);

                if (terrainSpline.RamTerrainManager.BasePainterData != null)
                    terrainsUnder.UnionWith(terrainSpline.RamTerrainManager.BasePainterData.TerrainsUnder);
            }

            if (_terrainManager.MeshFilters.Count <= 0 || terrainsUnder.Count <= 0) return false;

            _dataHolder.PainterData.TerrainsUnder.Clear();
            _dataHolder.PainterData.TerrainsUnder.AddRange(terrainsUnder);

            return true;
        }


        private void AddRangeWithoutDuplicates(Object[] terrainSplines)
        {
            foreach (Object terrainSpline in terrainSplines)
            {
                if (terrainSpline != null && !_dataHolder.TerrainPainterObjects.Contains(terrainSpline))
                {
                    _dataHolder.TerrainPainterObjects.Add(terrainSpline);
                }
            }
        }

        private bool PrepareTerrainSpline(ITerrainPainterGetData terrainSpline)
        {
            if (terrainSpline == null) return true;

            terrainSpline.GenerateForTerrain();

            if (CheckTerrainSpline(terrainSpline)) return true;

            _terrainManager.MeshFilters.Clear();
            _terrainManager.MeshFilters.Add(terrainSpline.MainMeshFilter);
            return false;
        }

        private static bool CheckTerrainSpline(ITerrainPainterGetData terrainSpline)
        {
            if (terrainSpline.MainMeshFilter == null)
                return true;
            if (terrainSpline.RamTerrainManager.BasePainterData == null)
                return true;

            return terrainSpline.RamTerrainManager.BasePainterData.TerrainsUnder.Count == 0;
        }
    }
}
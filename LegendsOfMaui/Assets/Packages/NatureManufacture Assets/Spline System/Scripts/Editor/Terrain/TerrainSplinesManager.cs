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
        private readonly TerrainManager terrainManager = new TerrainManager();
        private TerrainSplinesManagerDataHolder dataHolder;

        private SerializedObject serializedDataHolder;
        private ReorderableList reorderableList;

        [MenuItem("Tools/Nature Manufacture/Terrain Splines Manager")]
        public static void ShowWindow()
        {
            GetWindow<TerrainSplinesManager>("Terrain Splines Manager");
        }

        private void OnEnable()
        {
            GameObject dataHolderObject = GameObject.Find("TerrainSplineDataHolder");

            if (dataHolderObject == null)
            {
                dataHolderObject = new GameObject("TerrainSplineDataHolder");
            }

            // This makes the GameObject hidden in the hierarchy
            dataHolderObject.hideFlags = HideFlags.HideInHierarchy | HideFlags.DontSaveInBuild;
            //dataHolderObject.hideFlags = HideFlags.None;

            dataHolder = dataHolderObject.GetComponent<TerrainSplinesManagerDataHolder>();

            if (dataHolder == null)
            {
                dataHolder = dataHolderObject.AddComponent<TerrainSplinesManagerDataHolder>();
            }

            serializedDataHolder = new SerializedObject(dataHolder);

            reorderableList = new ReorderableList(serializedDataHolder, serializedDataHolder.FindProperty("terrainPainterObjects"), true, true, true, true)
            {
                drawHeaderCallback = (Rect rect) => { EditorGUI.LabelField(rect, "Terrain Splines"); },

                drawElementCallback = (Rect rect, int index, bool isActive, bool isFocused) =>
                {
                    SerializedProperty element = reorderableList.serializedProperty.GetArrayElementAtIndex(index);
                    rect.y += 2;
                    EditorGUI.PropertyField(new Rect(rect.x, rect.y, rect.width, EditorGUIUtility.singleLineHeight), element, GUIContent.none);
                }
            };
        }

        private void OnGUI()
        {
            serializedDataHolder.Update();
            EditorGUILayout.Space();

            reorderableList.DoLayoutList();

            //get only terrain splines
            if (GUILayout.Button("Get Only Terrain Splines"))
            {
                TerrainSpline[] terrainSplines = FindObjectsByType<TerrainSpline>(FindObjectsSortMode.None);
                dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(terrainSplines);
                serializedDataHolder.Update();
            }

            //get only lake polygons
            if (GUILayout.Button("Get Only Lake Polygons"))
            {
                LakePolygon[] lakePolygons = FindObjectsByType<LakePolygon>(FindObjectsSortMode.None);
                dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(lakePolygons);
                serializedDataHolder.Update();
            }

            //get only ram splines
            if (GUILayout.Button("Get Only Ram Splines"))
            {
                RamSpline[] ramSplines = FindObjectsByType<RamSpline>(FindObjectsSortMode.None);
                dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(ramSplines);
                serializedDataHolder.Update();
            }


            if (GUILayout.Button("Get All Spline Painters"))
            {
                TerrainSpline[] terrainSplines = FindObjectsByType<TerrainSpline>(FindObjectsSortMode.None);
                LakePolygon[] lakePolygons = FindObjectsByType<LakePolygon>(FindObjectsSortMode.None);
                RamSpline[] ramSplines = FindObjectsByType<RamSpline>(FindObjectsSortMode.None);

                dataHolder.TerrainPainterObjects.Clear();
                AddRangeWithoutDuplicates(terrainSplines);
                AddRangeWithoutDuplicates(lakePolygons);
                AddRangeWithoutDuplicates(ramSplines);
                serializedDataHolder.Update();
            }

            if (GUILayout.Button("Clear All Spline Painters"))
            {
                dataHolder.TerrainPainterObjects.Clear();
                serializedDataHolder.Update();
            }


            serializedDataHolder.ApplyModifiedProperties();

            EditorGUILayout.Space();


            if (GUILayout.Button("Paint All Terrain Splines"))
            {
                List<ITerrainPainterGetData> terrainPainterDatas = dataHolder.GetTerrainPainterObjects();

                for (int i = 0; i < terrainPainterDatas.Count; i++)
                {
                    ITerrainPainterGetData terrainSpline = terrainPainterDatas[i];

                    if (PrepareTerrainSpline(terrainSpline)) continue;

                    terrainManager.PaintTerrain(terrainSpline.RamTerrainManager.BasePainterData);

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

            if (GUILayout.Button("Carve All Terrains"))
            {
                // Display a confirmation dialog
                if (EditorUtility.DisplayDialog("Confirmation", "Are you sure you want to carve all terrains?", "Yes", "No"))
                {
                    List<ITerrainPainterGetData> terrainPainterDatas = dataHolder.GetTerrainPainterObjects();
                    for (int i = 0; i < terrainPainterDatas.Count; i++)
                    {
                        ITerrainPainterGetData terrainSpline = terrainPainterDatas[i];

                        if (PrepareTerrainSpline(terrainSpline)) continue;

                        terrainManager.CarveTerrain(terrainSpline.RamTerrainManager.BasePainterData);

                        // Calculate progress as a float between 0 and 1 and display it
                        float progress = (float)i / terrainPainterDatas.Count;
                        if (EditorUtility.DisplayCancelableProgressBar("Painting progress", $"Painting {i + 1}/{terrainPainterDatas.Count}", progress))
                        {
                            // If the user clicked the Cancel button, break out of the loop
                            break;
                        }
                    }
                }
            }
        }

        private void AddRangeWithoutDuplicates(Object[] terrainSplines)
        {
            foreach (Object terrainSpline in terrainSplines)
            {
                if (terrainSpline != null && !dataHolder.TerrainPainterObjects.Contains(terrainSpline))
                {
                    dataHolder.TerrainPainterObjects.Add(terrainSpline);
                }
            }
        }

        private bool PrepareTerrainSpline(ITerrainPainterGetData terrainSpline)
        {
            if (terrainSpline == null) return true;

            terrainSpline.GenerateForTerrain();

            if (CheckTerrainSpline(terrainSpline)) return true;

            terrainManager.MeshFilters.Clear();
            terrainManager.MeshFilters.Add(terrainSpline.MainMeshFilter);
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
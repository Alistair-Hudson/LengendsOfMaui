namespace NatureManufacture.RAM.Editor
{
    using UnityEngine;
    using UnityEditor;
    using UnityEngine.Rendering;
#if VEGETATION_STUDIO_PRO
using AwesomeTechnologies.VegetationSystem;
#endif

    [CustomEditor(typeof(LakePolygonProfile)), CanEditMultipleObjects]
    public class LakePolygonProfileEditor : Editor
    {
        private void OnSceneDrag(SceneView sceneView, int index)
        {
            Event e = Event.current;

            GameObject go = HandleUtility.PickGameObject(e.mousePosition, false);
            if (!go)
                return;

            var lakePolygon = go.GetComponent<LakePolygon>();


            switch (e.type)
            {
                case EventType.DragUpdated:
                {
                    DragAndDrop.visualMode = lakePolygon ? DragAndDropVisualMode.Link : DragAndDropVisualMode.Rejected;

                    e.Use();
                    break;
                }
                case EventType.DragPerform when lakePolygon == null:
                    return;
                case EventType.DragPerform:
                {
                    LakePolygonProfile lakePolygonProfile = (LakePolygonProfile)DragAndDrop.objectReferences[0];

                    DragAndDrop.visualMode = DragAndDropVisualMode.Copy;

                    Undo.RecordObject(lakePolygon, "Lake changed");
                    var lakePolygonEditor = (LakePolygonEditor)CreateEditor(lakePolygon);

                    lakePolygon.currentProfile = lakePolygonProfile;
                    lakePolygonEditor.ResetToProfile();
                    lakePolygon.GeneratePolygon();
                    EditorUtility.SetDirty(lakePolygon);

                    DestroyImmediate(lakePolygonEditor);


                    DragAndDrop.AcceptDrag();
                    e.Use();
                    break;
                }
            }
        }

        public override void OnInspectorGUI()
        {
            EditorGUI.BeginChangeCheck();

            LakePolygonProfile lakePolygon = (LakePolygonProfile)target;
            GUILayout.Label("Basic: ", EditorStyles.boldLabel);
            lakePolygon.lakeMaterial = (Material)EditorGUILayout.ObjectField("Material", lakePolygon.lakeMaterial, typeof(Material), false);

            GUILayout.Label("Mesh settings:", EditorStyles.boldLabel);
            EditorGUI.indentLevel++;

            lakePolygon.maximumTriangleAmount = EditorGUILayout.FloatField("Maximum triangle amount", lakePolygon.maximumTriangleAmount);
            lakePolygon.maximumTriangleSize = EditorGUILayout.FloatField("Maximum triangle size", lakePolygon.maximumTriangleSize);
            lakePolygon.triangleDensity = (float)EditorGUILayout.IntSlider("Spline density", (int)(lakePolygon.triangleDensity), 1, 100);
            lakePolygon.uvScale = EditorGUILayout.FloatField("UV scale", lakePolygon.uvScale);
            lakePolygon.snapMask = LayerMaskField.ShowLayerMaskField("Layers", lakePolygon.snapMask, true);
            lakePolygon.NormalFromRaycast =
                EditorGUILayout.Toggle("Take Normal from terrain", lakePolygon.NormalFromRaycast);
            if (lakePolygon.NormalFromRaycast)
            {
                EditorGUI.indentLevel++;
                lakePolygon.NormalFromRaycastLerp = EditorGUILayout.Slider("Normal from terrain lerp", lakePolygon.NormalFromRaycastLerp, 0, 1);
                EditorGUI.indentLevel--;
            }


            GUILayout.Label("Flow Map Automatic: ", EditorStyles.boldLabel);
            lakePolygon.automaticFlowMapScale = EditorGUILayout.FloatField("Automatic speed", lakePolygon.automaticFlowMapScale);
            lakePolygon.noiseFlowMap = EditorGUILayout.Toggle("Add noise", lakePolygon.noiseFlowMap);
            if (lakePolygon.noiseFlowMap)
            {
                EditorGUI.indentLevel++;
                lakePolygon.noiseMultiplierFlowMap = EditorGUILayout.FloatField("Noise multiplier inside", lakePolygon.noiseMultiplierFlowMap);
                lakePolygon.noiseSizeXFlowMap = EditorGUILayout.FloatField("Noise scale X", lakePolygon.noiseSizeXFlowMap);
                lakePolygon.noiseSizeZFlowMap = EditorGUILayout.FloatField("Noise scale Z", lakePolygon.noiseSizeZFlowMap);
                EditorGUI.indentLevel--;
            }


            GUILayout.Label("Lightning settings:", EditorStyles.boldLabel);

            EditorGUI.indentLevel++;
            lakePolygon.receiveShadows = EditorGUILayout.Toggle("Receive Shadows", lakePolygon.receiveShadows);

            lakePolygon.shadowCastingMode = (ShadowCastingMode)EditorGUILayout.EnumPopup("Shadow Casting Mode", lakePolygon.shadowCastingMode);
            EditorGUI.indentLevel--;

            EditorGUILayout.Space();
            GUILayout.Label("Terrain settings:", EditorStyles.boldLabel);
            EditorGUI.indentLevel++;
            lakePolygon.PainterData = (TerrainPainterData)EditorGUILayout.ObjectField("Terrain Painter Data", lakePolygon.PainterData, typeof(TerrainPainterData), false);

            EditorGUI.indentLevel--;

#if VEGETATION_STUDIO_PRO
        GUILayout.Label("Vegetation stuio pro:", EditorStyles.boldLabel);
        lakePolygon.biomeType = System.Convert.ToInt32(EditorGUILayout.EnumPopup("Select biome", (BiomeType)lakePolygon.biomeType));
#else
            GUILayout.Label("Vegetation studio:", EditorStyles.boldLabel);
            lakePolygon.biomeType = EditorGUILayout.IntField("Select biome", lakePolygon.biomeType);
#endif
            EditorGUILayout.Space();
            GUILayout.Label("Vertex Color Automatic: ", EditorStyles.boldLabel);
            EditorGUI.indentLevel++;
            lakePolygon.redColorCurve = EditorGUILayout.CurveField("Red color curve", lakePolygon.redColorCurve);
            lakePolygon.greenColorCurve = EditorGUILayout.CurveField("Green color curve", lakePolygon.greenColorCurve);
            lakePolygon.blueColorCurve = EditorGUILayout.CurveField("Blue color curve", lakePolygon.blueColorCurve);
            lakePolygon.alphaColorCurve = EditorGUILayout.CurveField("Alpha color curve", lakePolygon.alphaColorCurve);
            EditorGUI.indentLevel--;


            if (EditorGUI.EndChangeCheck())
            {
                EditorUtility.SetDirty(lakePolygon);
                // AssetDatabase.Refresh();
            }
        }
    }
}
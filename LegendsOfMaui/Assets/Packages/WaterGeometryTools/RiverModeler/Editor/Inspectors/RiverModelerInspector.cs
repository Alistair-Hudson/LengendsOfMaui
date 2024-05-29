// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;
using UnityEditor.EditorTools;
using UnityEngine;

#if SPLINES
using UnityEngine.Splines;
using UnityEditor.Splines;
#endif

namespace sc.modeling.river.editor
{
    [CustomEditor(typeof(RiverModeler))]
    [CanEditMultipleObjects]
    public class RiverModelerInspector : Editor
    {
        //References
        private SerializedProperty splineContainer;
        private SerializedProperty meshFilter;
        private SerializedProperty orderInLayer;
        
        private SerializedProperty settings;
        private SerializedProperty triangulation;
        private SerializedProperty shape;
        private SerializedProperty displacement;
        private SerializedProperty uv;
        private SerializedProperty foam;
        private SerializedProperty transparency;

        private SerializedProperty debugMode;
        
        private SerializedProperty microVerseSettings;
        
        private SerializedProperty exportToFBX;
        private SerializedProperty fbxFilePath;

        private SerializedProperty onPreRebuild;
        private SerializedProperty onPostRebuild;

        #if MICROVERSE_SPLINES
        private const bool MICROVERSE_INSTALLED = true;
        #else
        private const bool MICROVERSE_INSTALLED = false;
        #endif
        
        private static bool ExpandMesh
        {
            get => SessionState.GetBool("RM_EXPAND_MESH", true);
            set => SessionState.SetBool("RM_EXPAND_MESH", value);
        }
        private static bool ExpandEvents
        {
            get => SessionState.GetBool("RM_EXPAND_EVENTS", false);
            set => SessionState.SetBool("RM_EXPAND_EVENTS", value);
        }
        private static bool ExpandMV
        {
            get => SessionState.GetBool("RM_EXPAND_MV", false);
            set => SessionState.SetBool("RM_EXPAND_MV", value);
        }
        private static bool ExpandExport
        {
            get => SessionState.GetBool("RM_EXPAND_EXPORT", false);
            set => SessionState.SetBool("RM_EXPAND_EXPORT", value);
        }

        private RiverModeler.ChangeFlags changeFlags;
        private bool requiresRebuild = false;
        private System.Diagnostics.Stopwatch rebuildTimer;

        private void OnEnable()
        {
            rebuildTimer = new System.Diagnostics.Stopwatch();

            #if SPLINES
            splineContainer = serializedObject.FindProperty("splineContainer");
            #endif
            meshFilter = serializedObject.FindProperty("meshFilter");
            orderInLayer = serializedObject.FindProperty("orderInLayer");
            
            settings = serializedObject.FindProperty("settings");
            {
                triangulation = settings.FindPropertyRelative("triangulation");
                shape = settings.FindPropertyRelative("shape");
                displacement = settings.FindPropertyRelative("displacement");
                uv = settings.FindPropertyRelative("uv");
                foam = settings.FindPropertyRelative("foam");
                transparency = settings.FindPropertyRelative("transparency");
            }
            
            debugMode = serializedObject.FindProperty("debugMode");

            #pragma warning disable CS0162
            if (MICROVERSE_INSTALLED)
            {
                microVerseSettings = serializedObject.FindProperty("microVerseSettings");
            }
            #pragma warning restore CS0162

            exportToFBX = serializedObject.FindProperty("exportToFBX");
            fbxFilePath = serializedObject.FindProperty("fbxFilePath");
            
            onPreRebuild = serializedObject.FindProperty("onPreRebuild");
            onPostRebuild = serializedObject.FindProperty("onPostRebuild");
        }

        private void OnDisable()
        {
            ExportToFBX();
        }

        public override void OnInspectorGUI()
        {
            //base.OnInspectorGUI();

            UI.DrawHeader(Asset.NAME, Asset.VERSION);

            #if !SPLINES || !MATHEMATICS
            #if !SPLINES
            EditorGUILayout.HelpBox("The Spline package isn't installed, please install this through the Package Manager", MessageType.Error);
            #endif
            #if !MATHEMATICS
            EditorGUILayout.HelpBox("The Mathematics package isn't installed or outdated, please install this through the Package Manager", MessageType.Error);
            #endif

            return;
            #else
            //Reset
            changeFlags = RiverModeler.ChangeFlags.All;
            requiresRebuild = false;

            serializedObject.Update();
            EditorGUI.BeginChangeCheck();
            
            EditorGUILayout.LabelField("Source", EditorStyles.boldLabel);
            using (new EditorGUILayout.HorizontalScope())
            {
                EditorGUI.BeginChangeCheck();
                EditorGUILayout.PropertyField(splineContainer);
                if (EditorGUI.EndChangeCheck())
                {
                    if (splineContainer.objectReferenceValue)
                    {
                        foreach (var target in targets)
                        {
                            ((RiverModeler)target).ValidateData(splineContainer.objectReferenceValue as SplineContainer);
                        }
                        
                        changeFlags |= RiverModeler.ChangeFlags.Spline;
                        requiresRebuild = true;
                    }
                }

                EditorGUI.BeginDisabledGroup(splineContainer.objectReferenceValue == null);
                if (GUILayout.Button("Edit", EditorStyles.miniButton, GUILayout.Width(50f)))
                {
                    Selection.activeGameObject = ((RiverModeler)target).splineContainer.gameObject;
                    EditorApplication.delayCall += ToolManager.SetActiveContext<SplineToolContext>;
                }                    

                EditorGUI.EndDisabledGroup();
            }
            if (splineContainer.objectReferenceValue)
            {
                EditorGUILayout.Space(); 

                EditorGUILayout.LabelField("Destination", EditorStyles.boldLabel);
                EditorGUI.BeginChangeCheck();
                EditorGUILayout.PropertyField(meshFilter);
                if (EditorGUI.EndChangeCheck())
                {
                    changeFlags |= RiverModeler.ChangeFlags.Geometry;
                    requiresRebuild = true;
                }
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(orderInLayer);
                EditorGUI.indentLevel--;

                EditorGUILayout.Space(); 
                
                EditorGUILayout.PropertyField(debugMode, new GUIContent("Visualize"));
                    
                EditorGUILayout.Space();
                
                if (meshFilter.objectReferenceValue)
                {
                    ExpandMesh = EditorGUILayout.Foldout(ExpandMesh, "Mesh generation settings", EditorStyles.foldoutHeader);
                    
                    EditorGUILayout.BeginFadeGroup(ExpandMesh ? 1f : 0.001f);
                    {
                        EditorGUI.indentLevel++;

                        EditorGUI.BeginChangeCheck();
                        
                        EditorGUILayout.PropertyField(triangulation);
                        EditorGUILayout.PropertyField(shape);
                        EditorGUILayout.PropertyField(displacement);

                        if (EditorGUI.EndChangeCheck())
                        {
                            changeFlags |= RiverModeler.ChangeFlags.Geometry;
                            requiresRebuild = true;
                        }
                        
                        if (displacement.isExpanded)
                        {
                            using (new EditorGUILayout.HorizontalScope())
                            {
                                GUILayout.FlexibleSpace();

                                if (GUILayout.Button(new GUIContent("Open Editor")))
                                {
                                    ToolManager.SetActiveTool<ScaleTool>();
                                }
                            }
                        }

                        EditorGUI.BeginChangeCheck();

                        EditorGUILayout.PropertyField(uv, new GUIContent("UV Coordinates", "Controls the UV coordinates, used for tiling and animating textures in the shader"));
                        
                        if (EditorGUI.EndChangeCheck())
                        {
                            changeFlags |= RiverModeler.ChangeFlags.VertexAttribute;
                            requiresRebuild = true;
                        }
                        
                        EditorGUI.BeginChangeCheck();

                        EditorGUILayout.PropertyField(foam);

                        if (EditorGUI.EndChangeCheck())
                        {
                            changeFlags |= RiverModeler.ChangeFlags.VertexAttribute | RiverModeler.ChangeFlags.Foam;
                            requiresRebuild = true;
                        }
                        
                        if (foam.isExpanded)
                        {
                            using (new EditorGUILayout.HorizontalScope())
                            {
                                GUILayout.FlexibleSpace();

                                if (GUILayout.Button(new GUIContent("Open Editor")))
                                {
                                    ToolManager.SetActiveTool<FoamTool>();
                                }
                            }
                        }
                        
                        EditorGUI.BeginChangeCheck();

                        EditorGUILayout.PropertyField(transparency);

                        if (EditorGUI.EndChangeCheck())
                        {
                            changeFlags |= RiverModeler.ChangeFlags.VertexAttribute;
                            requiresRebuild = true;
                        }

                        if (transparency.isExpanded)
                        {
                            using (new EditorGUILayout.HorizontalScope())
                            {
                                GUILayout.FlexibleSpace();

                                if (GUILayout.Button(new GUIContent("Open Editor")))
                                {
                                    ToolManager.SetActiveTool<TransparencyTool>();
                                }
                            }
                        }
                        EditorGUI.indentLevel--;
                    }
                    EditorGUILayout.EndFadeGroup();

                    EditorGUILayout.Space();
                    
                    ExpandEvents = EditorGUILayout.Foldout(ExpandEvents, "Events", EditorStyles.foldoutHeader);
                    EditorGUILayout.BeginFadeGroup(ExpandEvents ? 1f : 0.001f);
                    {
                        EditorGUILayout.PropertyField(onPreRebuild);
                        EditorGUILayout.PropertyField(onPostRebuild);
                    }
                    EditorGUILayout.EndFadeGroup();

                    EditorGUILayout.Space();

                    //EditorGUILayout.LabelField("MicroVerse integration", EditorStyles.boldLabel);
                    ExpandMV = EditorGUILayout.Foldout(ExpandMV, "MicroVerse integration", EditorStyles.foldoutHeader);
                    EditorGUILayout.BeginFadeGroup(ExpandMV ? 1f : 0.001f);
                    {
                        #pragma warning disable CS0162
                        if (MICROVERSE_INSTALLED)
                        {
                            microVerseSettings.isExpanded = true;
                            
                            EditorGUI.BeginChangeCheck();

                            EditorGUILayout.PropertyField(microVerseSettings, true);

                            if (EditorGUI.EndChangeCheck())
                            {
                                changeFlags |= RiverModeler.ChangeFlags.Data;
                                
                                foreach (var target in targets)
                                {
                                    ((RiverModeler)target).UpdateMicroVerseSpline();
                                }
                            }

                        }
                        else
                        {
                            UI.DrawActionBox("The MicroVerse Splines module isn't installed", MessageType.Info, "Open Store Page", () => UI.OpenStorePage(232974, "rivermodelereditor"));

                            EditorGUILayout.HelpBox("The MicroVerse asset, with its Splines module, allows for rivers to carve into the terrain and create a bank on its sides.\n\n" +
                                                    "When installed, updates to this component's will trigger the MicroVerse spline to update as well.", MessageType.None);
                        }
                        #pragma warning restore CS0162
                    }
                    EditorGUILayout.EndFadeGroup();
                    
                    EditorGUILayout.Space();

                    ExpandExport = EditorGUILayout.Foldout(ExpandExport, "FBX Export", EditorStyles.foldoutHeader);
                    EditorGUILayout.BeginFadeGroup(ExpandExport ? 1f : 0.001f);
                    {
                        EditorGUILayout.PropertyField(exportToFBX, new GUIContent("Enable", exportToFBX.tooltip));
                        
                        if (exportToFBX.boolValue == false)
                        {
                            EditorGUILayout.HelpBox("\n" +
                                                    "Saving the generated mesh to an FBX file is recommended to benefit from file compression and segmenting scene contents for optimal loading performance " +
                                                    "(in large and complex scenes)." +
                                                    "\n\n" +
                                                    "For use in Prefabs, this is required to retain the mesh data. It is otherwise saved and available purely only the scene." +
                                                    "\n", MessageType.Info);
                        }
                        if (exportToFBX.boolValue)
                        {
                            EditorGUILayout.Space();

                            #if FBX_EXPORTER
                            EditorGUILayout.BeginHorizontal();
                            {
                                EditorGUILayout.PropertyField(fbxFilePath, new GUIContent("File path", fbxFilePath.tooltip));
                                
                                if (GUILayout.Button(new GUIContent("...", "Browse"), GUILayout.Width(50f)))
                                {
                                    string newPath = EditorUtility.SaveFilePanelInProject("FBX destination folder", target.name, "fbx", "Choose FBX file location");
                                    if (newPath != string.Empty)
                                    {
                                        fbxFilePath.stringValue = newPath;
                                    }
                                }
                                
                                if (GUILayout.Button("Ping", GUILayout.Width(60f)))
                                {
                                    UnityEngine.Object exportedObject = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(fbxFilePath.stringValue);

                                    if (exportedObject)
                                    {
                                        EditorGUIUtility.PingObject(exportedObject);
                                        
                                        var fileInfo = new System.IO.FileInfo(fbxFilePath.stringValue);
                                        float bytes = (fileInfo.Length / 1024f) / 1024f;

                                        SceneView.lastActiveSceneView.ShowNotification(new GUIContent($"File size: {(float)System.Math.Round(bytes, 2)}mb"), 1f);
                                    }
                                }
                            }
                            EditorGUILayout.EndHorizontal();
                            if (fbxFilePath.stringValue == string.Empty)
                            {
                                EditorGUILayout.HelpBox("File path should not be blank", MessageType.Warning);
                            }
                            
                            EditorGUILayout.HelpBox("The mesh will be re-exported if it has changed once the inspector is closed.", MessageType.Info);
                            #else
                            UI.DrawActionBox("The FBX Exporter package is not installed, it is required for this functionality", MessageType.Error, "Install", PackageInstaller.InstallFBXExporter);
                            #endif
                        }
                    }
                    EditorGUILayout.EndFadeGroup();
                }
                else
                {
                    EditorGUILayout.HelpBox("A Mesh Filter for output is required. Assign one you wish to generate a river mesh for.", MessageType.Error);
                }
            }
            else
            {
                EditorGUILayout.HelpBox("A spline container must be assigned. Assign one you wish to generate a river from.", MessageType.Warning);
            }

            if (EditorGUI.EndChangeCheck())
            {
                serializedObject.ApplyModifiedProperties();

                if (requiresRebuild)
                {
                    EditorApplication.delayCall += () =>
                    {
                        rebuildTimer.Reset();
                        rebuildTimer.Start();
                        foreach (var target in targets)
                        {
                            ((RiverModeler)target).Rebuild(changeFlags);
                        }
                        rebuildTimer.Stop();
                    };
                }
            }
            
            #endif
            
            UI.DrawFooter();
            
            #if WGT_DEV
            using (new EditorGUILayout.HorizontalScope())
            {
                EditorGUILayout.LabelField($"Rebuild time: {rebuildTimer.ElapsedMilliseconds}ms", EditorStyles.miniLabel);
            }
            #endif
        }

        private void ExportToFBX()
        {
            #if FBX_EXPORTER
            foreach (var target in targets)
            {
                if (((RiverModeler)target).exportToFBX)
                {
                    RiverModeler component = ((RiverModeler)target);
                    
                    if (component.meshFilter && component.meshFilter.sharedMesh)
                    {
                        if (EditorUtility.IsDirty(component.meshFilter.sharedMesh) || !EditorUtility.IsPersistent(component.meshFilter.sharedMesh))
                        {
                            //Debug.Log($"Mesh ({component.meshFilter.sharedMesh.name}) was changed, exporting to {component.fbxFilePath}");

                            EditorUtilities.FBX.SaveToFileAndReference(component.gameObject, component.fbxFilePath);
                        }
                        /*
                        else
                        {
                            Debug.Log($"Mesh ({component.meshFilter.sharedMesh.name}) hasn't changed, so won't require exporting");
                        }
                        */
                    }
                }
            }
            #endif
        }
    }
}
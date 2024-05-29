// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;
using UnityEngine;
using Object = UnityEngine.Object;

#if SPLINES
using UnityEngine.Splines;
#endif

namespace sc.modeling.river.editor
{
    public class RiverEditor
    {
        //If Stylized Water 2 is installed, prefer to create new river objects using its default 'River' material
        private const string SW2_RIVER_MAT_GUID = "befd35ed3bbfbef418af6a4754907fab";
        private const string DEMO_RIVER_MAT_GUID = "46c16e84bcd61ab42b61bd6b597c17fb";

        private const string CASCADE_VFX_PREFAB_GUID = "c914fe647c90fa647bec5c4f7b119275";
        private const string SPLASH_VFX_PREFAB_GUID = "f3d93d93f1aaa0b40b1bf183eb50539a";

        private static Material GetDefaultMaterial()
        {
            string defaultMatPath = AssetDatabase.GUIDToAssetPath(SW2_RIVER_MAT_GUID);

            //SW2 installed
            if (defaultMatPath != string.Empty)
            {
                return AssetDatabase.LoadAssetAtPath(defaultMatPath, typeof(Material)) as Material;
            }

            defaultMatPath = AssetDatabase.GUIDToAssetPath(DEMO_RIVER_MAT_GUID);
            return AssetDatabase.LoadAssetAtPath(defaultMatPath, typeof(Material)) as Material;
        }
        
        [MenuItem("GameObject/3D Object/Water/River", false, 1000)]
        public static GameObject CreateRiverObject()
        {
            GameObject gameObject = new GameObject(GameObjectUtility.GetUniqueNameForSibling(null, "River"));
            
            bool addSpline = EditorUtility.DisplayDialog("Create river object", "Create with a new spline?", "Yes", "No");
            if (addSpline)
            {
                #if SPLINES
                SplineContainer splineContainer = gameObject.AddComponent<SplineContainer>();
                splineContainer.Splines = null;

                int knots = 5;
                float amplitude = 2f;
                float length = 50f;
                Spline spline = new Spline(knots, false);

                for (int i = 0; i <= knots; i++)
                {
                    float t = (float)i / (float)knots;
                    BezierKnot knot = new BezierKnot();
                    knot.Position = new Vector3(Mathf.Sin(t * knots * 2f) * amplitude, 0f, (t * length) - (length * 0.5f));
                    spline.Add(knot, TangentMode.Linear);
                }

                //Automatically recalculate tangents
                spline.SetTangentMode(new SplineRange(0, spline.Count), TangentMode.AutoSmooth);

                splineContainer.AddSpline(spline);
                #else
                throw new Exception("The Splines package isn't installed.");
                #endif
            }

            gameObject.layer = LayerMask.NameToLayer("Water");
            
            #if UNITY_EDITOR
            Undo.RegisterCreatedObjectUndo(gameObject, "Created River Object");
            #endif
            
            RiverModeler component = gameObject.AddComponent<RiverModeler>();
            MeshFilter meshFilter = gameObject.AddComponent<MeshFilter>();
            component.meshFilter = meshFilter;
            MeshRenderer r = gameObject.AddComponent<MeshRenderer>();
            r.sharedMaterial = GetDefaultMaterial();
            
            component.Rebuild();

            EditorUtilities.OnPostGameObjectCreation(gameObject);

            return gameObject;
        }
        
        #if SPLINES
        [MenuItem("CONTEXT/SplineContainer/Add River")]
        private static void AddRiverToSpline(MenuCommand cmd)
        {
            SplineContainer t = (SplineContainer)cmd.context;

            bool asChild = EditorUtility.DisplayDialog("Add river modeler to spline", "Add as a child object?", "Yes", "No");

            RiverModeler component = null;
            
            if (asChild)
            {
                GameObject obj = CreateRiverObject();
                obj.transform.parent = t.transform;

                component = obj.GetComponent<RiverModeler>();
            }
            else
            {
                if (!t.gameObject.GetComponent<RiverModeler>())
                {
                    component = t.gameObject.AddComponent<RiverModeler>();
                }
            }
            
            component.splineContainer = t;

            MeshFilter meshFilter = component.meshFilter;
            
            if (!meshFilter)
            {
                component.meshFilter = component.gameObject.AddComponent<MeshFilter>();
                MeshRenderer r =component.gameObject.AddComponent<MeshRenderer>();
                r.sharedMaterial = GetDefaultMaterial();
            }

            EditorUtility.SetDirty(t);
        }
        #endif
        
        [MenuItem("GameObject/Audio/River Audio", false, 1000)]
        public static GameObject CreateAudioZone()
        {
            GameObject gameObject = new GameObject(GameObjectUtility.GetUniqueNameForSibling(null, "River Audio"));
            
            #if UNITY_EDITOR
            Undo.RegisterCreatedObjectUndo(gameObject, "Created River Audio object");
            #endif
            
            AudioZone component = gameObject.AddComponent<AudioZone>();
            
            #if UNITY_2022_1_OR_NEWER
            component.river = Object.FindFirstObjectByType<RiverModeler>();
            #else
            component.river = Object.FindObjectOfType<RiverModeler>();
            #endif
            
            EditorUtilities.OnPostGameObjectCreation(gameObject);

            return gameObject;
        }
        
        [MenuItem("GameObject/Effects/River Cascade VFX", false, 1000)]
        public static void CreateCascadeVFX()
        {
            GameObject gameObject = EditorUtilities.InstantiatePrefab(CASCADE_VFX_PREFAB_GUID, "Cascade VFX");

            if (gameObject == null) return;
            
            #if UNITY_EDITOR
            Undo.RegisterCreatedObjectUndo(gameObject, "River Cascade VFX");
            #endif

            EditorUtilities.OnPostGameObjectCreation(gameObject);
        }
        
        [MenuItem("GameObject/Effects/River Splash VFX", false, 1000)]
        public static void CreateSplashVFX()
        {
            GameObject gameObject = EditorUtilities.InstantiatePrefab(SPLASH_VFX_PREFAB_GUID, "Splash VFX");

            if (gameObject == null) return;
            
            #if UNITY_EDITOR
            Undo.RegisterCreatedObjectUndo(gameObject, "River Splash VFX");
            #endif

            EditorUtilities.OnPostGameObjectCreation(gameObject);
        }
    }
}
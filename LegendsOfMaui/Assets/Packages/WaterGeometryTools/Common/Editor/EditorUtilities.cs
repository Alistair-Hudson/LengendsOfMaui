using System;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;
using Object = UnityEngine.Object;

#if FBX_EXPORTER
using UnityEditor.Formats.Fbx.Exporter;
#endif

namespace sc.modeling.water.common.editor
{
    public static class EditorUtilities
    {
        public static GameObject InstantiatePrefab(string GUID, string name)
        {
            string prefabPath = AssetDatabase.GUIDToAssetPath(GUID);

            if (prefabPath == string.Empty)
            {
                Debug.LogError($"The \"{name}\" prefab could not be found in the project, it was either deleted or not imported.");
                return null;
            }

            Object prefab = AssetDatabase.LoadAssetAtPath<Object>(prefabPath);
            
            return PrefabUtility.InstantiatePrefab(prefab, SceneManager.GetActiveScene()) as GameObject;
        }
        
        /// <summary>
        /// Position the object in view, select it and mark the scene as changed.
        /// </summary>
        /// <param name="gameObject"></param>
        public static void OnPostGameObjectCreation(GameObject gameObject)
        {
            if (Selection.activeGameObject) gameObject.transform.parent = Selection.activeGameObject.transform;
            
            PositionObjectInScene(gameObject);

            Selection.activeGameObject = gameObject;
            
            if(Application.isPlaying == false) EditorSceneManager.MarkSceneDirty(SceneManager.GetActiveScene());
        }

        public static void PositionObjectInScene(GameObject gameObject)
        {
            //Position in view
            if (SceneView.lastActiveSceneView)
            {
                var transform = SceneView.lastActiveSceneView.camera.transform;

                float size = 50f;

                MeshRenderer meshRenderer = gameObject.GetComponent<MeshRenderer>();
                if(meshRenderer) size = (meshRenderer.bounds.min - meshRenderer.bounds.max).magnitude;
                
                Vector3 spawnPosition = transform.position + (transform.forward * size);

                if (Physics.Raycast(transform.position, transform.forward, out var hit, 2000, -1, QueryTriggerInteraction.Ignore))
                {
                    spawnPosition = hit.point - (transform.forward * 1f);
                }
                gameObject.transform.position = spawnPosition;
            }
        }

        public static class FBX
        {
            /// <summary>
            /// Export any sort of meshes contained in the object, and load+reference them back to it
            /// </summary>
            /// <param name="gameObject"></param>
            /// <param name="filePath"></param>
            /// <exception cref="Exception">Empty file path, or missing the FBX extension</exception>
            public static void SaveToFileAndReference(GameObject gameObject, string filePath)
            {
                #if FBX_EXPORTER
                if (filePath == string.Empty)
                {
                    throw new Exception("Failed to save mesh(es) to an FBX file, file path is empty");
                }
                if (filePath.EndsWith(".fbx") == false)
                {
                    throw new Exception("Failed to save mesh(es) to an FBX file, file path must end with \".fbx\"");
                }

                //Export
                ModelExporter.ExportObject(filePath, gameObject);
                
                //Import
                AssetDatabase.ImportAsset(filePath, ImportAssetOptions.ForceSynchronousImport);

                //Loading meshes and assigning them to MeshFilters
                Object[] subAssets = AssetDatabase.LoadAllAssetsAtPath(filePath);
                
                LODGroup lodGroup = gameObject.GetComponent<LODGroup>();
                if (lodGroup)
                {
                    MeshFilter[] meshFilters = gameObject.GetComponentsInChildren<MeshFilter>();
                    
                    for (int i = 1; i < meshFilters.Length; i++) //Skip the first, as it is the parent
                    {
                        if (subAssets[i] is Mesh) meshFilters[i].sharedMesh = subAssets[i] as Mesh;
                    }
                }
                else
                {
                    MeshFilter meshFilter = gameObject.GetComponent<MeshFilter>();

                    if (meshFilter)
                    {
                        for (int i = 1; i < subAssets.Length; i++) //Skip the first, as it is the parent
                        {
                            if (subAssets[i] is Mesh) meshFilter.sharedMesh = subAssets[i] as Mesh;
                        }
                    }
                }
                #endif
            }
        }
    }
}
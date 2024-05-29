// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Rendering;

#if MATHEMATICS
using Unity.Mathematics;
#endif
#if SPLINES
using UnityEngine.Splines;
#endif

namespace sc.modeling.river.runtime
{
    /// <summary>
    /// Front-end MonoBehaviour component
    /// </summary>
    [AddComponentMenu("Water/River Modeler")]
    [HelpURL("https://staggart.xyz/river-modeler-docs/?section=river-modeler")]
    [ExecuteInEditMode]
    public partial class RiverModeler : MonoBehaviour
    {
        /// <summary>
        /// Flags used to indicate which aspects of a river is being modified
        /// </summary>
        [Flags]
        public enum ChangeFlags
        {
            All             = 1,
            Spline          = 2,
            Geometry        = 4,
            VertexAttribute = 8,
            Foam            = 16,
            Scale           = 32,
            Transparency    = 64,
            Data            = 128
        }
        
        [Tooltip("The target mesh filter the generated mesh is stored in. Attaching a Mesh Renderer to the same object will render it using a material")]
        public MeshFilter meshFilter;
        [Range(-3, 3)]
        [Tooltip("Sets the rendering offset for the Mesh Renderer component." +
                 "\n\n" +
                 "This relates directly to transparency sorting and may be used to force one river to render on top of another one." +
                 "\n\n" +
                 "For this to have any effect, the renderer must used a shader that doesn't write to the depth buffer (ZWrite Off) ")]
        public int orderInLayer = 0;

        /* LOD Group support WIP
        public LODGroup lodGroup;
        
        [Serializable]
        public class LOD
        {
            [Range(5f, 100f)]
            public float resolution = 100f;

            public LOD(float resolution)
            {
                this.resolution = resolution;
            }
        }
        public List<LOD> lods = new List<LOD>()
        {
            new LOD(100f)
        };
        */

        /// <summary>
        /// Settings used for geometry generation
        /// </summary>
        public Settings settings = new Settings();

        public bool exportToFBX;
        public string fbxFilePath;

        #pragma warning disable CS0067
        public delegate void OnRebuildRiver(RiverModeler instance, ChangeFlags updateFlags);
        public static event OnRebuildRiver onPreRebuildRiver;
        public static event OnRebuildRiver onPostRebuildRiver;
        
        /// <summary>
        /// UnityEvent for a GameObject's function to be executed when river is rebuild. This is exposed in the inspector.
        /// </summary>
        [Serializable]
        public class RebuildEvent : UnityEvent<ChangeFlags> { }
        /// <summary>
        /// UnityEvent, fires whenever spline is rebuild (eg. editing nodes)
        /// </summary>
        public RebuildEvent onPreRebuild;
        public RebuildEvent onPostRebuild;
        #pragma warning restore CS0067

        public void Reset()
        {
            #if !SPLINES
            Debug.LogError("This component requires the Splines package. Please install this through the Package Manager");
            #endif
            #if !MATHEMATICS
            Debug.LogError("This component requires the Mathematics package. Please install this through the Package Manager");
            #endif
            
            meshFilter = GetComponent<MeshFilter>();
            #if SPLINES && MATHEMATICS
            if(!splineContainer) splineContainer = GetComponentInParent<SplineContainer>();
            
            ValidateData(splineContainer);
            #endif
            
            Rebuild();
        }

        private void OnEnable()
        {
            #if SPLINES
            SubscribeSplineCallbacks();
            #endif
        }

        private void OnDisable()
        {
            #if SPLINES
            UnsubscribeSplineCallbacks();
            #endif
        }

        private partial void SubscribeSplineCallbacks();
        private partial void UnsubscribeSplineCallbacks();

        public void Rebuild(ChangeFlags updateFlags = ChangeFlags.All)
        {
            //Debug.Log($"Rebuilding river with update flags: {updateFlags}", this);
            
            if (!meshFilter) return;
            
            onPreRebuildRiver?.Invoke(this, updateFlags);
            onPreRebuild?.Invoke(updateFlags);
            
            settings.foam.Validate();

            #if SPLINES && MATHEMATICS
            if (!splineContainer) return;
            
            ValidateData(splineContainer);
            
            if(updateFlags.HasFlag(ChangeFlags.All | ChangeFlags.Spline)) ValidateData(splineContainer);
            
            /* LOD Group support WIP
            //Single mesh
            if (lods.Count == 1 && meshFilter)
            {
                meshFilter.sharedMesh = Geometry.Create(splineContainer, ScaleData, OpacityData, generationSettings, meshFilter.transform.worldToLocalMatrix);
            }
            
            //LOD set up
            if (lods.Count > 1 && lodGroup)
            {
                UnityEngine.LOD[] lodGroupLODS = lodGroup.GetLODs();
                
                for (int i = 0; i < lodGroupLODS.Length; i++)
                {
                    MeshFilter lodMF = lodGroupLODS[i].renderers[0].GetComponent<MeshFilter>();

                    if (lodMF)
                    {
                        lodMF.sharedMesh = Geometry.Create(splineContainer, ScaleData, OpacityData, generationSettings, meshFilter.transform.worldToLocalMatrix, lods[i].resolution);
                        
                        Debug.Log($"Creating LOD {i} at {lods[i].resolution}% for {lodMF.gameObject.name}");
                    }
                }
            }
            */
            meshFilter.sharedMesh = Geometry.Create(splineContainer, settings, meshFilter.transform.worldToLocalMatrix, 100f, ScaleData, TransparencyData, FoamData);
            
            MeshRenderer meshRenderer = meshFilter.GetComponent<MeshRenderer>();
            if (meshRenderer)
            {
                meshRenderer.sortingOrder = orderInLayer;
                meshRenderer.shadowCastingMode = ShadowCastingMode.Off;

                if (settings.transparency.vertexColorChannel == Settings.VertexColorChannel.Green)
                {
                    //If the material uses Stylized Water 2, enable vertex color transparency. Quickfix to avoid support overhead
                    var vertexColorAlphaProp = Shader.PropertyToID("_VertexColorDepth");
                    if (meshRenderer.sharedMaterial.HasProperty(vertexColorAlphaProp))
                    {
                        if (meshRenderer.sharedMaterial.GetFloat(vertexColorAlphaProp) == 0)
                        {
                            Debug.Log($"[River Modeler] A Stylized Water 2 material is in use, yet vertex color Transparency wasn't enabled on the material. Enabled now.", this.gameObject);
                            meshRenderer.sharedMaterial.SetFloat(vertexColorAlphaProp, 1);
                            
                            #if UNITY_EDITOR
                            UnityEditor.EditorUtility.SetDirty(meshRenderer.sharedMaterial);
                            #endif
                        }
                    }
                }
                if (settings.transparency.vertexColorChannel == Settings.VertexColorChannel.Alpha)
                {
                    //If the material uses Stylized Water 2, enable vertex color foam. Quickfix to avoid support overhead
                    var vertexColorFoamProp = Shader.PropertyToID("_VertexColorFoam");
                    if (meshRenderer.sharedMaterial.HasProperty(vertexColorFoamProp))
                    {
                        if (meshRenderer.sharedMaterial.GetFloat(vertexColorFoamProp) == 0)
                        {
                            Debug.Log($"[River Modeler] A Stylized Water 2 material is in use, yet vertex color Foam wasn't enabled on the material. Enabled now.", this.gameObject);
                            meshRenderer.sharedMaterial.SetFloat(vertexColorFoamProp, 1);
                            
                            #if UNITY_EDITOR
                            UnityEditor.EditorUtility.SetDirty(meshRenderer.sharedMaterial);
                            #endif
                        }
                    }
                }
            }

            //Update mesh collider
            MeshCollider meshCollider = GetComponent<MeshCollider>();
            if (meshCollider) meshCollider.sharedMesh = meshFilter.sharedMesh;
            
            onPostRebuildRiver?.Invoke(this, updateFlags);
            onPostRebuild?.Invoke(updateFlags);
            
            #if MICROVERSE_SPLINES
            if (updateFlags.HasFlag(ChangeFlags.All) || updateFlags.HasFlag(ChangeFlags.Spline) || updateFlags.HasFlag(ChangeFlags.Geometry) || updateFlags.HasFlag(ChangeFlags.Data))
            {
                //MicroVerse syncing
                UpdateMicroVerseSpline();
            }
            #endif
            
            #endif
        }

        public partial void UpdateMicroVerseSpline();

        partial void DrawDebugging();
        
        private void OnDrawGizmosSelected()
        {
            DrawDebugging();
        }
    }
}
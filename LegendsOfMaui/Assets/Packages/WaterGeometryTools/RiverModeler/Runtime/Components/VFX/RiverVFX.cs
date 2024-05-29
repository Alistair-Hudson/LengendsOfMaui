// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using sc.modeling.water.common.runtime;
using UnityEngine;

#if VFX_GRAPH
using UnityEngine.VFX;
#endif

namespace sc.modeling.river.runtime
{
    [ExecuteAlways]
    [AddComponentMenu("")] // Hide
    public class RiverVFX : MonoBehaviour
    {
        public RiverModeler river;
        
        public enum Confines
        {
            EntireMesh,
            Bounds
        }
        
        public Confines confines;
        public Vector3 boundsSize = Vector3.one * 10f;
        
        #if VFX_GRAPH
        public VisualEffect targetEffect;
        #endif

        #if MATHEMATICS
        public VFX.PointCache pointCache = new VFX.PointCache();
        #endif
        
        protected Bounds bounds;
        #if MATHEMATICS
        protected List<VFX.Emitter> emitters = new List<VFX.Emitter>();
        #endif

        private void Reset()
        {
            river = GetComponentInParent<RiverModeler>();
            
            #if VFX_GRAPH
            targetEffect = GetComponent<VisualEffect>();

            if (!targetEffect)
            {
                targetEffect = gameObject.AddComponent<VisualEffect>();
                
                #if UNITY_EDITOR
                string effectPath = UnityEditor.AssetDatabase.GUIDToAssetPath(VFX.DEFAULT_EFFECT_GUID);

                if (effectPath != string.Empty)
                {
                    targetEffect.visualEffectAsset = UnityEditor.AssetDatabase.LoadAssetAtPath<VisualEffectAsset>(effectPath);
                }
                else
                {
                    throw new Exception("Failed to find the effect required for this component, was it not imported from the asset store?");
                }
                #endif
            }

            #if MATHEMATICS
            pointCache = new VFX.PointCache();
            #endif
            #endif
        }

        private void OnEnable()
        {
            RiverModeler.onPostRebuildRiver += OnRiverRebuild;
        }

        private void OnDisable()
        {
            RiverModeler.onPostRebuildRiver -= OnRiverRebuild;
        }
        
        private void OnRiverRebuild(RiverModeler instance, RiverModeler.ChangeFlags updateFlags)
        {
            if ( 
                updateFlags.HasFlag(RiverModeler.ChangeFlags.Spline) 
                || updateFlags.HasFlag(RiverModeler.ChangeFlags.VertexAttribute) 
                || updateFlags.HasFlag(RiverModeler.ChangeFlags.Data)
                || updateFlags.HasFlag(RiverModeler.ChangeFlags.Foam)
                && river != null && instance.GetHashCode() == river.GetHashCode())
            {
                //Debug.Log("Update VFX emitters: " + updateFlags);
                
                GenerateEmitters();
            }
        }

        //Function to override in derived classes
        public virtual void GenerateEmitters()
        {
            
        }

        protected void ApplyEmitters()
        {
            #if VFX_GRAPH && MATHEMATICS
            pointCache.SetData(emitters);
            pointCache.ApplyToEffect(targetEffect);

            VFX.SetSortingOrder(targetEffect, river.orderInLayer+1);
            #endif
        }

        private void OnDrawGizmosSelected()
        {
            if (confines == Confines.Bounds)
            {
                Gizmos.color = Color.yellow;
                Gizmos.DrawWireCube(this.transform.position, boundsSize);
            }
        }

        public bool IsValidEffect()
        {
            #if VFX_GRAPH && MATHEMATICS
            return VFX.PointCache.IsValidTargetEffect(targetEffect);
            #else
            return false;
            #endif
        }
    }
}
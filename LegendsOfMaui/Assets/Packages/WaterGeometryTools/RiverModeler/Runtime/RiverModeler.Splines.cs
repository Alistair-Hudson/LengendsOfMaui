// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

#if MATHEMATICS
using Unity.Mathematics;
#endif
#if SPLINES
using UnityEngine.Splines;
#endif

namespace sc.modeling.river.runtime
{
    public partial class RiverModeler
    {
        #if SPLINES
        public SplineContainer splineContainer;
        
        #if MATHEMATICS
        /// <summary>
        /// X-component defines the width of the river. Y-component scales the displacement. Sample data using length units.
        /// </summary>
        public List<SplineData<float3>> ScaleData = new List<SplineData<float3>>();
        /// <summary>
        /// Weights for transparency data stored in vertex colors. Sample data using length units.
        /// </summary>
        public List<SplineData<float>> TransparencyData = new List<SplineData<float>>();
        /// Weights for foam strength stored in vertex colors. Normalized value where 0=subtracting 0.5=none 1.0=adding. Sample data using length units.
        public List<SplineData<float>> FoamData = new List<SplineData<float>>();
        #endif
        
        private partial void SubscribeSplineCallbacks()
        {
            #if SPLINES && MATHEMATICS
            SplineContainer.SplineAdded += OnSplineAdded;
            SplineContainer.SplineRemoved += OnSplineRemoved;
            Spline.Changed += OnSplineChanged;
            #endif
        }
        
        private partial void UnsubscribeSplineCallbacks()
        {
            #if SPLINES && MATHEMATICS
            SplineContainer.SplineAdded -= OnSplineAdded;
            SplineContainer.SplineRemoved -= OnSplineRemoved;
            Spline.Changed -= OnSplineChanged;
            #endif
        }
        #endif
        
        #if SPLINES && MATHEMATICS
        private void OnSplineChanged(Spline spline, int index, SplineModification modificationType)
        {
            if (!splineContainer) return;

            //Spline belongs to the assigned container?
            var splineIndex = Array.IndexOf(splineContainer.Splines.ToArray(), spline);
            if (splineIndex < 0)
                return;

            Rebuild(ChangeFlags.Spline);
        }
        
        void OnSplineAdded(SplineContainer container, int index)
        {
            if (container.GetHashCode() != splineContainer.GetHashCode())
                return;
            
            //Debug.Log("OnSplineContainerAdded");
            
            ValidateData(container);
            
            Rebuild(ChangeFlags.Spline);
        }

        /// <summary>
        /// Ensures that the component has Scale/Transparency/Foam data set up for every spline, and there's a default value point at the start & end.
        /// </summary>
        /// <param name="container"></param>
        public void ValidateData(SplineContainer container)
        {
            #if MATHEMATICS
            int splineCount = container.Splines.Count;
            if (ScaleData.Count < splineCount)
            {
                var delta = splineCount - ScaleData.Count;
                
                //Debug.Log($"OnSplineContainerAdded. Adding {delta} new data");

                for (var i = 0; i < delta; i++)
                {
                    #if UNITY_EDITOR
                    UnityEditor.Undo.RecordObject(this, "Modifying river Scale");
                    #endif
                    
                    float length = container.Splines[i].CalculateLength(container.transform.localToWorldMatrix);
                    
                    SplineData<float3> data = new SplineData<float3>();
                    data.DefaultValue = Vector3.one;
                    data.PathIndexUnit = PathIndexUnit.Distance;
                    data.AddDataPointWithDefaultValue(0f);
                    data.AddDataPointWithDefaultValue(length);
                    
                    ScaleData.Add(data);
                }
            }
            
            if (TransparencyData.Count < splineCount)
            {
                var delta = splineCount - TransparencyData.Count;
                for (var i = 0; i < delta; i++)
                {
                    #if UNITY_EDITOR
                    UnityEditor.Undo.RecordObject(this, "Modifying river Transparency");
                    #endif
                    
                    float length = container.Splines[i].CalculateLength(container.transform.localToWorldMatrix);

                    SplineData<float> data = new SplineData<float>();
                    data.DefaultValue = 0f;
                    data.PathIndexUnit = PathIndexUnit.Distance;
                    data.AddDataPointWithDefaultValue(0f);
                    data.AddDataPointWithDefaultValue(length);
                    
                    TransparencyData.Add(data);
                }
            }
            
            if (FoamData.Count < splineCount)
            {
                var delta = splineCount - FoamData.Count;
                for (var i = 0; i < delta; i++)
                {
                    #if UNITY_EDITOR
                    UnityEditor.Undo.RecordObject(this, "Modifying river Foam");
                    #endif
                    
                    float length = container.Splines[i].CalculateLength(container.transform.localToWorldMatrix);

                    SplineData<float> data = new SplineData<float>();
                    data.DefaultValue = 0.5f;
                    data.PathIndexUnit = PathIndexUnit.Distance;
                    data.AddDataPointWithDefaultValue(0f);
                    data.AddDataPointWithDefaultValue(length);
                    
                    FoamData.Add(data);
                }
            }
            #endif
        }

        [ContextMenu("Reset spline Transparency")]
        public void ResetTransparencyData()
        {
            if (!splineContainer) return;
            
            TransparencyData.Clear();
            ValidateData(splineContainer);
            
            Rebuild(ChangeFlags.Data);
        }
        
        [ContextMenu("Reset spline Scale")]
        public void ResetDisplacementData()
        {
            if (!splineContainer) return;
            
            ScaleData.Clear();
            ValidateData(splineContainer);
            
            Rebuild(ChangeFlags.Data);
        }
        
        [ContextMenu("Reset spline Foam")]
        public void ResetFoamData()
        {
            if (!splineContainer) return;
            
            FoamData.Clear();
            ValidateData(splineContainer);
            
            Rebuild(ChangeFlags.Data);
        }
        
        void OnSplineRemoved(SplineContainer container, int index)
        {
            if (container != splineContainer)
                return;

            if (index < ScaleData.Count)
            {
                #if UNITY_EDITOR
                UnityEditor.Undo.RecordObject(this, "Deleting river Scale data");
                #endif
                
                ScaleData.RemoveAt(index);
            }
            
            if (index < TransparencyData.Count)
            {
                #if UNITY_EDITOR
                UnityEditor.Undo.RecordObject(this, "Deleting river Transparency data");
                #endif
                
                TransparencyData.RemoveAt(index);
            }
            
            if (index < FoamData.Count)
            {
                #if UNITY_EDITOR
                UnityEditor.Undo.RecordObject(this, "Deleting river Foam data");
                #endif
                
                FoamData.RemoveAt(index);
            }

            Rebuild(ChangeFlags.Data);
        }
        #endif
    }
}
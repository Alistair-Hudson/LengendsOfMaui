// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using UnityEngine;

#if MATHEMATICS
using Unity.Mathematics;
#endif

#if SPLINES
using UnityEngine.Splines;
#endif

#if MICROVERSE_SPLINES
using SplinePath = JBooth.MicroVerseCore.SplinePath;
#endif

namespace sc.modeling.river.runtime
{
    public partial class RiverModeler
    {
        //Unused code warnings
        #pragma warning disable CS0162
        //A bit of padding to ensure that the river geometry at least clips through the terrain
        private const float MV_WIDTH_PADDING = 0.5f;
        private const float MV_MIN_SMOOTHNESS = 1f;
        
        [Serializable]
        public class MicroVerseRiverSettings
        {
            [Header("River Bank (Height)")]
            [Min(0f)]
            public float bankHeight = 0.5f;
            [Min(0.01f)]
            public float bankWidth = 5f;
            
            [Space]
            [Min(0f)]
            public float bankFalloff;
            
            [Space]
            
            [Header("River Bank (Texture)")]
            public float bankSplatWidth;
            public float bankSplatSmoothness = 3f;
            
            [Space]

            [Header("River Bed")]
            [Min(0f)]
            public float bedDepth = 2f;
            [Min(0f)]
            public float bedSmoothness = 0f;

            [Space]

            public float offset;
        }

        public MicroVerseRiverSettings microVerseSettings;
        
        private readonly Keyframe[] heightCurveKeyframes = new Keyframe[3];
        #pragma warning restore CS0162
        
        public partial void UpdateMicroVerseSpline()
        {
            #if UNITY_EDITOR && MICROVERSE_SPLINES && SPLINES && MATHEMATICS
            if (!splineContainer) return;

            SplinePath splinePath = splineContainer.GetComponent<SplinePath>();
            
            if (splinePath)
            {
                var riverWidth = this.settings.shape.width;

                if (splinePath.modifyHeightMap)
                {
                    heightCurveKeyframes[0].time = 0f;
                    heightCurveKeyframes[0].value = microVerseSettings.bedDepth;

                    heightCurveKeyframes[1].time = math.max(0.02f, microVerseSettings.bedSmoothness / riverWidth);
                    heightCurveKeyframes[1].value = -microVerseSettings.bankHeight;

                    heightCurveKeyframes[2].time = 1f;
                    heightCurveKeyframes[2].value = 0f;
                    
                    splinePath.trench = 0f;
                    splinePath.useTrenchCurve = true;
                    
                    splinePath.trenchCurve = new AnimationCurve(heightCurveKeyframes);
                    splinePath.ClearCachedSplineTrenchCurve();

                    splinePath.width = microVerseSettings.bankWidth - microVerseSettings.bedSmoothness;
                    splinePath.smoothness = MV_MIN_SMOOTHNESS + microVerseSettings.bankFalloff;
                }

                if (splinePath.modifySplatMap)
                {
                    splinePath.splatWidth = microVerseSettings.bankSplatWidth;
                    splinePath.splatSmoothness = microVerseSettings.bankSplatSmoothness;
                }

                //Copy the Scale (Width+Displacement) data into the spline's width data
                splinePath.splineWidths = new List<SplinePath.SplineWidthData>();

                float widthScale = (riverWidth * 0.5f) - MV_WIDTH_PADDING - -microVerseSettings.offset;
                foreach (var s in splineContainer.Splines)
                {
                    SplinePath.SplineWidthData outWidth = new SplinePath.SplineWidthData();
                    outWidth.widthData.PathIndexUnit = PathIndexUnit.Distance;
                    
                    foreach (SplineData<float3> scale in ScaleData)
                    {
                        for (int i = 0; i < scale.Count; i++)
                        {
                            outWidth.widthData.Add(scale[i].Index, scale[i].Value.x * widthScale);
                        }
                            
                        splinePath.splineWidths.Add(outWidth);
                    }
                }
            
                //Force an update
                splinePath.OnMoved();
            }
            #endif
        }
    }
}
// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using sc.modeling.river.runtime;
using UnityEditor;
using UnityEditor.EditorTools;
using UnityEngine;

#if SPLINES
using UnityEngine.Splines;
#endif

namespace sc.modeling.river.editor
{
    #if SPLINES && MATHEMATICS
    public abstract class RiverAttributeTool<DataType> : EditorTool
    {
        protected GUIContent m_IconContent;
        public override GUIContent toolbarIcon => m_IconContent;
        
        protected bool m_DisableHandles = false;
        protected const float k_MinSliderSize = 1.35f;
        protected const float k_HandleSize = 0.1f;
        protected const float SLIDER_WIDTH = 150f;

        private GUIStyle windowLabelStyle;
        
        static readonly Color headerBackgroundDark = new Color(0.1f, 0.1f, 0.1f, 0.9f);
        static readonly Color headerBackgroundLight = new Color(1f, 1f, 1f, 0.9f);
        public static Color headerBackground { get { return EditorGUIUtility.isProSkin ? headerBackgroundDark : headerBackgroundLight; } }

        public RiverModeler.ChangeFlags changeFlag = RiverModeler.ChangeFlags.All;
        
        public override void OnToolGUI(EditorWindow window)
        {
            Rect toolRect = new Rect(15, 15, 250, 300);

            if (windowLabelStyle == null)
            {
                windowLabelStyle = new GUIStyle(EditorStyles.label);
                windowLabelStyle.richText = true;
            }
            
            Handles.BeginGUI();
            GUILayout.BeginArea(toolRect);
            {
                GUILayout.BeginVertical(EditorStyles.textArea);
                GUILayout.Label("<b>Click+Drag</b> a node to move it", windowLabelStyle);
                GUILayout.Label("<b>Left-click</b> to add a node", windowLabelStyle);
                GUILayout.Label("<b>Right-click</b> to delete a node", windowLabelStyle);
                GUILayout.EndHorizontal();
            }
            GUILayout.EndArea();
            Handles.EndGUI();
        }
        
        public override void OnActivated()
        {
            RiverModeler modeler = target as RiverModeler;
            
            if (modeler == null || modeler.splineContainer == null)
                return;
            
            modeler.ValidateData(modeler.splineContainer);
            
            SceneView.lastActiveSceneView.ShowNotification(new GUIContent(name), .2f);
        }

        
        protected bool DrawDataPoints(ISpline spline, SplineData<DataType> splineData)
        {
            RiverModeler modeler = target as RiverModeler;

            var inUse = false;
            for (int dataFrameIndex = 0; dataFrameIndex < splineData.Count; dataFrameIndex++)
            {
                var dataPoint = splineData[dataFrameIndex];

                var normalizedT = SplineUtility.GetNormalizedInterpolation(spline, dataPoint.Index, splineData.PathIndexUnit);
                spline.Evaluate(normalizedT, out var position, out var tangent, out var up);

                if (DrawDataPoint(position, tangent, up, dataPoint.Value, out var result))
                {
                    dataPoint.Value = result;
                    splineData[dataFrameIndex] = dataPoint;
                    inUse = true;
                    
                    modeler.Rebuild(changeFlag);
                }
            }
            return inUse;
        }
        
        protected abstract bool DrawDataPoint(
            Vector3 position,
            Vector3 tangent,
            Vector3 up,
            DataType inValue,
            out DataType outValue);

    }
    #endif
}
// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using UnityEngine;
using UnityEditor;
using sc.modeling.river.runtime;
using UnityEditor.EditorTools;
#if SPLINES
using UnityEditor.Splines;
using UnityEngine.Splines;
#endif
#if MATHEMATICS
using Unity.Mathematics;
#endif

namespace sc.modeling.river.editor
{
    #if SPLINES && MATHEMATICS
    [EditorTool(NAME, typeof(RiverModeler))]
    public class ScaleTool : RiverAttributeTool<float3>, IDrawSelectedHandles
    { 
        private const string NAME = "River Scale Tool";
        public const string IconName = "river-scale-tool-64px";

        void OnEnable()
        {
            name = NAME;
            m_IconContent = new GUIContent()
            {
                image = Resources.Load<Texture2D>(IconName),
                text = "Scale Tool",
                tooltip = "Adjust the width and displacement scale of the created river mesh."
            };

            changeFlag = RiverModeler.ChangeFlags.Scale | RiverModeler.ChangeFlags.Data;
        }

        public override void OnToolGUI(EditorWindow window)
        {
            var modeler = target as RiverModeler;
            if (modeler == null || modeler.splineContainer == null)
                return;

            base.OnToolGUI(window);

            Handles.color = Color.green;
            m_DisableHandles = false;

            var splines = modeler.splineContainer.Splines;
            for (var i = 0; i < splines.Count; i++)
            {
                if (i < modeler.ScaleData.Count)
                {
                    var nativeSpline = new NativeSpline(splines[i], modeler.splineContainer.transform.localToWorldMatrix);

                    Undo.RecordObject(modeler, "Modifying River Scale");
                    
                    // User defined handles to manipulate width
                    DrawDataPoints(nativeSpline, modeler.ScaleData[i]);
                    
                    // Using the out-of the box behaviour to manipulate indexes
                    nativeSpline.DataPointHandles(modeler.ScaleData[i], true, i);
                    
                    if (GUI.changed)
                    {
                        modeler.Rebuild(changeFlag);
                    }
                }
            }
        }

        public void OnDrawHandles()
        {
            if (Asset.Preferences.ShowToolPoints == false) return;

            var splineDataTarget = target as RiverModeler;
            if (ToolManager.IsActiveTool(this) || splineDataTarget.splineContainer == null)
                return;

            Color color = Color.green;
            color.a = 0.5f;
            Handles.color = color;
            m_DisableHandles = true;

            var splines = splineDataTarget.splineContainer.Splines;
            for (var i = 0; i < splines.Count; i++)
            {
                if (i < splineDataTarget.ScaleData.Count)
                {
                    var nativeSpline = new NativeSpline(splines[i], splineDataTarget.splineContainer.transform.localToWorldMatrix);
                    
                    DrawDataPoints(nativeSpline, splineDataTarget.ScaleData[i]);
                }
            }
        }

        protected override bool DrawDataPoint(Vector3 position, Vector3 tangent, Vector3 up, float3 inValue, out float3 outValue)
        {
            int id = m_DisableHandles ? -1 : GUIUtility.GetControlID(FocusType.Passive);
            int id2 = m_DisableHandles ? -1 : GUIUtility.GetControlID(FocusType.Passive);

            outValue = inValue;
            if (tangent == Vector3.zero)
                return false;

            if (Event.current.type == EventType.MouseUp
                && Event.current.button != 0
                && (GUIUtility.hotControl == id || GUIUtility.hotControl == id2))
            {
                Event.current.Use();
                return false;
            }

            var handleColor = Handles.color;
            if ((GUIUtility.hotControl == id || GUIUtility.hotControl == id2))
                handleColor = Handles.selectedColor;
            else if (GUIUtility.hotControl == 0 && (HandleUtility.nearestControl == id || HandleUtility.nearestControl == id2))
                handleColor = Handles.preselectionColor;

            var splineDataTarget = target as RiverModeler;
            float riverWidth = splineDataTarget.settings.shape.width * 0.5f;

            up = math.up();
            Vector3 right = math.normalize(math.cross(tangent, up));

            float handleScale = HandleUtility.GetHandleSize(position);
            
            Vector3 x = position + (right * inValue.x * riverWidth);
            Vector3 y = position + (up * inValue.y * handleScale);

            Vector3 width, height;
            
            using (new Handles.DrawingScope(handleColor))
            {
                Handles.color = Color.red;;
                if (Event.current.type == EventType.Repaint)
                {
                    Handles.DrawAAPolyLine(Texture2D.whiteTexture, 3f, new []{position, x});
                }
                width = Handles.Slider(id, x, right, k_HandleSize * handleScale, CustomHandleCap, 0);

                Handles.color = Color.green;
                if (Event.current.type == EventType.Repaint)
                {
                    Handles.DrawAAPolyLine(Texture2D.whiteTexture, 3f, new []{position, y});
                }
                height = Handles.Slider(id2, y, up, k_HandleSize * handleScale, CustomHandleCap, 0);
            }

            if (GUIUtility.hotControl == id && math.abs(width.x - x.x) > 0f)
            {
                outValue.x = math.distance(width, position) / riverWidth;
                return true;
            }

            if (GUIUtility.hotControl == id2 && math.abs(height.y - y.y) > 0f)
            {
                outValue.y = math.distance(height, position) / handleScale;
                return true;
            }
            
            return false;
        }
        
        public void CustomHandleCap(int controlID, Vector3 position, Quaternion rotation, float size, EventType eventType)
        {
            if (m_DisableHandles) // If disabled, do nothing unless it's a repaint event
            {
                if (Event.current.type == EventType.Repaint)
                    Handles.CubeHandleCap(controlID, position, rotation, size, eventType);
            }
            else
                Handles.CubeHandleCap(controlID, position, rotation, size, eventType);
        }
    }
    #endif
} 
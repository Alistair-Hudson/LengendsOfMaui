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
    public class FoamTool : RiverAttributeTool<float>, IDrawSelectedHandles
    {
        private const string NAME = "River Foam Tool";
        public const string IconName = "river-foam-tool-64px";

        void OnEnable()
        {
            name = NAME;
            m_IconContent = new GUIContent()
            {
                image = Resources.Load<Texture2D>(IconName),
                text = "Foam Tool",
                tooltip = "River: +/- foam amount"
            };

            changeFlag = RiverModeler.ChangeFlags.Foam | RiverModeler.ChangeFlags.Data;
        }
        
        public override void OnToolGUI(EditorWindow window)
        {
            RiverModeler modeler = target as RiverModeler;
            if (modeler == null || modeler.splineContainer == null)
                return;
            
            base.OnToolGUI(window);

            Handles.color = Color.gray;
            m_DisableHandles = false;

            var splines = modeler.splineContainer.Splines;
            for (var i = 0; i < splines.Count; i++)
            {
                if (i < modeler.FoamData.Count)
                {
                    var nativeSpline = new NativeSpline(splines[i], modeler.splineContainer.transform.localToWorldMatrix);

                    Undo.RecordObject(modeler, "Modifying River Foam");

                    // User defined handles to manipulate width
                    DrawDataPoints(nativeSpline, modeler.FoamData[i]);

                    nativeSpline.DataPointHandles(modeler.FoamData[i], true, i);
                    
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

            RiverModeler modeler = target as RiverModeler;
            if (ToolManager.IsActiveTool(this) || modeler.splineContainer == null)
                return;

            Color color = Color.gray;
            color.a = 0.5f;
            Handles.color = color;
            m_DisableHandles = true;

            var splines = modeler.splineContainer.Splines;
            for (var i = 0; i < splines.Count; i++)
            {
                if (i < modeler.FoamData.Count)
                {
                    var nativeSpline = new NativeSpline(splines[i], modeler.splineContainer.transform.localToWorldMatrix);
                    if (DrawDataPoints(nativeSpline, modeler.FoamData[i]))
                    {
                        
                    }
                }
            }
        }

        protected override bool DrawDataPoint(Vector3 position, Vector3 tangent, Vector3 up, float inValue, out float outValue)
        {
            int id = m_DisableHandles ? -1 : GUIUtility.GetControlID(FocusType.Passive);
            outValue = -1f;
            
            if (tangent == Vector3.zero) return false;

            if (Event.current.type == EventType.MouseUp && Event.current.button != 0 && (GUIUtility.hotControl == id))
            {
                Event.current.Use();
                return false;
            }

            var handleColor = Handles.color;
            if (GUIUtility.hotControl == id)
                handleColor = Handles.selectedColor;
            else if (GUIUtility.hotControl == 0 && (HandleUtility.nearestControl == id))
                handleColor = Handles.preselectionColor;

            var right = math.normalize(math.cross(tangent, up));

            EditorGUI.BeginChangeCheck();
            //if (GUIUtility.hotControl == id)
            {
                using (new Handles.DrawingScope(handleColor))
                {
                    //Handles.ScaleValueHandle(inValue, position, Quaternion.LookRotation(tangent, up), HandleUtility.GetHandleSize(position) * 10f, Handles.ArrowHandleCap, 0.01f);
                    
                    Handles.BeginGUI();

                    Vector2 screenPos = HandleUtility.WorldToGUIPoint(position);
                    Rect sliderRect = new Rect(screenPos.x - (SLIDER_WIDTH * 0.5f), screenPos.y - 50f, SLIDER_WIDTH, 22f);

                    EditorGUI.DrawRect(sliderRect, headerBackground);
                    outValue = GUI.HorizontalSlider(sliderRect, inValue, 0f, 1f);

                    outValue = math.clamp(outValue, 0f, 1f);
                    
                    Handles.EndGUI();
                }
            }

            if (inValue != outValue)
            {
                //return true;
            }

            if (EditorGUI.EndChangeCheck()) return true;

            return false;
        }
    }
    #endif
} 
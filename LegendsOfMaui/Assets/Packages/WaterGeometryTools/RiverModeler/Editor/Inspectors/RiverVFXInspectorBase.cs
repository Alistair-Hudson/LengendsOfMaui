// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;

namespace sc.modeling.river.editor
{
    [CustomEditor(typeof(RiverVFX))]
    public class RiverVFXInspectorBase : Editor
    {
        public SerializedProperty river;
        
        private SerializedProperty confines;
        private SerializedProperty boundsSize;
        
        private SerializedProperty targetEffect;
        
        private bool isValidEffect;

        private void OnEnable()
        {
            Enable();
        }

        public virtual void Enable()
        {
            river = serializedObject.FindProperty("river");

            confines = serializedObject.FindProperty("confines");
            boundsSize = serializedObject.FindProperty("boundsSize");

            targetEffect = serializedObject.FindProperty("targetEffect");

            #if VFX_GRAPH && MATHEMATICS
            if (targetEffect.objectReferenceValue) isValidEffect = ((RiverVFX)target).IsValidEffect();
            #endif
        }

        public override void OnInspectorGUI()
        {
            UI.DrawHeader(Asset.NAME, Asset.VERSION);

            #if !URP
            EditorGUILayout.HelpBox("This VFX Graph was constructed for the Universal Render Pipeline", MessageType.Error);
            #endif

            serializedObject.Update();
            EditorGUI.BeginChangeCheck();

            EditorGUILayout.PropertyField(river);
            if (!river.objectReferenceValue)
            {
                EditorGUILayout.HelpBox("A target river component must be assigned!", MessageType.Error);
            }
            
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(targetEffect);
            if (EditorGUI.EndChangeCheck())
            {
                if (targetEffect.objectReferenceValue) isValidEffect = ((RiverVFX)target).IsValidEffect();
            }
            #if URP
            if (targetEffect.objectReferenceValue && isValidEffect == false)
            {
                EditorGUILayout.HelpBox("This Visual Effect uses a graph that is missing the \"Emitter Positions\" property.\n\n"+
                                        "Re-import is from the asset store, or open it and recompile it, if this appears to be in error.", MessageType.Warning);
            }
            #endif
            
            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(confines);

            if (confines.intValue == (int)(RiverVFX.Confines.Bounds))
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(boundsSize);
                EditorGUILayout.HelpBox("The Transform's position defines the bounds center", MessageType.None);
                EditorGUI.indentLevel--;
            }

            EditorGUILayout.Space();
            
            if (EditorGUI.EndChangeCheck())
            {
                serializedObject.ApplyModifiedProperties();
                
                EditorApplication.delayCall += () =>
                {
                    foreach (var m_target in targets)
                        ((RiverVFX)m_target).GenerateEmitters();
                };
            }
        }
    }
}
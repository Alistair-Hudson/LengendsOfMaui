// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;

namespace sc.modeling.river.editor
{
    [CustomEditor(typeof(SplashVFX))]
    [CanEditMultipleObjects]
    public class SplashVFXInspector : RiverVFXInspectorBase
    {
        private SerializedProperty foamThreshold;
        private SerializedProperty minMaxSlopeAngle;
        private SerializedProperty spawnChance;
        
        void OnEnable()
        {
            base.Enable();
            
            foamThreshold = serializedObject.FindProperty("foamThreshold");
            minMaxSlopeAngle = serializedObject.FindProperty("minMaxSlopeAngle");
            spawnChance = serializedObject.FindProperty("spawnChance");
        }
        
        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();

            serializedObject.Update();
            EditorGUI.BeginChangeCheck();

            EditorGUILayout.LabelField("Spawning Criteria", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(foamThreshold);
            EditorGUILayout.PropertyField(minMaxSlopeAngle);
            EditorGUILayout.PropertyField(spawnChance);
            
            if (EditorGUI.EndChangeCheck())
            {
                serializedObject.ApplyModifiedProperties();
                
                EditorApplication.delayCall += () =>
                {
                    foreach (var m_target in targets)
                        ((RiverVFX)m_target).GenerateEmitters();
                };
            }
            
            UI.DrawFooter();
        }
    }
}
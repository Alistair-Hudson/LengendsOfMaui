// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;

namespace sc.modeling.river.editor
{
    [CustomEditor(typeof(CascadeVFX))]
    [CanEditMultipleObjects]
    public class CascadeVFXInspector : RiverVFXInspectorBase
    {
        private SerializedProperty heightDropThreshold;
        private SerializedProperty shifting;
        private SerializedProperty randomOffset;
        private SerializedProperty minParticleDistance;
        private SerializedProperty margin;
        
        void OnEnable()
        {
            base.Enable();
            
            heightDropThreshold = serializedObject.FindProperty("heightDropThreshold");
            shifting = serializedObject.FindProperty("shifting");
            randomOffset = serializedObject.FindProperty("randomOffset");
            minParticleDistance = serializedObject.FindProperty("minParticleDistance");
            margin = serializedObject.FindProperty("margin");
        }
        
        public override void OnInspectorGUI()
        {
            base.OnInspectorGUI();

            serializedObject.Update();
            EditorGUI.BeginChangeCheck();

            EditorGUILayout.LabelField("Spawning Criteria", EditorStyles.boldLabel);
            EditorGUILayout.PropertyField(heightDropThreshold);
            EditorGUILayout.PropertyField(shifting);
            EditorGUILayout.PropertyField(randomOffset);
            EditorGUILayout.PropertyField(minParticleDistance);
            EditorGUILayout.PropertyField(margin);
            
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
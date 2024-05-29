// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using sc.modeling.river.runtime;
using sc.modeling.water.common.editor;
using UnityEditor;
using UnityEngine;

namespace sc.modeling.river.editor
{
    [CustomEditor(typeof(AudioZone))]
    [CanEditMultipleObjects]
    public class AudioZoneInspector : Editor
    {
        private SerializedProperty river;
        
        private SerializedProperty confines;
        private SerializedProperty boundsSize;
        
        private SerializedProperty minMaxSlopeAngle;
        private SerializedProperty resolution;
        
        private SerializedProperty clips;
        private SerializedProperty outputMixer;
        
        private SerializedProperty maxVolume;
        private SerializedProperty pitchModulation;
        private SerializedProperty directionality;
        
        private SerializedProperty updateInSceneView;
        private SerializedProperty minAudibleDistance;
        private SerializedProperty maxAudibleDistance;

        private void OnEnable()
        {
            river = serializedObject.FindProperty("river");
            
            confines = serializedObject.FindProperty("confines");
            boundsSize = serializedObject.FindProperty("boundsSize");
            
            minMaxSlopeAngle = serializedObject.FindProperty("minMaxSlopeAngle");
            resolution = serializedObject.FindProperty("resolution");
            
            clips = serializedObject.FindProperty("clips");
            outputMixer = serializedObject.FindProperty("outputMixer");
            
            maxVolume = serializedObject.FindProperty("maxVolume");
            pitchModulation = serializedObject.FindProperty("pitchModulation");
            directionality = serializedObject.FindProperty("directionality");
            
            updateInSceneView = serializedObject.FindProperty("updateInSceneView");
            minAudibleDistance = serializedObject.FindProperty("minAudibleDistance");
            maxAudibleDistance = serializedObject.FindProperty("maxAudibleDistance");
        }

        public override void OnInspectorGUI()
        {
            UI.DrawHeader(Asset.NAME, Asset.VERSION);
            
            EditorGUI.BeginChangeCheck();
            serializedObject.Update();
            
            EditorGUILayout.PropertyField(river);
            if (!river.objectReferenceValue)
            {
                EditorGUILayout.HelpBox("A target river component must be assigned!", MessageType.Error);
            }
            
            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(confines);
            if (confines.intValue == (int)(AudioZone.Confines.Bounds))
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(boundsSize);
                EditorGUILayout.HelpBox("The Transform's position defines the bounds center", MessageType.None);
                EditorGUI.indentLevel--;
            }
            
            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(clips, new GUIContent("Audio clips", clips.tooltip));

            if(clips.arraySize == 0) EditorGUILayout.HelpBox("Assign one or more audio files", MessageType.Info);
            
            using(new EditorGUI.DisabledGroupScope(clips.arraySize == 0))
            {
                EditorGUILayout.LabelField("Spawning", EditorStyles.boldLabel);
                EditorGUILayout.PropertyField(minMaxSlopeAngle);
                EditorGUILayout.PropertyField(resolution);
                
                EditorGUILayout.Space();
            
                EditorGUILayout.LabelField("Audio", EditorStyles.boldLabel);

                EditorGUILayout.PropertyField(outputMixer);

                EditorGUILayout.Space();

                EditorGUILayout.PropertyField(maxVolume);
                EditorGUILayout.PropertyField(pitchModulation);
                EditorGUILayout.PropertyField(directionality);

                EditorGUILayout.Space();

                EditorGUILayout.LabelField("Attenuation", EditorStyles.boldLabel);

                EditorGUILayout.PropertyField(updateInSceneView);
                EditorGUILayout.PropertyField(minAudibleDistance);
                EditorGUILayout.PropertyField(maxAudibleDistance);
            }

            if (EditorGUI.EndChangeCheck())
            {
                serializedObject.ApplyModifiedProperties();
                
                EditorApplication.delayCall += () =>
                {
                    foreach (var target in targets)
                        ((AudioZone)target).Rebuild();
                };
                    
            }
            
            UI.DrawFooter();
        }
    }
}
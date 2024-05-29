// Water Geometry Tools
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using UnityEditor;
using UnityEngine;

namespace sc.modeling.water.common.editor
{
    public class UI
    {
        public static void DrawActionBox(string message, MessageType messageType, string buttonLabel = "", Action action = null)
        {
            EditorGUILayout.HelpBox(message, messageType);

            GUILayout.Space(-32);
            using (new EditorGUILayout.HorizontalScope())
            {
                GUILayout.FlexibleSpace();

                GUIContent content = new GUIContent(buttonLabel, EditorGUIUtility.IconContent("d_tab_next").image);
                if (GUILayout.Button(content, GUILayout.Width(EditorStyles.miniButton.CalcSize(content).x)))
                {
                    action.Invoke();
                }
                GUILayout.Space(8);
            }
            GUILayout.Space(11);
        }

        public static void OpenStorePage(int id, string pubref)
        {
            Application.OpenURL($"https://assetstore.unity.com/packages/slug/{id}?id=1011l7Uk8&pubref={pubref}");
        }

        public static void DrawHeader(string assetName, string version)
        {
            EditorGUILayout.LabelField($"{assetName} (version {version})", EditorStyles.centeredGreyMiniLabel);
            
            EditorGUILayout.Space();
        }
        
        public static void DrawFooter()
        {
            EditorGUILayout.Space();

            EditorGUILayout.LabelField(new GUIContent("- Staggart Creations -"), EditorStyles.centeredGreyMiniLabel);
        }
    }
}
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

namespace sc.modeling.river.editor
{
    public static class Asset
    {
        public const string NAME = "River Modeler";
        public const string VERSION = "1.0.2";
        public const int ID = 263898;

        #region Installer
        internal abstract class Installer : sc.modeling.water.common.editor.PackageInstaller
        {
            private static readonly string[] requiredPackages = 
            {
                "com.unity.splines@2.3.0", 
                "com.unity.mathematics", 
                "com.unity.visualeffectgraph",
                "com.unity.shadergraph"
            };
            
            //Symbols defined by assembly definition
            #if !SPLINES || !MATHEMATICS || !VFXGRAPH || !SHADERGRAPH
            [InitializeOnLoadMethod]
            private static void AutoInstall()
            {
                InstallDependencies(NAME, requiredPackages);
            }

            [MenuItem("River Modeler/Install dependencies")]
            private static void InstallMenuFunction()
            {
                AutoInstall();
            }
            #endif

        }
        #endregion
        
        public static class Preferences
        {
            public static bool ShowToolPoints
            {
                get => EditorPrefs.GetBool(PlayerSettings.productName + "_RIVER_EDITOR_ShowToolPoints", false);
                private set => EditorPrefs.SetBool(PlayerSettings.productName + "_RIVER_EDITOR_ShowToolPoints", value);
            }
            
            [SettingsProvider]
            public static SettingsProvider ScreenshotSettings()
            {
                var provider = new SettingsProvider($"Preferences/Water Geometry Tools/River", SettingsScope.User)
                {
                    label = "River Editor",
                    guiHandler = (searchContent) =>
                    {
                        ShowToolPoints = EditorGUILayout.ToggleLeft("Show tool points", ShowToolPoints);
                        EditorGUILayout.HelpBox("When enabled, data points for tools such as Width and Opacity will always be displayed on rivers, even when not active.\n\n", MessageType.Info);
                    },

                    keywords = new HashSet<string>(new[]
                    {
                        "River"
                    })
                };

                return provider;
            }
        }
    }
}
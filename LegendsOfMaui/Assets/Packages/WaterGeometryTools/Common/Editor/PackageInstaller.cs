// Water Geometry Tools
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using UnityEditor.PackageManager;
using UnityEditor.PackageManager.Requests;
using UnityEngine;
using UnityEditor;

using PackageInfo = UnityEditor.PackageManager.PackageInfo;

namespace sc.modeling.water.common.editor
{
    public class PackageInstaller
    {
        private struct Package
        {
            public string name;
            public string minVersion;
            public string latestVersion;
        }

        protected static void InstallDependencies(string assetName, string[] requiredPackages)
        {
            List<Package> dependencies = new List<Package>();

            //Check if dependencies are installed
            for (int i = 0; i < requiredPackages.Length; i++)
            {
                #if WGT_DEV
                Debug.Log($"Searching for package {requiredPackages[i]}");
                #endif
                
                SearchRequest request = Client.Search(requiredPackages[i], false);

                while (request.Status == StatusCode.InProgress)
                {
                    /* Waiting... */
                }

                if (request.IsCompleted)
                {
                    if (request.Result == null)
                    {
                        Debug.LogError($"Searching for package {requiredPackages[i]} failed");
                        continue;
                    }
                    
                    PackageInfo packageInfo = request.Result[0];
                    
                    //Installed in project?
                    bool installed = packageInfo.assetPath != string.Empty;
                    bool outdated = false;
                    
                    bool hasMinVersion = requiredPackages[i].Split('@').Length > 1;
                    Version reqVersion = null;
                    
                    if (hasMinVersion)
                    {
                        reqVersion = new Version(requiredPackages[i].Split('@')[1]);
                        outdated = new Version(packageInfo.version) < reqVersion;
                    }
                    
                    //Outdated?
                    if (outdated)
                    {
                        #if WGT_DEV
                        Debug.Log($"[{assetName}] {requiredPackages[i]} outdated and must be upgraded");
                        #endif
                        
                        installed = false;
                    }

                    if (installed)
                    {
                        #if WGT_DEV
                        Debug.Log($"[{assetName}] {requiredPackages[i]} already installed");
                        #endif
                    }
                    else
                    {
                        #if WGT_DEV
                        Debug.Log($"[{assetName}] {requiredPackages[i]} dependency not installed or outdated, so will be installed/updated");
                        #endif

                        Package package = new Package();

                        string id = requiredPackages[i].Split('@')[0];
                        package.name = id;
                        package.latestVersion = packageInfo.versions.latestCompatible;
                        package.minVersion = hasMinVersion ? reqVersion.ToString() : package.latestVersion;

                        dependencies.Add(package);
                    }
                }
            }
            
            if (dependencies.Count > 0)
            {
                string message = "This asset has the following missing package dependencies:\n";
                
                int installCount = 0;

                for (int i = 0; i < dependencies.Count; i++)
                {
                    message += $"\n- {dependencies[i].name} (v{dependencies[i].minVersion}+)";
                }

                if (EditorUtility.DisplayDialog(assetName, message, "Install now", "Ignore"))
                {
                    for (int i = 0; i < dependencies.Count; i++)
                    {
                        AddRequest addRequest = Client.Add(dependencies[i].name + "@" + dependencies[i].latestVersion);
                        
                        //Wait until finished
                        while (!addRequest.IsCompleted || addRequest.Status == StatusCode.InProgress) { }
                        
                        installCount++;
                    }
                    
                    if (installCount > 0)
                    {
                        EditorUtility.DisplayDialog(assetName, $"One or more dependencies are going be installed." +
                                                               $"\n\nBecause the asset \"{assetName}\" was imported BEFORE they were, some aspects like component data, Shader Graphs and VFX Graphs are most likely broken and need to be re-imported from the asset store." +
                                                               $"\n\nIf you're unsure about this, simply delete and reimport the entire package from the Asset Store." +
                                                               $"" +
                                                               $"\n\nThis mainly applies to situations where you first import the asset into a project", "OK");
                    }
                }
                else
                {
                    EditorUtility.DisplayDialog(assetName, "The core functionality, or parts, of this asset will remain unavailable until these package(s) are installed or updated to the required version." +
                                                           "\n\nAsset files that depend on a package (such as Shader/VFX Graphs) will be broken.", "I understand");
                }
            }
            else
            {
                #if WGT_DEV
                Debug.Log($"[{assetName}] All dependencies installed!");
                #endif
            }
        }

        public static void InstallFBXExporter()
        {
            string packageName = "com.unity.formats.fbx";
            
            SearchRequest request = Client.Search(packageName);
                
            while (request.Status == StatusCode.InProgress) { /* Waiting... */ }

            if (request.Status == StatusCode.Failure)
            {
                Debug.LogError("Failed to retrieve FBX Exporter package from Package Manager...");
                return;
            }

            PackageInfo package = request.Result[0];
            
            AddRequest addRequest = Client.Add($"{packageName}@{package.versions.latestCompatible}");
                        
            //Wait until finished
            while (!addRequest.IsCompleted || addRequest.Status == StatusCode.InProgress) { }
            
            Debug.Log($"Successfully installed the <b>{packageName}</b> package");
        }
    }
}
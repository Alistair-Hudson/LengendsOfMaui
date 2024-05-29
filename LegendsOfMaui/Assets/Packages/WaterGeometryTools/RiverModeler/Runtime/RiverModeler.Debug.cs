// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using UnityEngine;

namespace sc.modeling.river.runtime
{
    public partial class RiverModeler
    {
        public enum DebugMode
        {
            None,
            Wireframe,
            Bounds,
            UV,
            Foam,
            Transparency,
        }
        
        public DebugMode debugMode = DebugMode.None;
        
        [NonSerialized]
        private Material debugMaterial;
        private static readonly int _VertexColorChannel = Shader.PropertyToID("_VertexColorChannel");

        partial void DrawDebugging()
        {
            if (meshFilter)
            {
                if (debugMode == DebugMode.Wireframe)
                {
                    Gizmos.matrix = meshFilter.transform.localToWorldMatrix;
                    Gizmos.color = new Color(0f,0f,0f,0.5f);
                    Gizmos.DrawWireMesh(meshFilter.sharedMesh);
                }

                if (debugMode == DebugMode.Bounds)
                {
                    Gizmos.color = Color.yellow;
                    Gizmos.matrix = meshFilter.transform.localToWorldMatrix;
                    Gizmos.DrawWireCube(meshFilter.sharedMesh.bounds.center, meshFilter.sharedMesh.bounds.size);
                }

                bool vertexColor = debugMode == DebugMode.Foam || debugMode == DebugMode.Transparency;
                
                if (debugMode == DebugMode.UV || vertexColor)
                {
                    if (debugMaterial == null) debugMaterial = new Material(Shader.Find("Hidden/Visualize Vertex Attributes"));

                    int vcChannel = 0;

                    switch (debugMode)
                    {
                        case DebugMode.Foam: vcChannel = (int)settings.foam.vertexColorChannel;
                            break;
                        case DebugMode.Transparency: vcChannel = (int)settings.transparency.vertexColorChannel;
                            break;
                    }
                    debugMaterial.SetFloat(_VertexColorChannel, vcChannel);

                    void SetKeyword(string id, bool state)
                    {
                        if(state) debugMaterial.EnableKeyword(id);
                        else debugMaterial.DisableKeyword(id);
                    }
                    
                    SetKeyword("_SHOW_VERTEX_COLOR", vertexColor);
                    SetKeyword("_SHOW_UV", debugMode == DebugMode.UV);
                    
                    debugMaterial.SetPass(0);
                    Graphics.DrawMeshNow(meshFilter.sharedMesh, meshFilter.transform.localToWorldMatrix);
                }
            }
        }
    }
}
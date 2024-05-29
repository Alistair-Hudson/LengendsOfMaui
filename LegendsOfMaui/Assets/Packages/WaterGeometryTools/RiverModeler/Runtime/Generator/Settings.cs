// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using UnityEngine;
#if MATHEMATICS
using Unity.Mathematics;
#endif

namespace sc.modeling.river.runtime
{
    [Serializable]
    public class Settings
    {
        public enum VertexColorChannel
        {
            Red, Green, Blue, Alpha
        }
        
        [Serializable]
        public class Triangulation
        {
            [Tooltip("Minimum distance between each edge loop created over the length of the spline." +
                     "\n\nUse higher values if corners exhibited overlapping triangles")]
            [Min(0.5f)] public float vertexDistance = 2f;
            [Tooltip("Minimum distance between each edge loop created over the width of the river." +
                     "\n\nTypically want to keep this between 1-2 to add sufficient vertices for effects.")]
            [Min(0.5f)] public float vertexDistanceWidth = 1f;
            
            [Header("Simplification")]
            [Tooltip("Optimize the mesh by skipping edge loops on sections that run straight")]
            [Min(0f)]
            public float turnFilter;

            [Tooltip("Reduces the amount of edge loops on spline areas that are considered flat")]
            [Min(0f)]
            public float flatFilter = 0f;
        }
        public Triangulation triangulation = new Triangulation();

        [Serializable]
        public class Shape
        {
            [Tooltip("The base width of the mesh")]
            [Min(0.1f)] public float width = 10f;
            
            [Space]

            [Tooltip("Offsets the generated geometry from the spline curve.")]
            public Vector2 offset;
            [Tooltip("Curvature of the mesh over the width of the river")]
            public AnimationCurve widthCurve = AnimationCurve.Linear(0f, 0f, 1f, 0f);
            [Tooltip("Ignore the X and Z rotation of a spline knot so the river stays level")]
            public bool twistCorrection = false;
        }
        public Shape shape = new Shape();
        
        [Serializable]
        public class Displacement
        {
            [Serializable]
            public class Layer
            {
                [Tooltip("Perlin noise frequency as repeated over the spline. Typical values lies between 0.1 and 1")]
                public Vector2 noiseFrequency = new Vector2(0.2f, 1f);
                [Tooltip("Vertical offset created by the noise")]
                [Range(0f, 2f)]
                public float noiseAmplitude;

                [Tooltip("Angle range this noise layer takes effect in")]
                public Vector2 minMaxSlopeAngle = new Vector2(0f, 90f);

                [Range(0f, 1f)]
                [Tooltip("Remaps the values. 0=Only negative (downward) displacement. 1=Only positive (upward) displacement.")]
                public float normalization = 0.5f;
            }

            public List<Layer> layers = new List<Layer>()
            {
                new Layer()
            };
        }
        public Displacement displacement = new Displacement();
        
        [Serializable]
        public class UV
        {
            public Vector2 tiling = new Vector2(1f, 1f);
            [Tooltip("Push the edges of the UV slightly back on the Y-axis, to simulate slower water")]
            public float edgeDrag = 0f;
            
            [Space]
            
            public bool reverse;
            public bool rotate;

            [Space]

            [Tooltip("Enable the generation of a lightmap UV. This is a UV that repeat once over the surface of the mesh")]
            public bool lightmapUV;
            [Tooltip("Store the rivers flow direction into the UV2 channel (in C#: Mesh.uv3). This may be used in both shaders and C# flow calculations")]
            public bool flowVectors;
        }
        public UV uv = new UV();
        
        [Serializable]
        public class Foam
        {
            [Tooltip("Vertex color channel to store the foam weights in." +
                     "\n\nFor Stylized Water 2 choose the Alpha channel")]
            public VertexColorChannel vertexColorChannel = VertexColorChannel.Alpha;

            [Range(0f,1f)]
            public float uniformAmount = 0f;
            
            [Space]
            
            public Vector2 noiseFrequency = new Vector2(1f, 1f);
            [Range(0f, 2f)]
            public float noiseAmplitude = 0f;
            [Tooltip("Perform a smoothstep operation on the generated noise")]
            public Vector2 noiseLevels = new Vector2(0f, 1f);
            
            [Space]
            
            [Range(0f,1f)]
            [Tooltip("Contribute displacement to foam weight")]
            public float displacementFoam;
            [Tooltip("Perform a smoothstep operation on the generated displacement")]
            public Vector2 displacementLevels = new Vector2(0f, 1f);

            [Space]
            
            [Range(0f,1f)]
            public float opacity = 1f;

            public void Validate()
            {
                noiseLevels.x = Mathf.Clamp01(noiseLevels.x);
                noiseLevels.y = Mathf.Clamp01(noiseLevels.y);
                displacementLevels.x = Mathf.Clamp01(displacementLevels.x);
                displacementLevels.y = Mathf.Clamp01(displacementLevels.y);
            }
        }
        public Foam foam = new Foam();

        [Serializable]
        public class Transparency
        {
            [Tooltip("Vertex color channel to store the transparency weights in." +
                     "\n\nFor Stylized Water 2 choose the Green channel")]
            public VertexColorChannel vertexColorChannel = VertexColorChannel.Green;
            
            /*
            [Min(0f)]
            public float sideFadeDistance = 0f;
            [Min(0f)]
            public float sideFadeFalloff = 0f;
            */
        }
        public Transparency transparency;
    }
}
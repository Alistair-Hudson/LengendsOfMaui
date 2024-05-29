// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System.Collections.Generic;
using sc.modeling.water.common.runtime;
using UnityEngine;
using Random = UnityEngine.Random;

#if MATHEMATICS
using Unity.Mathematics;
#endif

namespace sc.modeling.river.runtime
{
    [AddComponentMenu("Water/River/River Splash VFX")]
    [HelpURL("https://staggart.xyz/river-modeler-docs/?section=splash-vfx")]
    public class SplashVFX : RiverVFX
    {
        [Range(0f,1f)]
        [Tooltip("Threshold to meet for the foam vertex color")]
        public float foamThreshold = 0.2f;
        [Tooltip("Emitters will only be created if the surface angle falls within this range")]
        public Vector2 minMaxSlopeAngle = new Vector2(0f, 5f);
        [Range(0f, 100f)]
        public float spawnChance = 100f;
        
        //Analyze the mesh's vertex colors to detect foam
        public override void GenerateEmitters()
        {
            #if VFX_GRAPH && MATHEMATICS
            if (!river || !targetEffect || !river.meshFilter) return;

            emitters = new List<VFX.Emitter>();

            Vector3[] vertices = river.meshFilter.sharedMesh.vertices;
            Vector3[] normals = river.meshFilter.sharedMesh.normals;
            var pCount = vertices.Length;
            Color[] colors = river.meshFilter.sharedMesh.colors;

            if (confines == Confines.Bounds) bounds = new Bounds(this.transform.position, boundsSize);
            
            for (int i = 0; i < pCount; i++)
            {
                float3 worldPos = river.meshFilter.transform.TransformPoint(vertices[i]);

                if (confines == Confines.Bounds)
                {
                    if (bounds.Contains(worldPos) == false) continue;
                }

                vertices[i] = targetEffect.transform.InverseTransformPoint(worldPos);

                //Ensure opacity also subtracts from foam
                var weight = colors[i][(int)river.settings.foam.vertexColorChannel];

                weight -= colors[i][(int)river.settings.transparency.vertexColorChannel];

                float slopeMask = 0f;
                #if MATHEMATICS
                float angle = ((float)math.acos(math.dot(normals[i], Vector3.up)) * Mathf.Rad2Deg);

                if (angle > minMaxSlopeAngle.x && angle < minMaxSlopeAngle.y) slopeMask = 1f;
                #endif

                //Random.InitState(i + (int)Time.time);
                if (slopeMask > 0 && weight >= foamThreshold && (Random.value * 100 < spawnChance))
                {
                    VFX.Emitter emitter = new VFX.Emitter();
                    emitter.position = vertices[i];

                    emitters.Add(emitter);
                }
            }

            ApplyEmitters();
            
            #endif
        }
    }
}
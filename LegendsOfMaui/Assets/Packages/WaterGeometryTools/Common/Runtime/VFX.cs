using System;
using System.Collections.Generic;
using UnityEngine;

#if MATHEMATICS
using Unity.Mathematics;
#endif
#if VFX_GRAPH
using UnityEngine.VFX;
#endif

namespace sc.modeling.water.common.runtime
{
    public static class VFX
    {
        public const string DEFAULT_EFFECT_GUID = "e4f6c7bafe287f84fa437a2c93276b5a";
        
        private const int MAX_EMITTERS = 16384;

        #if MATHEMATICS
        public struct Emitter
        {
            /// <summary>
            /// Position in local-space of VFX Graph
            /// </summary>
            public float3 position;
            /// <summary>
            /// Velocity vector in local-space
            /// </summary>
            public float3 velocity;
        }

        [Serializable]
        public class PointCache
        {
            [SerializeField]
            public Texture2D positions;
            [SerializeField]
            public Texture2D velocities;
            
            private const string EmitterPositionsName = "Emitter Positions";
            private static int EmitterPositionsID = Shader.PropertyToID(EmitterPositionsName);
        
            private const string EmitterVelocitesName = "Emitter Velocity";
            private static int EmitterVelocitesID = Shader.PropertyToID(EmitterVelocitesName);

            public void SetData(List<Emitter> emitters)
            {
                if (emitters.Count == 0)
                {
                    positions = Texture2D.blackTexture;
                    velocities = Texture2D.blackTexture;
                    return;
                }
            
                if (emitters.Count-1 >= MAX_EMITTERS)
                {
                    throw new Exception($"Maximum amount of particle emitters exceeded ({MAX_EMITTERS}). Change the spawning criteria so fewer emitters are created. Such as increasing distances, or using multiple components for different sections of the river.");
                }
            
                var emitterCount = math.clamp(emitters.Count, 1, MAX_EMITTERS);

                if (positions == null || positions.width != emitterCount)
                {
                    positions = new Texture2D(emitterCount, 1, TextureFormat.RGBAFloat, false, true);
                    positions.wrapMode = TextureWrapMode.Repeat;
                    positions.name = $"Emitter Positions";
                }

                if (velocities == null || velocities.width != emitterCount)
                {
                    velocities = new Texture2D(emitterCount, 1, TextureFormat.RGBAFloat, false, true);
                    velocities.wrapMode = TextureWrapMode.Repeat;
                    velocities.name = $"Emitter Velocity";
                }
            
                for (int i = 0; i < emitterCount; i++)
                {
                    positions.SetPixel(i, 0, new Color(emitters[i].position.x, emitters[i].position.y, emitters[i].position.z, 1f));
                    velocities.SetPixel(i, 0, new Color(emitters[i].velocity.x, emitters[i].velocity.y, emitters[i].velocity.z, 1f));
                }
            
                positions.Apply(false);
                velocities.Apply(false);
            }
            
            #if VFX_GRAPH
            public void ApplyToEffect(VisualEffect effect, bool clear = false)
            {
                if (effect && effect.visualEffectAsset)
                {
                    if (effect.HasTexture(EmitterPositionsID))
                    {
                        //Note: A bug introduces in 2022.3 requires resetting the override state before a texture assignment.
                        
                        effect.ResetOverride(EmitterPositionsID);
                        effect.SetTexture(EmitterPositionsID, clear || positions == null ? Texture2D.blackTexture : positions);

                        effect.ResetOverride(EmitterVelocitesID);
                        effect.SetTexture(EmitterVelocitesID, clear || velocities == null ? Texture2D.blackTexture : velocities);
                    }
                    else
                    {
                        throw new Exception($"Failed to generate emitters. The VFX Graph \"{effect.visualEffectAsset.name}\" rendering output or point cache input is missing. " +
                                            $"This graph was constructed for the Universal Render Pipeline, it was likely imported without URP being installed. If you believe this is in error, open up the graph and recompile it.");
                    }
                }
            }
            #endif

            #if VFX_GRAPH
            public static bool IsValidTargetEffect(VisualEffect effect)
            {
                if (effect && effect.visualEffectAsset)
                {
                    /*
                    List<VFXExposedProperty> props = new List<VFXExposedProperty>();
                    targetEffect.visualEffectAsset.GetExposedProperties(props);
    
                    Debug.Log($"Exposed properties: {props.Count}");
                    foreach (var prop in props)
                    {
                        Debug.Log(prop.name);
                    }
                    */
                
                    return effect.HasTexture(EmitterPositionsID);
                }
            
                return false;
            }
            #endif
        }
        #endif


        #if VFX_GRAPH
        public static void SetSortingOrder(VisualEffect effect, int sortingOrder)
        {
            if (effect)
            {
                Renderer vfxRenderer = effect.GetComponent<Renderer>();
                vfxRenderer.sortingOrder = sortingOrder;
            }
        }
        #endif
    }
}
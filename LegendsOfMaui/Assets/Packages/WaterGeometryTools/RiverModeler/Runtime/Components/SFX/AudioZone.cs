// River Modeler
// Staggart Creations (http://staggart.xyz)
// Copyright protected under Unity Asset Store EULA
// Copying or referencing source code for the production of new asset store content is strictly prohibited.

using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
using Random = UnityEngine.Random;

#if MATHEMATICS
using Unity.Mathematics;
#endif
#if SPLINES
using UnityEngine.Splines;
using Interpolators = UnityEngine.Splines.Interpolators;
#endif

#if UNITY_EDITOR
using UnityEditor;
#endif

namespace sc.modeling.river.runtime
{
    [ExecuteAlways]
    [AddComponentMenu("Water/River/River Audio Zone")]
    [HelpURL("https://staggart.xyz/river-modeler-docs/?section=audio-zone")]
    public class AudioZone : MonoBehaviour
    {
        public RiverModeler river;
        
        public enum Confines
        {
            EntireMesh,
            Bounds
        }
        
        public Confines confines;
        public Vector3 boundsSize = Vector3.one * 10f;
        
        public Vector2 minMaxSlopeAngle = new Vector2(0f, 90f);
        [Range(0f,100f)]
        public float resolution = 100f;
        
        [Tooltip("An audio clip will be randomly picked from this array, for added variation")]
        public List<AudioClip> clips = new List<AudioClip>();
        public AudioMixerGroup outputMixer;

        [Range(0f,1f)]
        public float maxVolume = 1f;
        [Range(0f, 0.5f)]
        public float pitchModulation = 0.1f;
        [Range(0f, 1f)]
        [Tooltip("Blend between Mono/2D (0) and Stereo/3D (0).")]
        public float directionality = 0.75f;

        [Tooltip("Attenuate the audio emitters based on their distance from the scene-view camera.")]
        public bool updateInSceneView = true;
        
        [Min(0f)]
        public float minAudibleDistance = 20f;
        [Min(1f)]
        public float maxAudibleDistance = 200f;

        [SerializeField]
        private AudioSource[] emitters = Array.Empty<AudioSource>();
        [NonSerialized]
        private Bounds bounds;

        private void OnEnable()
        {
            RiverModeler.onPreRebuildRiver += OnRiverChange;

            if (Application.isPlaying) Play();
            
            #if UNITY_EDITOR
            SceneView.duringSceneGui += OnSceneGUI;
            #endif
        }
        
        private void OnDisable()
        {
            RiverModeler.onPreRebuildRiver -= OnRiverChange;
            
            #if UNITY_EDITOR
            SceneView.duringSceneGui -= OnSceneGUI;
            #endif
        }

        private void OnRiverChange(RiverModeler instance, RiverModeler.ChangeFlags updateFlags)
        {
            if (updateFlags.HasFlag(RiverModeler.ChangeFlags.All) || updateFlags.HasFlag(RiverModeler.ChangeFlags.Spline) && river != null && river.GetHashCode() == instance.GetHashCode())
            {
                //Debug.Log("Updating audio zone: " + updateFlags);
                
                Rebuild();
            }
        }

        void Reset()
        {
            river = GetComponentInParent<RiverModeler>();
            if(!river) river = GetComponent<RiverModeler>();
        }

        private void Start()
        {
            Play();
        }

        [ContextMenu("Play")]
        public void Play()
        {
            for (int i = 0; i < emitters.Length; i++)
            {
                if (!emitters[i] || !emitters[i].clip) continue;
                
                //Offset the starting point
                emitters[i].time = Random.Range(0f, emitters[i].clip.length);
                emitters[i].Play();
            }
        }

        #if MATHEMATICS
        public struct SpawnPoint
        {
            public float3 position;
            public float radius;
        }
        private List<SpawnPoint> spawnPoints;
        #endif
        
        [NonSerialized]
        private AudioListener audioListener;

        public void Rebuild()
        {
            #if SPLINES && MATHEMATICS

            if (clips.Count == 0) return;
            
            spawnPoints = new List<SpawnPoint>();

            var splineContainer = river.splineContainer;
            Interpolators.LerpFloat3 scaleInterpolator = new Interpolators.LerpFloat3();
            
            float3 prevSpawnPos = Vector3.positiveInfinity;
            float prevEmitterRadius = 0f;
            
            if (confines == Confines.Bounds) bounds = new Bounds(this.transform.position, boundsSize);

            for (int s = 0; s < splineContainer.Splines.Count; s++)
            {
                float length = splineContainer.Splines[s].CalculateLength(splineContainer.transform.localToWorldMatrix);
                int sampleCount = Mathf.CeilToInt((length * (resolution * 0.01f)) / (river.settings.triangulation.vertexDistance));

                for (int y = 0; y <= sampleCount; y++)
                {
                    float t = (float)y / (float)(sampleCount); //Normalized position

                    splineContainer.Splines[s].Evaluate(t, out var position, out var tangent, out var normal);

                    if (confines == Confines.Bounds)
                    {
                        //Early out if spline point falls outside of bounds
                        if (bounds.Contains(splineContainer.transform.TransformPoint(position)) == false) continue;
                    }
                    
                    float3 scale = river.ScaleData[s] != null ? river.ScaleData[s].Evaluate(splineContainer.Splines[s], t, river.ScaleData[s].PathIndexUnit, scaleInterpolator) : Vector3.one;

                    SpawnPoint spawnPoint = new SpawnPoint();
                    spawnPoint.position = splineContainer.transform.TransformPoint(position);
                    spawnPoint.radius = math.max(minAudibleDistance, (scale.x * river.settings.shape.width) * 0.5f);

                    float prevEmitterDist = math.distancesq(prevSpawnPos + (math.normalize(tangent) * prevEmitterRadius), spawnPoint.position);
                    
                    float angle = ((float)math.acos(math.dot(normal, Vector3.up)) * Mathf.Rad2Deg);

                    float slopeMask = 0f;
                    if (angle > minMaxSlopeAngle.x && angle < minMaxSlopeAngle.y) slopeMask = 1f;
                    
                    if (slopeMask > 0 && prevEmitterDist > (spawnPoint.radius * spawnPoint.radius))
                    {
                        spawnPoints.Add(spawnPoint);

                        prevSpawnPos = spawnPoint.position;
                        prevEmitterRadius = spawnPoint.radius;
                    }
                }
            }
            
            if (emitters.Length != spawnPoints.Count)
            {
                RecreateEmitters();
            }
            
            UpdateEmitters();
            #endif
        }

        void RecreateEmitters()
        {
            #if MATHEMATICS
            //Delete current first, to ensure no colliders are in the way
            for (int i = 0; i < emitters.Length; i++)
            {
                if (emitters[i])
                {
                    DestroyImmediate(emitters[i].gameObject);
                }
            }
            AudioSource[] audioSources = GetComponentsInChildren<AudioSource>();
            for (int i = 0; i < audioSources.Length; i++)
            {
                DestroyImmediate(audioSources[i].gameObject);
            }

            emitters = new AudioSource[spawnPoints.Count];

            for (int i = 0; i < emitters.Length; i++)
            {
                GameObject obj = new GameObject($"AudioEmitter_{i}");
                obj.transform.parent = this.transform;
                
                AudioSource emitter = obj.AddComponent<AudioSource>();
                
                emitter.transform.position = spawnPoints[i].position;

                emitters[i] = emitter;
            }
            #endif
        }

        void UpdateEmitters()
        {
            #if MATHEMATICS
            for (int i = 0; i < emitters.Length; i++)
            {
                if (!emitters[i]) continue;

                emitters[i].playOnAwake = false;
                emitters[i].clip = clips[Random.Range(0, clips.Count)];
                emitters[i].gameObject.name = $"AudioEmitter_{i}";
                emitters[i].outputAudioMixerGroup = outputMixer;
                emitters[i].loop = true;
                emitters[i].spatialBlend = directionality;
                emitters[i].rolloffMode = AudioRolloffMode.Linear;
                emitters[i].pitch = UnityEngine.Random.Range(1f - pitchModulation, 1f + pitchModulation);
                emitters[i].volume = 0f;
                emitters[i].minDistance = minAudibleDistance + spawnPoints[i].radius;
                emitters[i].maxDistance = emitters[i].minDistance + maxAudibleDistance;
                emitters[i].dopplerLevel = 0f;
            }
            
            Play();
            #endif
        }

        void Update()
        {
            if (Application.isPlaying == false) return;

            #if UNITY_2022_1_OR_NEWER
            if (!audioListener) audioListener = FindFirstObjectByType<AudioListener>();
            #else
            if (!audioListener) audioListener = FindObjectOfType<AudioListener>();
            #endif
            if (!audioListener) return;
            
            ApplyVolumeAttenuation(audioListener.transform.position);
        }
        
        #if UNITY_EDITOR
        private void OnSceneGUI(SceneView sceneView)
        {
            if (Application.isPlaying) return;
            
            if (updateInSceneView && sceneView.audioPlay)
            {
                ApplyVolumeAttenuation(sceneView.camera.transform.position);
            }
            else
            {
                ApplyVolumeAttenuation(Vector3.one * 100000f);
            }
        }
        #endif
        
        private void ApplyVolumeAttenuation(Vector3 listener)
        {
            #if MATHEMATICS
            for (int i = 0; i < emitters.Length; i++)
            {
                if (!emitters[i]) continue;

                var dist = math.distance(emitters[i].transform.position, listener);
                
                var minDist = emitters[i].minDistance;
                var maxDist = emitters[i].maxDistance;
                
                emitters[i].volume = math.clamp(1f-((dist - minDist) / (maxDist - minDist)), 0, maxVolume);
            }
            #endif
        }

        private void OnDrawGizmosSelected()
        {
            for (int i = 0; i < emitters.Length; i++)
            {
                if (!emitters[i]) continue;
                
                Gizmos.color = Color.yellow;
                Gizmos.DrawWireSphere(emitters[i].transform.position, emitters[i].minDistance);
            }
            
            if (confines == Confines.Bounds)
            {
                Gizmos.DrawWireCube(this.transform.position, boundsSize);
            }
        }
    }
}
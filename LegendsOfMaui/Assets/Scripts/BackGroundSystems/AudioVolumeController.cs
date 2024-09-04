using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(AudioSource))]
    public class AudioVolumeController : MonoBehaviour
    {
        [SerializeField] 
        private float _normalVolume = 0.5f;
        [SerializeField]
        private float _combatVolume = 1.0f;
        [SerializeField]
        private float _fadeTime = 1.0f;

        private AudioSource _audioSource = null;
        private Coroutine _fadingCoroutine = null;
        private int _numEnemiesInCombat = 0;

        public static AudioVolumeController Instance { get; private set; } = null;

        public void EnterCombat()
        {
            _numEnemiesInCombat++;
            if (_numEnemiesInCombat != 1)
            {
                return;
            }

            if (_fadingCoroutine != null)
            {
                StopCoroutine(_fadingCoroutine);
            }
            _fadingCoroutine = StartCoroutine(FadeVolume(_audioSource.volume, _combatVolume));
        }

        public void ExitCombat()
        {
            _numEnemiesInCombat--;
            if (_numEnemiesInCombat > 0)
            {
                return;
            }

            if (_fadingCoroutine != null)
            {
                StopCoroutine(_fadingCoroutine);
            }
            _fadingCoroutine = StartCoroutine(FadeVolume(_audioSource.volume, _normalVolume));
        }

        private void Awake()
        {
            _audioSource = GetComponent<AudioSource>();
            Instance = this;
        }

        private IEnumerator FadeVolume(float currentVolume, float targetVolume)
        {
            float time = _fadeTime;
            while (time > 0.0f)
            {
                yield return null;
                time--;
                _audioSource.volume = Mathf.Lerp(currentVolume, targetVolume, time);
            }

            _audioSource.volume = targetVolume;
        }
    }
}
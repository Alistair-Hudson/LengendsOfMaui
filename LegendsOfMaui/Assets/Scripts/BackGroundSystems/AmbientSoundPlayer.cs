using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(AudioSource))]
    public class AmbientSoundPlayer : MonoBehaviour
    {
        [SerializeField]
        private float _maxDelayBetweenSounds = 30;
        [SerializeField]
        private AudioClip _sound = null;
        [SerializeField]
        private bool _isNocturnal = false;

        private AudioSource _audioSource = null;

        private void Awake()
        {
            _audioSource = GetComponent<AudioSource>();
            _audioSource.clip = _sound;
            if (_isNocturnal)
            {
                DayNightCycle.NightIsActiveEvent += Awaken;
                Awaken(DayNightCycle.IsNight);
            }
            else
            {
                DayNightCycle.DayIsActiveEvent += Awaken;
                Awaken(!DayNightCycle.IsNight);
            }
        }

        private void OnDestroy()
        {
            if (_isNocturnal)
            {
                DayNightCycle.NightIsActiveEvent -= Awaken;
            }
            else
            {
                DayNightCycle.DayIsActiveEvent -= Awaken;
            }
        }

        private IEnumerator Start()
        {
            while (true)
            {
                yield return new WaitForSeconds(UnityEngine.Random.Range(0, _maxDelayBetweenSounds));
                PlaySound();
                yield return new WaitUntil(() => !_audioSource.isPlaying);
            }
        }

        private void PlaySound()
        {
            _audioSource.Play();
        }

        private void Awaken(bool awaken)
        {
            gameObject.SetActive(awaken);
        }
    }
}
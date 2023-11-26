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
        private float _delayBetweenSounds = 30;
        [SerializeField]
        private AudioClip[] _dayBirdSounds;
        [SerializeField]
        private AudioClip[] _nightBirdSounds;

        private AudioSource _audioSource = null;

        private void Awake()
        {
            _audioSource = GetComponent<AudioSource>();
        }

        private IEnumerator Start()
        {
            while (true)
            {
                if (DayNightCycle.Time >= 0.3f && DayNightCycle.Time < 0.7f)
                {
                    PlaySound(_dayBirdSounds);
                }
                else if (DayNightCycle.Time < 0.2f || DayNightCycle.Time > 0.8f)
                {
                    PlaySound(_nightBirdSounds);
                }
                yield return new WaitForSeconds(_delayBetweenSounds);
            }
        }

        private void PlaySound(AudioClip[] sounds)
        {
            int index = UnityEngine.Random.Range(0, sounds.Length);
            _audioSource.PlayOneShot(sounds[index]);
        }
    }
}
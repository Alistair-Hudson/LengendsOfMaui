using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(AudioSource))]
    public class SoundTrigger : MonoBehaviour
    {
        [SerializeField]
        private TMP_Text subtitles = null;
        [SerializeField]
        private List<AudioClip> audioClipsToPlay = new List<AudioClip>();
        [SerializeField]
        private bool isDisabledOnFinish = false;

        private AudioSource _audioSource = null;

        private void Awake()
        {
            _audioSource = GetComponent<AudioSource>();
        }

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }

            PlayAudioClips();
        }

        public void PlayAudioClips()
        {
            StartCoroutine(PlayAudioClipsInList());
        }

        private IEnumerator PlayAudioClipsInList()
        {
            subtitles.gameObject.SetActive(true);
            foreach (var audioClip in audioClipsToPlay)
            {
                _audioSource.PlayOneShot(audioClip);
                yield return new WaitUntil(() => !_audioSource.isPlaying);
            }

            if (isDisabledOnFinish)
            {
                gameObject.SetActive(false);
            }
        }
    }
}
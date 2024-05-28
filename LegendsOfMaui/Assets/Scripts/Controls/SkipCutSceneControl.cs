using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.Controls
{
    [RequireComponent(typeof(PlayableDirector))]
    public class SkipCutSceneControl : MonoBehaviour
    {
        [SerializeField]
        private Image skipFillBar = null;
        [SerializeField]
        private float secondsToFillBar = 1f;
        [SerializeField]
        private float timeToSkipTo = 0f;

        private PlayableDirector _director = null;

        private void Awake()
        {
            _director = GetComponent<PlayableDirector>();
            skipFillBar.fillAmount = 0;
        }

        private void Update()
        {
            if (_director.time >= timeToSkipTo)
            {
                return;
            }

            FillSkipFillBar();
            if (skipFillBar.fillAmount >= 1)
            {
                _director.time = timeToSkipTo;
            }
        }

        private void FillSkipFillBar()
        {
            if (Input.anyKey)
            {
                skipFillBar.fillAmount += secondsToFillBar * Time.deltaTime;
            }
            else
            {
                skipFillBar.fillAmount = 0;
            }
        }
    }
}
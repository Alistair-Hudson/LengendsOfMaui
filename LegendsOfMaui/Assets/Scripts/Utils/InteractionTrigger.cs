using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    [RequireComponent(typeof(Collider), typeof(PlayableDirector))]
    public class InteractionTrigger : MonoBehaviour
    {
        [SerializeField] 
        private List<MauiForms> _interactionForms = new List<MauiForms>(); 

        private bool _hasPlayed = false;

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }

            if (!_interactionForms.Contains(playerStateMachine.CurrentForm))
            {
                return;
            }
            playerStateMachine.PressToIntreract.gameObject.SetActive(true);
            playerStateMachine.InteractCall += HandleInteraction;
        }

        private void OnTriggerStay(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            if (!_interactionForms.Contains(playerStateMachine.CurrentForm))
            {
                OnTriggerExit(other);
                return;
            }
            OnTriggerEnter(other);
        }

        private void OnTriggerExit(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            playerStateMachine.PressToIntreract.gameObject.SetActive(false);
            playerStateMachine.InteractCall -= HandleInteraction;
        }

        private void HandleInteraction()
        {
            if (_hasPlayed)
            {
                return;
            }
            GetComponent<PlayableDirector>().Play();
        }

        public void TurnOffTrigger()
        {
            _hasPlayed = true;
            GetComponent<Collider>().enabled = false;
        }
    }
}
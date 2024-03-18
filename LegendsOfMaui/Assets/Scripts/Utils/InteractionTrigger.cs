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
        private bool NeedsToBeRupe = false;
        [SerializeField]
        private bool NeedsToBeHuman = false;

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            if (NeedsToBeHuman && playerStateMachine.IsShapeShifted)
            {
                return;
            }
            if (NeedsToBeRupe && !playerStateMachine.IsShapeShifted)
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
            if (NeedsToBeHuman && playerStateMachine.IsShapeShifted)
            {
                OnTriggerExit(other);
                return;
            }
            if (NeedsToBeRupe && !playerStateMachine.IsShapeShifted)
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
            playerStateMachine.InteractCall += HandleInteraction;
        }

        private void HandleInteraction()
        {
            GetComponent<PlayableDirector>().Play();
        }

        public void TurnOffTrigger()
        {
            GetComponent<Collider>().enabled = false;
            FindFirstObjectByType<PlayerStateMachine>().InteractCall -= HandleInteraction;
        }
    }
}
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
        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            playerStateMachine.PressToIntreract.gameObject.SetActive(true);
            playerStateMachine.InteractCall += HandleInteraction;
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
    }
}
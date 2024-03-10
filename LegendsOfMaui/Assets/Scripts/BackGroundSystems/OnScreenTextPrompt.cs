using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class OnScreenTextPrompt : MonoBehaviour
    {
        [SerializeField]
        private TMP_Text text = null;
        [SerializeField]
        private bool isDisabledOnExit = false;

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            text.gameObject.SetActive(true);
        }

        private void OnTriggerExit(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }
            text.gameObject.SetActive(false);
            if (isDisabledOnExit)
            {
                gameObject.SetActive(false);
            }
        }
    }
}
using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    public class Portal : MonoBehaviour
    {
        [SerializeField]
        private string connectingScene = "";
        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }

            SceneControl.LoadNextScene(connectingScene);
        }
    }
}
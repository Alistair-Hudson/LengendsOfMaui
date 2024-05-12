using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using AlictronicGames.LegendsOfMaui.StateMachines.NPC;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(Collider))]
    public class EnviromentActivationModule : MonoBehaviour
    {
        private void OnTriggerEnter(Collider other)
        {
            SetEnabledOfComponets(other, true);
        }

        private void OnTriggerExit(Collider other)
        {
            SetEnabledOfComponets(other, false);
        }

        private static void SetEnabledOfComponets(Collider other, bool isEnabled)
        {
            if (other.TryGetComponent<EnemyStateMachine>(out var statemachine))
            {
                statemachine.enabled = isEnabled;
            }
            if (other.TryGetComponent<NPCActionController>(out var actionController))
            {
                actionController.enabled = isEnabled;
            }
        }

    }
}
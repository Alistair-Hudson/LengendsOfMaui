using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class BlockTrigger : MonoBehaviour
    {
        [SerializeField]
        private int numberOfBlocksRequired = 1;
        [SerializeField]
        private UnityEvent BlocksMet;

        private int _timesBlocked = 0;

        private void OnEnable()
        {
            FindFirstObjectByType<PlayerStateMachine>().Health.OnDodged += HandleOnDodge;
        }

        private void OnDisable()
        {
            FindFirstObjectByType<PlayerStateMachine>().Health.OnDodged -= HandleOnDodge;
        }

        private void HandleOnDodge()
        {
            _timesBlocked++;
            if (_timesBlocked >= numberOfBlocksRequired)
            {
                BlocksMet?.Invoke();
            }
        }
    }
}
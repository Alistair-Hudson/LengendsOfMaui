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
            FindFirstObjectByType<PlayerStateMachine>().Health.OnBlocked += HandleOnBlock;
        }

        private void OnDisable()
        {
            FindFirstObjectByType<PlayerStateMachine>().Health.OnBlocked -= HandleOnBlock;
        }

        private void HandleOnBlock()
        {
            _timesBlocked++;
            if (_timesBlocked >= numberOfBlocksRequired)
            {
                BlocksMet?.Invoke();
            }
        }
    }
}
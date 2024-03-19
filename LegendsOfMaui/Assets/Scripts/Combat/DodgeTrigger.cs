using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class DodgeTrigger : MonoBehaviour
    {
        [SerializeField]
        private int numberOfDodgesRequired = 1;
        [SerializeField]
        private UnityEvent DodgesMet;

        private int _timesDodged = 0;

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
            _timesDodged++;
            if (_timesDodged >= numberOfDodgesRequired)
            {
                DodgesMet?.Invoke();
            }
        }
    }
}
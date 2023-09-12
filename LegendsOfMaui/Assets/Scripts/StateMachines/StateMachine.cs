using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines
{
    public abstract class StateMachine : MonoBehaviour
    {
        private State _currentState = null;

        private void Update()
        {
            _currentState?.Tick(Time.deltaTime);
        }

        private void FixedUpdate()
        {
            _currentState?.FixedTick();   
        }

        public void SwitchState(State newState)
        {
            _currentState?.Exit();
            _currentState = newState;
            _currentState?.Enter();
        }
    }
}
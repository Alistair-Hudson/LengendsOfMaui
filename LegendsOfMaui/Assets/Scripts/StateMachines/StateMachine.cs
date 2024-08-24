using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines
{
    public abstract class StateMachine : MonoBehaviour, IStateMachine
    {
        private State _currentState = null;

        public abstract string Name { get; }
        public abstract AudioSource AudioSource { get; }
        public State CurrentState => _currentState;

        virtual protected void Update()
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
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{

    public class PlayerTestState : PlayerBaseState
    {
        private float _time = 0;
        public PlayerTestState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            Debug.Log("Entered");
        }

        public override void Exit()
        {
            Debug.Log("Exited");
        }

        public override void Tick(float deltaTime)
        {
            _time += deltaTime;
            Debug.Log(_time);
            if (_time > 5)
            {
                _stateMachine.SwitchState(new PlayerTestState(_stateMachine));
            }
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public abstract class PlayerBaseState : State
    {
        protected PlayerStateMachine _stateMachine = null;

        public PlayerBaseState(PlayerStateMachine playerStateMachine)
        {
            _stateMachine = playerStateMachine;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            motion += _stateMachine.ForceReceiver.Movement;
            _stateMachine.CharacterController.Move(motion * deltaTime);
        }

        protected void Move(float deltaTime) 
        {
            Move(Vector3.zero, deltaTime);
        }

        protected void FaceTarget()
        {
            if (_stateMachine.Targeter.CurrentTarget == null)
            {
                return;
            }
            Vector3 lookDir = _stateMachine.Targeter.CurrentTarget.transform.position - _stateMachine.transform.position;
            lookDir.y = 0;
            _stateMachine.transform.rotation = Quaternion.LookRotation(lookDir);
        }

        protected void SwitchBackToLocmotion()
        {
            if (_stateMachine.Targeter.CurrentTarget != null)
            {
                _stateMachine.SwitchState(new PlayerTargetingState(_stateMachine));
            }
            else
            {
                _stateMachine.SwitchState(new PlayerFreeLookState(_stateMachine));
            }
        }
    }
}
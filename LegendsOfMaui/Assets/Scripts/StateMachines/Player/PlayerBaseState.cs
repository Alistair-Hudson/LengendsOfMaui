using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public abstract class PlayerBaseState : State
    {
        protected PlayerStateMachine stateMachine = null;

        public PlayerBaseState(PlayerStateMachine playerStateMachine)
        {
            stateMachine = playerStateMachine;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            motion += stateMachine.ForceReceiver.Movement;
            stateMachine.CharacterController.Move(motion * deltaTime);
        }

        protected void Move(float deltaTime) 
        {
            Move(Vector3.zero, deltaTime);
        }

        protected void FaceTarget()
        {
            if (stateMachine.Targeter.CurrentTarget == null)
            {
                return;
            }
            Vector3 lookDir = stateMachine.Targeter.CurrentTarget.transform.position - stateMachine.transform.position;
            lookDir.y = 0;
            stateMachine.transform.rotation = Quaternion.LookRotation(lookDir);
        }

        protected void SwitchBackToLocmotion()
        {
            if (stateMachine.Targeter.CurrentTarget != null)
            {
                stateMachine.SwitchState(new PlayerTargetingState(stateMachine));
            }
            else
            {
                stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
            }
        }
    }
}
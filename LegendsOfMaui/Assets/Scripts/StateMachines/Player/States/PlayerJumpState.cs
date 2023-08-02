using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerJumpState : PlayerBaseState
    {
        private readonly int JUMP = Animator.StringToHash("Jump");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private Vector3 momentum = Vector3.zero;

        public PlayerJumpState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.ForceReceiver.Jump(stateMachine.JumpForce);
            momentum = stateMachine.CharacterController.velocity;
            momentum.y = 0;
            stateMachine.Animator.CrossFadeInFixedTime(JUMP, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            Move(momentum, deltaTime);

            if (stateMachine.CharacterController.velocity.y <= 0)
            {
                stateMachine.SwitchState(new PlayerFallingState(stateMachine));
                return;
            }

            FaceTarget();
        }
        #endregion
    }
}
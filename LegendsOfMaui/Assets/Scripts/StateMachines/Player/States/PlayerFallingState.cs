using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Utils;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFallingState : PlayerBaseState
    {
        private readonly int FALL = Animator.StringToHash("Fall");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private Vector3 momentum = Vector3.zero;

        public PlayerFallingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.ForceReceiver.Jump(stateMachine.PlayerStats.JumpForce);
            momentum = stateMachine.CharacterController.velocity;
            momentum.y = 0;
            stateMachine.Animator.CrossFadeInFixedTime(FALL, ANIMATOR_DAMP_TIME);
            stateMachine.LedgeDetector.OnLedgeDected += HandleLedgeDetect;
        }

        public override void Exit()
        {
            stateMachine.LedgeDetector.OnLedgeDected -= HandleLedgeDetect;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.CurrentForm == MauiForms.Pigeon && !stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }

            Move(momentum, deltaTime);

            if (stateMachine.CharacterController.isGrounded)
            {
                SwitchBackToLocmotion();
            }

            FaceTarget();
        }

        public override void FixedTick()
        {
            
        }
        #endregion

        #region EventHandlers
        private void HandleLedgeDetect(Vector3 position, Vector3 direction)
        {
            stateMachine.SwitchState(new PlayerHangingState(stateMachine, position, direction));
        }
        #endregion
    }
}
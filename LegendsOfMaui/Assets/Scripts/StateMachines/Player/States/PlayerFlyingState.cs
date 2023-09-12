using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFlyingState : PlayerBaseState
    {
        private float _delayBeforeForceReset = 0.5f;

        public PlayerFlyingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.StartCoroutine(ResetForceAfterJump());
        }

        public override void Exit()
        {
        }

        public override void Tick(float deltaTime)
        {
            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            Move(movement * stateMachine.FreeLookMoveSpeed, deltaTime);

            if (stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
            }

            if (inputValue == Vector2.zero)
            {
                return;
            }

            FaceMovementDirection(movement);
        }

        public override void FixedTick()
        {
            if (!stateMachine.InputReader.IsAttacking)
            {
                stateMachine.ForceReceiver.Jump(-Physics.gravity.y * Time.fixedDeltaTime);
            }
        }
        #endregion

        #region EventHandlers
        private void HandleOnJumpEvent()
        {
            stateMachine.ForceReceiver.Jump(stateMachine.JumpForce);
            stateMachine.StartCoroutine(ResetForceAfterJump());
        }
        #endregion

        #region PrivateMethods
        private void FaceMovementDirection(Vector3 movement)
        {
            stateMachine.transform.rotation = Quaternion.LookRotation(movement);
        }

        private Vector3 CalculateMovement(Vector2 inputValue)
        {
            Vector3 forward = stateMachine.MainCameraTransform.forward;
            Vector3 right = stateMachine.MainCameraTransform.right;

            forward.y = 0;
            right.y = 0;

            forward.Normalize();
            right.Normalize();

            return forward * inputValue.y + right * inputValue.x;
        }

        private IEnumerator ResetForceAfterJump()
        {
            yield return new WaitForSeconds(_delayBeforeForceReset);
            stateMachine.ForceReceiver.ResetForces();
        }
        #endregion
    }
}
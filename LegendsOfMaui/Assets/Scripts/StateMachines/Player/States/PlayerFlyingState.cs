using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Utils;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFlyingState : PlayerBaseState
    {
        private readonly int FLYING = Animator.StringToHash("Flying");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private float _delayBeforeForceReset = 0.5f;

        public PlayerFlyingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(FLYING, ANIMATOR_DAMP_TIME);
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.StartCoroutine(ResetForceAfterJump());
        }

        public override void Exit()
        {
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.CurrentForm == MauiForms.Human && !stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }

            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            if (stateMachine.InputReader.IsTravelingDown)
            {
                movement += Vector3.down;
            }

            Move(movement * stateMachine.FreeLookMoveSpeed * 2, deltaTime); //The 2 is to make flying faster than walking

            if (stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
            }

            stateMachine.Health.RestoreHealth(deltaTime);

            if (inputValue == Vector2.zero)
            {
                return;
            }

            FaceMovementDirection(movement);
        }

        public override void FixedTick()
        {
            if (AtMaxFlyingHeight())
            {
                Debug.Log("Flying to high, descending");
                return;
            }
            stateMachine.ForceReceiver.ResetForces();//Jump(-Physics.gravity.y * Time.fixedDeltaTime);
        }

        private bool AtMaxFlyingHeight()
        {
            Ray ray = new Ray(stateMachine.transform.position, Vector3.down);
            return !Physics.Raycast(ray, stateMachine.MaxFlyingHeight);
        }
        #endregion

        #region EventHandlers
        private void HandleOnJumpEvent()
        {
            if (AtMaxFlyingHeight())
            {
                return;
            }
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
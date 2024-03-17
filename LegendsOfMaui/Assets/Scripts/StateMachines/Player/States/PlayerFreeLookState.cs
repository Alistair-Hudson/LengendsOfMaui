using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFreeLookState : PlayerBaseState
    {
        private readonly int FREE_LOOK_SPEED = Animator.StringToHash("FreeLookSpeed");
        private readonly int FREE_LOOK_MOVEMENT = Animator.StringToHash("FreeLookMovement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private bool _shouldFade = true;

        public PlayerFreeLookState(PlayerStateMachine playerStateMachine, bool shouldFade = true) : base(playerStateMachine)
        {
            _shouldFade = shouldFade;
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.Animator.SetFloat(FREE_LOOK_SPEED, 0);
            stateMachine.InputReader.TargetEvent += HandleOnTarget;
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            if (_shouldFade)
            {
                stateMachine.Animator.CrossFadeInFixedTime(FREE_LOOK_MOVEMENT, ANIMATOR_DAMP_TIME);
            }
            else
            {
                stateMachine.Animator.Play(FREE_LOOK_MOVEMENT);
            }
        }

        public override void Exit()
        {
            stateMachine.InputReader.TargetEvent -= HandleOnTarget;
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.InputReader.IsAttacking && !stateMachine.IsShapeShifted)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, 0));
                return;
            }

            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            Move(movement * stateMachine.FreeLookMoveSpeed, deltaTime);

            stateMachine.Animator.SetFloat(FREE_LOOK_SPEED, inputValue.magnitude, ANIMATOR_DAMP_TIME, deltaTime);

            if (inputValue == Vector2.zero)
            {
                return;
            }

            stateMachine.Health.RestoreHealth(deltaTime);
            FaceMovementDirection(movement);
        }

        public override void FixedTick()
        {
            
        }
        #endregion

        #region EventHandlers
        private void HandleOnTarget()
        {
            if (stateMachine.IsShapeShifted)
            {
                return;
            }

            if (!stateMachine.Targeter.SelectTarget())
            {
                return;
            }

            stateMachine.SwitchState(new PlayerTargetingState(stateMachine));
        }

        private void HandleOnJumpEvent()
        {
            if (stateMachine.CharacterController.isGrounded || stateMachine.IsShapeShifted)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }
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
        #endregion
    }
}
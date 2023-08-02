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

        public PlayerFreeLookState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.InputReader.TargetEvent += HandleOnTarget;
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.Animator.CrossFadeInFixedTime(FREE_LOOK_MOVEMENT, 0.1f);
        }

        public override void Exit()
        {
            stateMachine.InputReader.TargetEvent -= HandleOnTarget;
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.InputReader.IsAttacking)
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

            FaceMovementDirection(movement);
        }
        #endregion

        #region EventHandlers
        private void HandleOnTarget()
        {
            if (!stateMachine.Targeter.SelectTarget())
            {
                return;
            }

            stateMachine.SwitchState(new PlayerTargetingState(stateMachine));
        }

        private void HandleOnJumpEvent()
        {
            stateMachine.SwitchState(new PlayerJumpState(stateMachine));
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
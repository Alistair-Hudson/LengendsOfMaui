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

        public override void Enter()
        {
            _stateMachine.InputReader.TargetEvent += HandleOnTarget;
            _stateMachine.Animator.Play(FREE_LOOK_MOVEMENT);
        }

        public override void Exit()
        {
            _stateMachine.InputReader.TargetEvent -= HandleOnTarget;
        }

        public override void Tick(float deltaTime)
        {
            Vector2 inputValue = _stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            Move(movement * _stateMachine.FreeLookMoveSpeed, deltaTime);

            _stateMachine.Animator.SetFloat(FREE_LOOK_SPEED, inputValue.magnitude, ANIMATOR_DAMP_TIME, deltaTime);

            if (inputValue == Vector2.zero)
            {
                return;
            }

            FaceMovementDirection(movement);
        }

        private void FaceMovementDirection(Vector3 movement)
        {
            _stateMachine.transform.rotation = Quaternion.LookRotation(movement);
        }

        private Vector3 CalculateMovement(Vector2 inputValue)
        {
            Vector3 forward = _stateMachine.MainCameraTransform.forward;
            Vector3 right = _stateMachine.MainCameraTransform.right;

            forward.y = 0;
            right.y = 0;

            forward.Normalize();
            right.Normalize();

            return forward * inputValue.y + right * inputValue.x;
        }

        private void HandleOnTarget()
        {
            if (!_stateMachine.Targeter.SelectTarget())
            {
                return;
            }

            _stateMachine.SwitchState(new PlayerTargetingState(_stateMachine));
        }
    }
}
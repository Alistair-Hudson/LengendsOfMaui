using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerTargetingState : PlayerBaseState
    {
        private readonly int TARGETING_BLENDTREE = Animator.StringToHash("TargetingBlendTree");
        private readonly int TARGETING_FORWARD_BLENDTREE = Animator.StringToHash("TargetingForwardSpeed");
        private readonly int TARGETING_RIGHT_BLENDTREE = Animator.StringToHash("TargetingRightSpeed");
        private const float ANIMATOR_DAMP_TIME = 0.1f;
        public PlayerTargetingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            _stateMachine.InputReader.CancelTargetEvent += HandleOnCancelTargetEvent;
            _stateMachine.Animator.CrossFadeInFixedTime(TARGETING_BLENDTREE, 0.1f);
        }

        public override void Exit()
        {
            _stateMachine.InputReader.CancelTargetEvent -= HandleOnCancelTargetEvent;
        }

        public override void Tick(float deltaTime)
        {
            if (_stateMachine.InputReader.IsAttacking)
            {
                _stateMachine.SwitchState(new PlayerAttackingState(_stateMachine, 0));
                return;
            }

            if (_stateMachine.Targeter.CurrentTarget == null)
            {
                _stateMachine.SwitchState(new PlayerFreeLookState(_stateMachine));
                return;
            }

            Vector3 movement = CalculateMovement();
            Move(movement * _stateMachine.TargetingMoveSpeed, deltaTime);

            UpdateAnimator(deltaTime);

            FaceTarget();
        }

        private void HandleOnCancelTargetEvent()
        {
            _stateMachine.Targeter.CancelTarget();
            _stateMachine.SwitchState(new PlayerFreeLookState(_stateMachine));
        }

        private Vector3 CalculateMovement()
        {
            Vector3 movement = new Vector3();

            movement += _stateMachine.transform.right * _stateMachine.InputReader.MovementValue.x;
            movement += _stateMachine.transform.forward * _stateMachine.InputReader.MovementValue.y;

            return movement;
        }

        private void UpdateAnimator(float deltaTime)
        {
            Vector2 inputValue = _stateMachine.InputReader.MovementValue;
            _stateMachine.Animator.SetFloat(TARGETING_FORWARD_BLENDTREE, inputValue.y, ANIMATOR_DAMP_TIME, deltaTime);
            _stateMachine.Animator.SetFloat(TARGETING_RIGHT_BLENDTREE, inputValue.x, ANIMATOR_DAMP_TIME, deltaTime);
        }
    }
}
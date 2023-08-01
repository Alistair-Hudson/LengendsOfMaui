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
            stateMachine.InputReader.CancelTargetEvent += HandleOnCancelTargetEvent;
            stateMachine.Animator.CrossFadeInFixedTime(TARGETING_BLENDTREE, 0.1f);
        }

        public override void Exit()
        {
            stateMachine.InputReader.CancelTargetEvent -= HandleOnCancelTargetEvent;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.InputReader.IsAttacking)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, 0));
                return;
            }

            if (stateMachine.InputReader.IsBlocking)
            {
                stateMachine.SwitchState(new PlayerBlockState(stateMachine));
                return;
            }

            if (stateMachine.Targeter.CurrentTarget == null)
            {
                stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
                return;
            }

            Vector3 movement = CalculateMovement();
            Move(movement * stateMachine.TargetingMoveSpeed, deltaTime);

            UpdateAnimator(deltaTime);

            FaceTarget();
        }

        private void HandleOnCancelTargetEvent()
        {
            stateMachine.Targeter.CancelTarget();
            stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
        }

        private Vector3 CalculateMovement()
        {
            Vector3 movement = new Vector3();

            movement += stateMachine.transform.right * stateMachine.InputReader.MovementValue.x;
            movement += stateMachine.transform.forward * stateMachine.InputReader.MovementValue.y;

            return movement;
        }

        private void UpdateAnimator(float deltaTime)
        {
            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            stateMachine.Animator.SetFloat(TARGETING_FORWARD_BLENDTREE, inputValue.y, ANIMATOR_DAMP_TIME, deltaTime);
            stateMachine.Animator.SetFloat(TARGETING_RIGHT_BLENDTREE, inputValue.x, ANIMATOR_DAMP_TIME, deltaTime);
        }
    }
}
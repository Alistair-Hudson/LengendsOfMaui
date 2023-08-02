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

        private Vector2 _dodgeDirection = Vector2.zero;
        private float _remainingDodgeTime = 0;

        public PlayerTargetingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.InputReader.CancelTargetEvent += HandleOnCancelTargetEvent;
            stateMachine.InputReader.DodgeEvent += HandleOnDodgeEvent;
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.Animator.CrossFadeInFixedTime(TARGETING_BLENDTREE, 0.1f);
        }

        public override void Exit()
        {
            stateMachine.InputReader.CancelTargetEvent -= HandleOnCancelTargetEvent;
            stateMachine.InputReader.DodgeEvent -= HandleOnDodgeEvent;
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
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

            Vector3 movement = CalculateMovement(deltaTime);
            Move(movement * stateMachine.TargetingMoveSpeed, deltaTime);

            UpdateAnimator(deltaTime);

            FaceTarget();
        }
        #endregion

        #region EventHandlers
        private void HandleOnCancelTargetEvent()
        {
            stateMachine.Targeter.CancelTarget();
            stateMachine.SwitchState(new PlayerFreeLookState(stateMachine));
        }

        private void HandleOnDodgeEvent()
        {
            if (Time.time - stateMachine.PreviousDodgeTime < stateMachine.DodgeCooldown)
            {
                return;
            }
            _dodgeDirection = stateMachine.InputReader.MovementValue.normalized;
            _remainingDodgeTime = stateMachine.DodgeDuration;
            stateMachine.SetDodgeTime(Time.time);
        }

        private void HandleOnJumpEvent()
        {
            stateMachine.SwitchState(new PlayerJumpState(stateMachine));
        }
        #endregion

        #region PrivateMethods
        private Vector3 CalculateMovement(float deltaTime)
        {
            Vector3 movement = new Vector3();

            if (_remainingDodgeTime > 0)
            {
                movement += stateMachine.transform.right * _dodgeDirection.x * stateMachine.DodgeDistance / stateMachine.DodgeDuration;
                movement += stateMachine.transform.forward * _dodgeDirection.y * stateMachine.DodgeDistance / stateMachine.DodgeDuration;
                _remainingDodgeTime -= deltaTime;
            }
            else
            {
                movement += stateMachine.transform.right * stateMachine.InputReader.MovementValue.x;
                movement += stateMachine.transform.forward * stateMachine.InputReader.MovementValue.y;
            }


            return movement;
        }

        private void UpdateAnimator(float deltaTime)
        {
            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            stateMachine.Animator.SetFloat(TARGETING_FORWARD_BLENDTREE, inputValue.y, ANIMATOR_DAMP_TIME, deltaTime);
            stateMachine.Animator.SetFloat(TARGETING_RIGHT_BLENDTREE, inputValue.x, ANIMATOR_DAMP_TIME, deltaTime);
        }
        #endregion
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Utils;
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

        #region StateMethods
        public override void Enter()
        {
            stateMachine.InputReader.TargetEvent += HandleOnCancelTargetEvent;
            stateMachine.InputReader.DodgeEvent += HandleOnDodgeEvent;
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.InputReader.FastAttackEvent += HandleFastAttack;
            stateMachine.InputReader.HeavyAttackEvent += HandleHeavyAttack;
            stateMachine.Animator.CrossFadeInFixedTime(TARGETING_BLENDTREE, 0.1f);
        }

        public override void Exit()
        {
            stateMachine.InputReader.TargetEvent -= HandleOnCancelTargetEvent;
            stateMachine.InputReader.DodgeEvent -= HandleOnDodgeEvent;
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
            stateMachine.InputReader.FastAttackEvent -= HandleFastAttack;
            stateMachine.InputReader.HeavyAttackEvent -= HandleHeavyAttack;
        }

        public override void Tick(float deltaTime)
        {
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
            Move(movement * stateMachine.PlayerStats.TargetingMovementSpeed, deltaTime);

            UpdateAnimator(deltaTime);

            FaceTarget();
        }

        public override void FixedTick()
        {

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
            Vector2 dodgeValue = stateMachine.InputReader.MovementValue == Vector2.zero ? -Vector2.up : stateMachine.InputReader.MovementValue;

            stateMachine.SwitchState(new PlayerDodgingState(stateMachine, dodgeValue));
        }

        private void HandleOnJumpEvent()
        {
            if (stateMachine.CharacterController.isGrounded || stateMachine.CurrentForm == MauiForms.Pigeon)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }
        }

        private void HandleHeavyAttack()
        {
            stateMachine.SwitchState(new PlayerAttackingState(stateMachine, stateMachine.BasicHeavyAttack));
        }

        private void HandleFastAttack()
        {
            stateMachine.SwitchState(new PlayerAttackingState(stateMachine, stateMachine.BasicFastAttack));
        }

        #endregion

        #region PrivateMethods
        private Vector3 CalculateMovement(float deltaTime)
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
        #endregion
    }
}
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Utils;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerBlockState : PlayerBaseState
    {
        private readonly int BLOCK = Animator.StringToHash("BlockBlendTree");
        private readonly int BLOCK_FORWARD_BLENDTREE = Animator.StringToHash("BlockForwardSpeed");
        private readonly int BLOCK_RIGHT_BLENDTREE = Animator.StringToHash("BlockRightSpeed");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerBlockState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.InputReader.TargetEvent += HandleOnTarget;
            stateMachine.InputReader.JumpEvent += HandleOnJumpEvent;
            stateMachine.InputReader.DodgeEvent += HandleOnDodgeEvent;
            stateMachine.Animator.CrossFadeInFixedTime(BLOCK, ANIMATOR_DAMP_TIME);
            stateMachine.Health.SetBlocking(true);
        }

        public override void Exit()
        {
            stateMachine.Health.SetBlocking(false);
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);
            if (!stateMachine.InputReader.IsBlocking || stateMachine.CurrentForm == MauiForms.Pigeon)
            {
                SwitchBackToLocmotion();
            }

            Vector3 movement = CalculateMovement(deltaTime);
            Move(movement * stateMachine.PlayerStats.TargetingMovementSpeed * 0.5f, deltaTime);

            UpdateAnimator(deltaTime);

            FaceTarget();
        }

        public override void FixedTick()
        {

        }

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
            Vector2 inputValue = stateMachine.InputReader.MovementValue * 0.5f;
            stateMachine.Animator.SetFloat(BLOCK_FORWARD_BLENDTREE, inputValue.y, ANIMATOR_DAMP_TIME, deltaTime);
            stateMachine.Animator.SetFloat(BLOCK_RIGHT_BLENDTREE, inputValue.x, ANIMATOR_DAMP_TIME, deltaTime);
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
            if (stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }
        }

        private void HandleOnDodgeEvent()
        {
            Vector2 dodgeValue = stateMachine.InputReader.MovementValue == Vector2.zero ? -Vector2.up : stateMachine.InputReader.MovementValue;

            stateMachine.SwitchState(new PlayerDodgingState(stateMachine, dodgeValue));
        }
#endregion
    }
}
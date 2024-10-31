using System;
using AlictronicGames.LegendsOfMaui.Utils;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFreeLookState : PlayerBaseState
    {
        private readonly int FREE_LOOK_SPEED = Animator.StringToHash("FreeLookSpeed");
        private readonly int FREE_LOOK_HUMAN = Animator.StringToHash("FreeLookMovement");
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
            stateMachine.InputReader.DodgeEvent += HandleOnDodgeEvent;
            stateMachine.InputReader.FastAttackEvent += HandleFastAttack;
            stateMachine.InputReader.HeavyAttackEvent += HandleHeavyAttack;

            if (_shouldFade)
            {
                stateMachine.Animator.CrossFadeInFixedTime(FREE_LOOK_HUMAN, ANIMATOR_DAMP_TIME);
            }
            else
            {
                stateMachine.Animator.Play(FREE_LOOK_HUMAN);
            }
        }

        public override void Exit()
        {
            stateMachine.InputReader.TargetEvent -= HandleOnTarget;
            stateMachine.InputReader.JumpEvent -= HandleOnJumpEvent;
            stateMachine.InputReader.DodgeEvent -= HandleOnDodgeEvent;
            stateMachine.InputReader.FastAttackEvent -= HandleFastAttack;
            stateMachine.InputReader.HeavyAttackEvent -= HandleHeavyAttack;
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.CurrentForm == MauiForms.Pigeon && !stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }

            if (stateMachine.CurrentForm == MauiForms.Human && !stateMachine.CharacterController.isGrounded)
            {
                if (!Physics.Raycast(stateMachine.transform.position, Vector3.down, 2.0f))
                {
                    stateMachine.SwitchState(new PlayerFallingState(stateMachine));
                }
            }

            if (stateMachine.InputReader.IsBlocking && stateMachine.CurrentForm == MauiForms.Human)
            {
                stateMachine.SwitchState(new PlayerBlockState(stateMachine));
                return;
            }

            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            Move(movement * stateMachine.PlayerStats.FreeLookMovementSpeed, deltaTime);

            stateMachine.Animator.SetFloat(FREE_LOOK_SPEED, inputValue.magnitude, ANIMATOR_DAMP_TIME, deltaTime);

            stateMachine.Health.RestoreHealth(deltaTime);

            if (inputValue == Vector2.zero)
            {
                return;
            }

            FaceMovementDirection(movement);
        }

        public override void FixedTick()
        {
            
        }
        #endregion

        #region EventHandlers
        private void HandleOnTarget()
        {
            if (stateMachine.CurrentForm == MauiForms.Pigeon)
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
            if (stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
                return;
            }

            if (stateMachine.CurrentForm == MauiForms.Pigeon)
            {
                if (!AtMaxFlyingHeight())
                {
                    stateMachine.SwitchState(new PlayerJumpState(stateMachine));
                }
            }
        }

        private bool AtMaxFlyingHeight()
        {
            Ray ray = new Ray(stateMachine.transform.position, Vector3.down);
            return !Physics.Raycast(ray, stateMachine.PlayerStats.MaxFlyingHeight);
        }

        private void HandleOnDodgeEvent()
        {
            Vector2 dodgeValue = stateMachine.InputReader.MovementValue == Vector2.zero ? -Vector2.up : stateMachine.InputReader.MovementValue;

            stateMachine.SwitchState(new PlayerDodgingState(stateMachine, dodgeValue));
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
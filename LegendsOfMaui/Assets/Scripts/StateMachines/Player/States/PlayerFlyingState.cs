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
        }

        public override void Exit()
        {
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.CurrentForm == MauiForms.Human && !stateMachine.CharacterController.isGrounded)
            {
                stateMachine.SwitchState(new PlayerJumpState(stateMachine));
            }

            Vector2 inputValue = stateMachine.InputReader.MovementValue;
            Vector3 movement = CalculateMovement(inputValue);

            if (stateMachine.InputReader.IsTravelingUp && !AtMaxFlyingHeight())
            {
                movement += Vector3.up;
            }

            if (stateMachine.InputReader.IsTravelingDown)
            {
                movement += Vector3.down;
            }

            Move(movement * stateMachine.PlayerStats.FreeLookMovementSpeed * 2, deltaTime); //The 2 is to make flying faster than walking

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
        #endregion

        #region EventHandlers
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

        private bool AtMaxFlyingHeight()
        {
            Ray ray = new Ray(stateMachine.transform.position, Vector3.down);
            return !Physics.Raycast(ray, stateMachine.PlayerStats.MaxFlyingHeight);
        }
        #endregion
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerHangingState : PlayerBaseState
    {
        private readonly int LEDGE_GRAB = Animator.StringToHash("LedgeGrab");
        private readonly int HANGING_SPEED = Animator.StringToHash("HangingSpeed");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private Vector3 _closestPoint = Vector3.zero;
        private Vector3 _direction = Vector3.zero;

        public PlayerHangingState(PlayerStateMachine playerStateMachine, Vector3 direction) : base(playerStateMachine)
        {
            _direction = direction;
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.transform.rotation = Quaternion.LookRotation(_direction, Vector3.up);

            stateMachine.Animator.CrossFadeInFixedTime(LEDGE_GRAB, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
        }

        public override void Tick(float deltaTime)
        {
            Vector2 inputValue = stateMachine.InputReader.MovementValue;

            if (inputValue.y > 0)
            {
                stateMachine.SwitchState(new PlayerPullUpState(stateMachine));
                return;
            }
            if (inputValue.y < 0)
            {
                stateMachine.CharacterController.Move(Vector3.zero);
                stateMachine.ForceReceiver.ResetForces();
                stateMachine.SwitchState(new PlayerDropState(stateMachine));
                return;
            }

            Move(inputValue * stateMachine.HangingSpeed, deltaTime);

            stateMachine.Animator.SetFloat(HANGING_SPEED, inputValue.magnitude, ANIMATOR_DAMP_TIME, deltaTime);
        }
        #endregion
    }
}
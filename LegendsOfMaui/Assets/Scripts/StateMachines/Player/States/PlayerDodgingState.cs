using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerDodgingState : PlayerBaseState
    {
        private readonly int DODGE = Animator.StringToHash("Dodge");
        private readonly int DODGE_FORWARD = Animator.StringToHash("DodgeForward");
        private readonly int DODGE_RIGHT = Animator.StringToHash("DodgeRight");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private Vector3 _dodgeDirection = Vector3.zero;
        private float _remainingDodgeTime = 0;

        public PlayerDodgingState(PlayerStateMachine playerStateMachine, Vector3 dodgeDirection) : base(playerStateMachine)
        {
            _dodgeDirection = dodgeDirection;
        }

        #region StateMethods
        public override void Enter()
        {
            _remainingDodgeTime = stateMachine.PlayerStats.DodgeDuration;

            stateMachine.Animator.SetFloat(DODGE_FORWARD, _dodgeDirection.y);
            stateMachine.Animator.SetFloat(DODGE_RIGHT, _dodgeDirection.x);
            stateMachine.Animator.CrossFadeInFixedTime(DODGE, ANIMATOR_DAMP_TIME);

            stateMachine.Health.SetDodging(true);
        }

        public override void Exit()
        {
            stateMachine.Health.SetDodging(false);
        }

        public override void Tick(float deltaTime)
        {
            Vector3 movement = Vector3.zero;

            movement += stateMachine.transform.right * _dodgeDirection.x * stateMachine.PlayerStats.DodgeDistance / stateMachine.PlayerStats.DodgeDuration;
            movement += stateMachine.transform.forward * _dodgeDirection.y * stateMachine.PlayerStats.DodgeDistance / stateMachine.PlayerStats.DodgeDuration;

            Move(movement, deltaTime);
            FaceTarget();

            _remainingDodgeTime -= deltaTime;

            if (_remainingDodgeTime <= 0)
            {
                stateMachine.SwitchState(new PlayerTargetingState(stateMachine));
            }
        }

        public override void FixedTick()
        {

        }
        #endregion
    }
}
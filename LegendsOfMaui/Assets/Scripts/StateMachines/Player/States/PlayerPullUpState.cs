using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerPullUpState : PlayerBaseState
    {
        private readonly int PULL_UP = Animator.StringToHash("LedgeClimb");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerPullUpState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(PULL_UP, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            stateMachine.CharacterController.Move(Vector3.zero);
            stateMachine.ForceReceiver.ResetForces();
        }

        public override void Tick(float deltaTime)
        {
            if (stateMachine.Animator.GetCurrentAnimatorStateInfo(0).normalizedTime < 1)
            {
                return;
            }
            stateMachine.CharacterController.enabled = false;
            stateMachine.transform.Translate(stateMachine.PullUpOffset, Space.Self);
            stateMachine.CharacterController.enabled = true;
            stateMachine.SwitchState(new PlayerFreeLookState(stateMachine, false));
        }
        #endregion
    }
}
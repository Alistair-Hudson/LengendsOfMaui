using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerDropState : PlayerBaseState
    {
        private readonly int DROP = Animator.StringToHash("LedgeDrop");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerDropState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(DROP, ANIMATOR_DAMP_TIME);
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
            stateMachine.SwitchState(new PlayerFallingState(stateMachine));
        }

        public override void FixedTick()
        {

        }
        #endregion
    }
}
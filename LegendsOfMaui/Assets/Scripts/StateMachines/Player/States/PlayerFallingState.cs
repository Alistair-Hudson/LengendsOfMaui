using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerFallingState : PlayerBaseState
    {
        private readonly int FALL = Animator.StringToHash("Fall");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerFallingState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        #region StateMethods
        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(FALL, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {

        }
        #endregion
    }
}
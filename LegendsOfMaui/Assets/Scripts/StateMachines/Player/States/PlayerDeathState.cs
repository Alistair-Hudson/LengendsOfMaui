using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerDeathState : PlayerBaseState
    {
        private readonly int DEATH = Animator.StringToHash("Armed-Death1");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerDeathState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(DEATH, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            
        }
    }
}
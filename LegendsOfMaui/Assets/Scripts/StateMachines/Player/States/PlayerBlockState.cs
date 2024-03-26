using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerBlockState : PlayerBaseState
    {
        private readonly int BLOCK = Animator.StringToHash("Block");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerBlockState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
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
            if (!stateMachine.InputReader.IsBlocking)
            {
                SwitchBackToLocmotion();
            }
        }

        public override void FixedTick()
        {

        }
    }
}
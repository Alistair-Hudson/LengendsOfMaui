using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossIdleState : BossBaseState
    {
        private readonly int IDLE = Animator.StringToHash("Idle");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public BossIdleState(BossStateMachine bossStateMachine) : base(bossStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(IDLE, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {

        }

        public override void FixedTick()
        {

        }
    }
}
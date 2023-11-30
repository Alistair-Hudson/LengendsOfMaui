using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossImpactState : BossBaseState
    {
        private readonly int IMPACT = Animator.StringToHash("GetHit");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private float _duration = 1f;

        public BossImpactState(BossStateMachine bossStateMachine) : base(bossStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(IMPACT, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {
            _duration -= deltaTime;
            if (_duration <= 0)
            {
                stateMachine.SwitchState(new BossIdleState(stateMachine));
            }
        }

        public override void FixedTick()
        {

        }
    }
}
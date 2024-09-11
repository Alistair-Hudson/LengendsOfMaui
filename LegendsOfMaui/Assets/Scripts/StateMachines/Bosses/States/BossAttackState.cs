using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossAttackState : BossBaseState
    {
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private string _attackName = "";

        public BossAttackState(BossStateMachine bossStateMachine, string attackName) : base(bossStateMachine)
        {
            _attackName = attackName;
        }

        public override void Enter()
        {
            int attack = Animator.StringToHash(_attackName);
            stateMachine.Animator.CrossFadeInFixedTime(attack, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            stateMachine.CurrentAttack = null;
        }

        public override void Tick(float deltaTime)
        {
            if (GetNormalizedTime(stateMachine.Animator, _attackName) >= 1)
            {
                stateMachine.SwitchState(new BossIdleState(stateMachine));
            }
        }

        public override void FixedTick()
        {

        }
    }
}
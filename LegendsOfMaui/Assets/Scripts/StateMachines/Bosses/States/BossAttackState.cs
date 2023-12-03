using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossAttackState : BossBaseState
    {
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private int _attackIndex = 0;

        public BossAttackState(BossStateMachine bossStateMachine, int attackIndex) : base(bossStateMachine)
        {
            _attackIndex = attackIndex;
        }

        public override void Enter()
        {
            int attack = Animator.StringToHash($"Attack{_attackIndex}");
            stateMachine.Animator.CrossFadeInFixedTime(attack, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {
            if (GetNormalizedTime(stateMachine.Animator, $"Attack") >= 1)
            {
                Debug.Log("Finished Attack");
                stateMachine.SwitchState(new BossIdleState(stateMachine));
            }
        }

        public override void FixedTick()
        {

        }
    }
}
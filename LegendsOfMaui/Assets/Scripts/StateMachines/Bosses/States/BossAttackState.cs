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
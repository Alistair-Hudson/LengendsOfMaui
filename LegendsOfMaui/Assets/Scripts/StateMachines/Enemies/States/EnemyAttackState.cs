using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public class EnemyAttackState : EnemyBaseState
    {
        private readonly int ATTACK = Animator.StringToHash("Attack");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public EnemyAttackState(EnemyStateMachine enemyStateMachine) : base(enemyStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Weapon.SetAttack(stateMachine.EnemyStats.AttackDamage, stateMachine.EnemyStats.KnockBackForce);
            stateMachine.Animator.CrossFadeInFixedTime(ATTACK, ANIMATOR_DAMP_TIME);
            if (stateMachine.EnemyStats.SoundBank.TryGetValue("Attack", out AudioClip attackSound))
            {
                stateMachine.AudioSource.PlayOneShot(attackSound);
            }
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {
            FacePlayer();
            if (GetNormalizedTime(stateMachine.Animator, "Attack") >= 1)
            {
                stateMachine.SwitchState(new EnemyChaseState(stateMachine));
            }
        }

        public override void FixedTick()
        {

        }
    }
}
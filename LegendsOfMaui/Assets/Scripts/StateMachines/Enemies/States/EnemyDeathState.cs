using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public class EnemyDeathState : EnemyBaseState
    {
        private readonly int DEATH = Animator.StringToHash("Death");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private float _respawnDelay = 30f;

        public EnemyDeathState(EnemyStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            if (stateMachine.EnemyStats.SoundBank.TryGetValue("Death", out AudioClip attackSound))
            {
                stateMachine.AudioSource.PlayOneShot(attackSound);
            }
            stateMachine.Animator.CrossFadeInFixedTime(DEATH, ANIMATOR_DAMP_TIME);
            stateMachine.Weapon.gameObject.SetActive(false);
            stateMachine.CharacterController.enabled = false;
            stateMachine.CallOnDeath();
            GameObject.Destroy(stateMachine.GetComponent<Target>());
            GameObject.Destroy(stateMachine.gameObject, 4);
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
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
            stateMachine.Animator.CrossFadeInFixedTime(DEATH, ANIMATOR_DAMP_TIME);
            stateMachine.Weapon.gameObject.SetActive(false);
            stateMachine.CharacterController.enabled = false;
            stateMachine.CallOnDeath();
            GameObject.Destroy(stateMachine.GetComponent<Target>());
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {
            _respawnDelay -= deltaTime;
            if (_respawnDelay <= 0)
            {
                var respawnedEnemy = GameObject.Instantiate(stateMachine.gameObject, stateMachine.transform.position, Quaternion.identity);
                respawnedEnemy.GetComponent<CharacterController>().enabled = true;
                GameObject.Destroy(stateMachine.gameObject);
            }
        }

        public override void FixedTick()
        {

        }
    }
}
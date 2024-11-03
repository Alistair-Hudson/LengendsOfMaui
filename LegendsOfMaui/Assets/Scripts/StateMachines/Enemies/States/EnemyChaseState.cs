using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public class EnemyChaseState : EnemyBaseState
    {
        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public EnemyChaseState(EnemyStateMachine enemyStateMachine) : base(enemyStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
            if (stateMachine.EnemyStats.SoundBank.TryGetValue("Chase", out AudioClip attackSound))
            {
                stateMachine.AudioSource.PlayOneShot(attackSound);
            }
            AudioVolumeController.Instance.EnterCombat();
        }

        public override void Exit()
        {
            stateMachine.NavMeshAgent.ResetPath();
            stateMachine.NavMeshAgent.velocity = Vector3.zero;
        }

        public override void Tick(float deltaTime)
        {
            if (!isInChaseRange || stateMachine.Player.Health.IsDead)
            {
                stateMachine.SwitchState(new EnemyIdleState(stateMachine));
                return;
            }
            if (isInAttackRange)
            {
                stateMachine.SwitchState(new EnemyAttackState(stateMachine));
                return;
            }

            if (stateMachine.EnemyStats.IsAerial)
            {
                FlyToPlayer(deltaTime);
            }
            else
            {
                MoveToPlayer(deltaTime);
                FacePlayer();
            }
            stateMachine.Animator.SetFloat(FORWARD_SPEED, 1, ANIMATOR_DAMP_TIME, deltaTime);
        }

        public override void FixedTick()
        {

        }

        private void MoveToPlayer(float deltaTime)
        {
            if (stateMachine.NavMeshAgent.isOnNavMesh)
            {
                stateMachine.NavMeshAgent.destination = stateMachine.Player.transform.position;

                Move(stateMachine.NavMeshAgent.desiredVelocity.normalized * stateMachine.EnemyStats.MovementSpeed, deltaTime);
            }
            stateMachine.NavMeshAgent.velocity = stateMachine.CharacterController.velocity;
        }

        private void FlyToPlayer(float deltaTime)
        {
            Vector3 lookDir = stateMachine.Player.transform.position - stateMachine.transform.position;
            stateMachine.transform.rotation = Quaternion.LookRotation(lookDir);
            Move(stateMachine.transform.forward * stateMachine.EnemyStats.MovementSpeed, deltaTime);
        }
    }
}
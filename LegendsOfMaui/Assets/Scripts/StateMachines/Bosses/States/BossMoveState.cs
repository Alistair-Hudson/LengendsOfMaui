using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossMoveState : BossBaseState
    {
        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private bool isInAttackRange => Vector3.Distance(stateMachine.transform.position, stateMachine.Player.transform.position) <= stateMachine.AttackRange;

        public BossMoveState(BossStateMachine enemyStateMachine) : base(enemyStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            stateMachine.NavMeshAgent.ResetPath();
            stateMachine.NavMeshAgent.velocity = Vector3.zero;
        }

        public override void Tick(float deltaTime)
        {
            if (isInAttackRange)
            {
                stateMachine.SwitchState(new BossIdleState(stateMachine));
                return;
            }
            MoveToPlayer(deltaTime);
            FacePlayer();
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

                Move(stateMachine.NavMeshAgent.desiredVelocity.normalized * stateMachine.MovementSpeed, deltaTime);
            }
            stateMachine.NavMeshAgent.velocity = ((CharacterController)stateMachine.Collider).velocity;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            ((CharacterController)stateMachine.Collider).Move(motion * deltaTime);
        }

        protected void FacePlayer()
        {
            if (stateMachine.Player == null)
            {
                return;
            }
            Vector3 lookDir = stateMachine.Player.transform.position - stateMachine.transform.position;
            lookDir.y = 0;
            stateMachine.transform.rotation = Quaternion.LookRotation(lookDir);
        }
    }
}
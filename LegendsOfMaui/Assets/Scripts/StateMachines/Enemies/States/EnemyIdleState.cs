using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public class EnemyIdleState : EnemyBaseState
    {
        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public EnemyIdleState(EnemyStateMachine enemyStateMachine) : base(enemyStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
            AudioVolumeController.Instance.ExitCombat();
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);

            if (isInChaseRange && !stateMachine.Player.Health.IsDead)
            {
                stateMachine.SwitchState(new EnemyChaseState(stateMachine));
                return;
            }
            stateMachine.Animator.SetFloat(FORWARD_SPEED, 0, ANIMATOR_DAMP_TIME, deltaTime);
        }

        public override void FixedTick()
        {

        }
    }
}
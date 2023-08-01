using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public abstract class EnemyBaseState : State
    {
        protected EnemyStateMachine stateMachine = null;
        protected bool isInChaseRange { get => Vector3.Distance(stateMachine.transform.position, stateMachine.Player.transform.position) <= stateMachine.PlayerChaseRange;} 

        public EnemyBaseState(EnemyStateMachine enemyStateMachine)
        {
            stateMachine = enemyStateMachine;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            motion += stateMachine.ForceReceiver.Movement;
            stateMachine.CharacterController.Move(motion * deltaTime);
        }

        protected void Move(float deltaTime)
        {
            Move(Vector3.zero, deltaTime);
        }
    }
}
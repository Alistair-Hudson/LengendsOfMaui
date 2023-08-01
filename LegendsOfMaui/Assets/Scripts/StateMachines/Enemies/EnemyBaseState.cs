using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public abstract class EnemyBaseState : State
    {
        protected EnemyStateMachine _stateMachine = null;

        public EnemyBaseState(EnemyStateMachine enemyStateMachine)
        {
            _stateMachine = enemyStateMachine;
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    public class EnemyStateMachine : StateMachine
    {
        public Animator Animator { get; private set; } = null;

        private void Awake()
        {
            Animator = GetComponentInChildren<Animator>();
        }

        private void Start()
        {
            SwitchState(new EnemyIdleState(this));
        }
    }
}
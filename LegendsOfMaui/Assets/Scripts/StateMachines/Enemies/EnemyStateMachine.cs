using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using AlictronicGames.LegendsOfMaui.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    [RequireComponent(typeof(CharacterController), typeof(ForceReceiver), typeof(NavMeshAgent))]
    [RequireComponent(typeof(Health))]
    public class EnemyStateMachine : StateMachine
    {
        [field: SerializeField]
        public float PlayerChaseRange { get; private set; } = 0f;
        [field: SerializeField]
        public float AttackRange { get; private set; } = 0f;
        [field: SerializeField]
        public float AttackDamage { get; private set; } = 0f;
        [field: SerializeField]
        public float KnockBackForce { get; private set; } = 0f;
        [field: SerializeField]
        public float MovementSpeed { get; private set; } = 0f;

        private Health _health = null;

        public Animator Animator { get; private set; } = null;
        public PlayerStateMachine Player { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public NavMeshAgent NavMeshAgent { get; private set; } = null;
        public WeaponDamage Weapon { get; private set; } = null;

        private void Awake()
        {
            CharacterController = GetComponent<CharacterController>();
            ForceReceiver = GetComponent<ForceReceiver>();
            NavMeshAgent = GetComponent<NavMeshAgent>();
            _health = GetComponent<Health>();

            Animator = GetComponentInChildren<Animator>();
            Weapon = GetComponentInChildren<WeaponDamage>(true);

            Player = FindFirstObjectByType<PlayerStateMachine>();

            NavMeshAgent.updatePosition = false;
            NavMeshAgent.updateRotation = false;
        }

        private void Start()
        {
            SwitchState(new EnemyIdleState(this));
        }

        private void OnEnable()
        {
            _health.OnTakeDamage += HandleOnTakeDamage;
            _health.OnDeath += HandleOnDeath;
        }

        private void OnDisable()
        {
            _health.OnTakeDamage -= HandleOnTakeDamage;
            _health.OnDeath -= HandleOnDeath;
        }

        private void HandleOnDeath()
        {
            SwitchState(new EnemyDeathState(this));
        }

        private void HandleOnTakeDamage()
        {
            SwitchState(new EnemyImpactState(this));
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, PlayerChaseRange);
        }
    }
}
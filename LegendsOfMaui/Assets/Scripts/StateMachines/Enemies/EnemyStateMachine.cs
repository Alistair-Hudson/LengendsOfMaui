using AlictronicGames.LegendsOfMaui.BackGroundSystems;
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
        [SerializeField]
        private AnimatorOverrideController _animatorOverrideController = null;
        [SerializeField]
        private bool _isNocternal = false;

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

            if (_animatorOverrideController != null)
            {
                Animator.runtimeAnimatorController = _animatorOverrideController;
            }
            NavMeshAgent.updatePosition = false;
            NavMeshAgent.updateRotation = false;
        }

        private void Start()
        {
            SwitchState(new EnemyIdleState(this));
            if (_isNocternal)
            {
                DayNightCycle.NightIsActiveEvent += HandleNightActivation;
                HandleNightActivation(DayNightCycle.IsNight);
            }
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

        private void OnDestroy()
        {
            if (_isNocternal)
            {
                DayNightCycle.NightIsActiveEvent -= HandleNightActivation;
            }
        }

        private void HandleOnDeath()
        {
            SwitchState(new EnemyDeathState(this));
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth)
        {
            SwitchState(new EnemyImpactState(this));
        }

        private void HandleNightActivation(bool state)
        {
            gameObject.SetActive(state);
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, PlayerChaseRange);
        }
    }
}
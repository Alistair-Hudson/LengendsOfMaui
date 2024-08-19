using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using AlictronicGames.LegendsOfMaui.Stats;
using AlictronicGames.LegendsOfMaui.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Events;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    [RequireComponent(typeof(CharacterController), typeof(ForceReceiver), typeof(NavMeshAgent))]
    [RequireComponent(typeof(Health))]
    public class EnemyStateMachine : StateMachine
    {
        [SerializeField]
        private AnimatorOverrideController _animatorOverrideController = null;

        [field: SerializeField]
        public EnemyStats EnemyStats { get; private set; } = null;

        private Health _health = null;

        public override string Name => EnemyStats.Name;
        public Animator Animator { get; private set; } = null;
        public PlayerStateMachine Player { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public NavMeshAgent NavMeshAgent { get; private set; } = null;
        public WeaponDamage Weapon { get; private set; } = null;

        public event Action<EnemyStateMachine> OnDeathEvent;

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
            _health.SetMaxHealth(EnemyStats.Health);
            Animator.gameObject.SetActive(false);
            enabled = false;
        }

        protected override void Update()
        {
            base.Update();
            _health.RegenerateHealth(Time.deltaTime);
        }

        private void OnEnable()
        {
            _health.OnTakeDamage += HandleOnTakeDamage;
            _health.OnDeath.AddListener(HandleOnDeath);
        }

        private void OnDisable()
        {
            _health.OnTakeDamage -= HandleOnTakeDamage;
            _health.OnDeath.AddListener(HandleOnDeath);
        }

        private void OnDestroy()
        {

        }

        private void HandleOnDeath()
        {
            SwitchState(new EnemyDeathState(this));
            PlayerManaProgression.AddManaToPool(EnemyStats.ManaDrop);
            NotificationDisplay.AddNotification($"You have received {EnemyStats.ManaDrop}");
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, bool causesImpact)
        {
            if (causesImpact)
            {
                SwitchState(new EnemyImpactState(this));
            }
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, EnemyStats.ChaseRange);
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(transform.position, EnemyStats.AttackRange);
        }

        public void CallOnDeath()
        {
            OnDeathEvent?.Invoke(this);
        }
    }
}
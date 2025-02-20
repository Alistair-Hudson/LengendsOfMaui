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

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    [RequireComponent(typeof(Collider), typeof(Health))]
    public class BossStateMachine : StateMachine
    {
        [SerializeField]
        private string _name = "";
        [SerializeField]
        private AnimatorOverrideController _animatorOverrideController = null;
        [SerializeField] 
        private float _flinchThreshold = 9999f;
        
        [Header("Attacks")]
        [SerializeField]
        private ProximityBasedAttack[] _proximityBasedAttacks;
        [SerializeField]
        private EventBasedAttack[] _eventBasedAttacks;
        [SerializeField]
        private TimeBasedAttack[] _timeBasedAttacks;

        [field: Space]
        [field: SerializeField]
        public Animator Animator { get; private set; } = null;
        [field: SerializeField]
        public float MovementSpeed { get; private set; } = -1;

        private Health _health = null;
        private AudioSource _audioSource = null;

        public override string Name => _name;
        public Health Health => _health;
        public Collider Collider { get; private set; } = null;
        public NavMeshAgent NavMeshAgent { get; private set; } = null;
        public PlayerStateMachine Player { get; private set; } = null;
        public override AudioSource AudioSource => _audioSource;
        public ProximityBasedAttack[] ProximityBasedAttacks => _proximityBasedAttacks;
        public EventBasedAttack[] EventBasedAttacks => _eventBasedAttacks;
        public TimeBasedAttack[] TimeBasedAttacks => _timeBasedAttacks;
        public Queue<IBossAttack> BossAttackQueue { get; private set; }
        public IBossAttack CurrentAttack { get; set; } = null;

        public event Action<BossStateMachine> OnDeathEvent;

        private void Awake()
        {
            Collider = GetComponent<Collider>();
            NavMeshAgent = GetComponent<NavMeshAgent>();
            _health = GetComponent<Health>();
            _audioSource = GetComponent<AudioSource>();
            Player = FindAnyObjectByType<PlayerStateMachine>();
            BossAttackQueue = new Queue<IBossAttack>();

            if (_animatorOverrideController != null)
            {
                Animator.runtimeAnimatorController = _animatorOverrideController;
            }

            foreach (var proximityAttack in _proximityBasedAttacks)
            {
                proximityAttack.InitializeAttackPattern(this);
            }
            foreach (var eventAttack in _eventBasedAttacks)
            {
                eventAttack.InitializeAttackPattern(this);
            }
            foreach (var timedAttack in _timeBasedAttacks)
            {
                timedAttack.InitializeAttackPattern(this);
            }
        }

        private void Start()
        {
            SwitchState(new BossIdleState(this));
        }

        private void OnEnable()
        {
            _health.OnTakeDamage += HandleOnTakeDamage;
            _health.OnDeath.AddListener(HandleOnDeath);
        }

        private void OnDisable()
        {
            _health.OnTakeDamage -= HandleOnTakeDamage;
            _health.OnDeath.RemoveListener(HandleOnDeath);
        }

        private void OnDestroy()
        {

        }

        private void HandleOnDeath()
        {
            SwitchState(new BossDeathState(this));
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, float force)
        {
            if (force > _flinchThreshold)
            {
                SwitchState(new BossImpactState(this));
            }
        }

        public void CallOnDeath()
        {
            OnDeathEvent?.Invoke(this);
        }
    }
}
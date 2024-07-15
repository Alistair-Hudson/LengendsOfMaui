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
        private AnimatorOverrideController _animatorOverrideController = null;
        
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

        private Health _health = null;

        public Health Health => _health;
        public Collider Collider { get; private set; } = null;
        public ProximityBasedAttack[] ProximityBasedAttacks => _proximityBasedAttacks;
        public EventBasedAttack[] EventBasedAttacks => _eventBasedAttacks;
        public TimeBasedAttack[] TimeBasedAttacks => _timeBasedAttacks;

        public event Action<BossStateMachine> OnDeathEvent;

        private void Awake()
        {
            Collider = GetComponent<Collider>();
            _health = GetComponent<Health>();

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
            _health.OnDeath.AddListener(HandleOnDeath);        }

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

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, bool causesImpact)
        {
            if (causesImpact)
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
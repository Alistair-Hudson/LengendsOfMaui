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
        [Serializable]
        public class AttackData
        {
            [SerializeField]
            private float _delayBetweenUse = 0;

            [field: SerializeField]
            public float AttackDamage { get; private set; } = 0;

            public float TimeSinceLastUsed { get; private set; } = 0;

            public void UpdateTimeSinceLastUsed(float deltaTime)
            {
                TimeSinceLastUsed += deltaTime;
            }

            public bool AttackIsReadyForUse()
            {
                if (TimeSinceLastUsed >= _delayBetweenUse)
                {
                    TimeSinceLastUsed = 0;
                    return true;
                }
                return false;
            }
        }

        [SerializeField]
        private AnimatorOverrideController _animatorOverrideController = null;

        [field: SerializeField]
        public AttackData[] Attacks { get; private set; }
        [field: SerializeField]
        public float KnockBackForce { get; private set; } = 0f;

        private Health _health = null;

        public Animator Animator { get; private set; } = null;
        public Collider Collider { get; private set; } = null;

        private void Awake()
        {
            Collider = GetComponent<Collider>();
            _health = GetComponent<Health>();

            Animator = GetComponentInChildren<Animator>();

            if (_animatorOverrideController != null)
            {
                Animator.runtimeAnimatorController = _animatorOverrideController;
            }
        }

        private void Start()
        {
            SwitchState(new BossIdleState(this));
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

        }

        private void HandleOnDeath()
        {
            SwitchState(new BossDeathState(this));
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth)
        {
            SwitchState(new BossImpactState(this));
        }
    }
}
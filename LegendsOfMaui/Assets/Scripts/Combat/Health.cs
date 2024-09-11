using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Health : MonoBehaviour
    {
        [field: SerializeField]
        public float MaxHealth { get; private set; } = 100f;
        [field: SerializeField]
        public float HealthRegenPerSecond { get; private set; } = 0;
        [field: SerializeField]
        public UnityEvent OnDeath;

        public float CurrentHealth { get; private set; } = 0;

        private bool _isDodging = false;
        private bool _isBlocking = false;
        private bool _isInvulnerable = false;

        public bool IsDead => CurrentHealth <= 0;
        
        public event Action<float, float, float> OnTakeDamage;
        public event Action OnBlocked;
        public event Action OnDodged;

        private void Awake()
        {
            CurrentHealth = MaxHealth;
        }

        private void Start()
        {
            OnTakeDamage?.Invoke(MaxHealth, CurrentHealth, 0);
        }

        public void DealDamage(float damage, AttackType attackType, float force)
        {
            if (IsDead)
            {
                Debug.Log($"{name} is dead");
                return;
            }

            if (_isInvulnerable)
            {
                Debug.Log($"{name} is invulnerable");
                return;
            }

            bool attackIsBlockable = (attackType & AttackType.Bloackable) == AttackType.Bloackable ? true : false;
            if (_isBlocking && attackIsBlockable)
            {
                Debug.Log($"{name} blocked attack");
                OnBlocked?.Invoke();
                return;
            }

            bool attackIsDodgeable = (attackType & AttackType.Dodgeable) == AttackType.Dodgeable ? true : false;
            if (_isDodging && attackIsDodgeable)
            {
                Debug.Log($"{name} dodged attack");
                OnDodged?.Invoke();
                return;
            }

            Debug.Log($"{name} received {damage} damage");
            CurrentHealth -= damage;
            OnTakeDamage?.Invoke(MaxHealth, CurrentHealth, force);
            if (CurrentHealth <= 0)
            {
                OnDeath?.Invoke();
            }
        }

        public void RestoreHealth(float heal)
        {
            CurrentHealth = Mathf.Min(CurrentHealth + heal, MaxHealth);
            OnTakeDamage?.Invoke(MaxHealth, CurrentHealth, 0);
        }

        public void SetInvulnerability(bool invulnerable)
        {
            _isInvulnerable = invulnerable;
        }

        public void SetDodging(bool dodging)
        {
            _isDodging = dodging;
        }

        public void SetBlocking(bool blocking)
        {
            _isBlocking = blocking;
        }

        public void RegenerateHealth(float deltaTime)
        {
            RestoreHealth(HealthRegenPerSecond * deltaTime);
        }

        public void SetMaxHealth(float newMaxHealth)
        {
            MaxHealth = newMaxHealth;
            CurrentHealth = MaxHealth;
        }

        public void SetHealthRegen(float newHealthRegen)
        {
            HealthRegenPerSecond = newHealthRegen;
        }
    }
}
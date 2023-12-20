using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Health : MonoBehaviour
    {
        [field: SerializeField]
        public float MaxHealth { get; private set; } = 100f;
        [field: SerializeField]
        public float HealthRegenPerSecond { get; private set; } = 0;

        private float _currentHealth = 0;

        private bool _isInvulnerable = false;

        public bool IsDead => _currentHealth <= 0;
        
        public event Action<float, float, bool> OnTakeDamage;
        public event Action OnDeath;

        private void Awake()
        {
            _currentHealth = MaxHealth;
        }

        public void DealDamage(float damage, bool causesImpact = true)
        {
            if (IsDead)
            {
                return;
            }

            if (_isInvulnerable)
            {
                return;
            }

            _currentHealth -= damage;
            OnTakeDamage?.Invoke(MaxHealth, _currentHealth, causesImpact);
            if (_currentHealth <= 0)
            {
                OnDeath?.Invoke();
            }
        }

        public void RestoreHealth(float heal)
        {
            _currentHealth = Mathf.Min(_currentHealth + heal, MaxHealth);
        }

        public void SetInvulnerability(bool invulnerable)
        {
            _isInvulnerable = invulnerable;
        }

        public void RegenerateHealth(float deltaTime)
        {
            RestoreHealth(HealthRegenPerSecond * deltaTime);
        }

        public void SetMaxHealth(float newMaxHealth)
        {
            MaxHealth = newMaxHealth;
        }

        public void SetHelathRegen(float newHealthRegen)
        {
            HealthRegenPerSecond = newHealthRegen;
        }
    }
}
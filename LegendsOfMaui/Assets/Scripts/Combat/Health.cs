using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Health : MonoBehaviour
    {
        [SerializeField]
        private float _maxHealth = 100f;

        private float _currentHealth = 0;

        private bool _isInvulnerable = false;

        public bool IsDead => _currentHealth <= 0;
        
        public event Action<float, float, bool> OnTakeDamage;
        public event Action OnDeath;

        private void Awake()
        {
            _currentHealth = _maxHealth;
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
            OnTakeDamage?.Invoke(_maxHealth, _currentHealth, causesImpact);
            if (_currentHealth <= 0)
            {
                OnDeath?.Invoke();
            }
        }

        public void RestoreHealth(float heal)
        {
            _currentHealth = Mathf.Min(_currentHealth + heal, _maxHealth);
        }

        public void SetInvulnerability(bool invulnerable)
        {
            _isInvulnerable = invulnerable;
        }
    }
}
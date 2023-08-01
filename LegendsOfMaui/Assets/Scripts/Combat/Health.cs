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

        private bool _isDead = false;
        private bool _isInvulnerable = false;

        public event Action OnTakeDamage;
        public event Action OnDeath;

        private void Awake()
        {
            _currentHealth = _maxHealth;
        }

        public void DealDamage(float damage)
        {
            if (_isDead)
            {
                return;
            }

            if (_isInvulnerable)
            {
                return;
            }

            _currentHealth -= damage;
            OnTakeDamage?.Invoke();
            if (_currentHealth <= 0)
            {
                OnDeath?.Invoke();
                _isDead = true;
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
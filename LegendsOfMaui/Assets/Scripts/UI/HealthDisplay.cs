using AlictronicGames.LegendsOfMaui.Combat;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.UI
{
    [RequireComponent(typeof(Image))]
    public class HealthDisplay : MonoBehaviour
    {
        private Image _healthDisplay = null;

        private void Awake()
        {
            _healthDisplay = GetComponent<Image>();
            GetComponentInParent<Health>().OnTakeDamage += HandleOnTakeDamage;
            _healthDisplay.fillAmount = 1;
        }

        private void OnEnable()
        {
            Health health = GetComponentInParent<Health>();
            _healthDisplay.fillAmount = health.CurrentHealth / health.MaxHealth;
        }

        private void OnDestroy()
        {
            var health = GetComponentInParent<Health>();
            if (health)
            {
                health.OnTakeDamage -= HandleOnTakeDamage;
            }
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, float force)
        {
            _healthDisplay.fillAmount = currentHealth / maxHealth;
        }
    }
}
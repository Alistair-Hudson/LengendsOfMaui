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

        private void OnDestroy()
        {
            GetComponentInParent<Health>().OnTakeDamage -= HandleOnTakeDamage;
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth)
        {
            _healthDisplay.fillAmount = currentHealth / maxHealth;
        }
    }
}
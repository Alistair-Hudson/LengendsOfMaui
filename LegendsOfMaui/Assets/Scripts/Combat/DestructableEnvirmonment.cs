using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class DestructableEnvirmonment : MonoBehaviour
    {
        private void Awake()
        {
            if (TryGetComponent<Health>(out Health health))
            {
                health.OnDeath += HandleOnDeath;
            }
        }

        private void HandleOnDeath()
        {
            Destroy(gameObject);
        }
    }
}
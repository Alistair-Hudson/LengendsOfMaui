using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class LedgeDetector : MonoBehaviour
    {
        /// <summary>
        /// direction
        /// </summary>
        public event Action<Vector3> OnLedgeDected;

        private void OnTriggerEnter(Collider other)
        {
            OnLedgeDected?.Invoke(other.transform.forward);
        }
    }
}
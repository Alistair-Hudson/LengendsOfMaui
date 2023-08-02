using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class LedgeDetector : MonoBehaviour
    {
        /// <summary>
        /// Position detected, direction
        /// </summary>
        public event Action<Vector3, Vector3> OnLedgeDected;

        private void OnTriggerEnter(Collider other)
        {
            OnLedgeDected?.Invoke(other.ClosestPoint(transform.position), other.transform.forward);
        }
    }
}
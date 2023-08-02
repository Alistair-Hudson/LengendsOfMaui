using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class LedgeDetector : MonoBehaviour
    {
        /// <summary>
        /// posiotn, direction
        /// </summary>
        public event Action<Vector3, Vector3> OnLedgeDected;

        private void OnTriggerEnter(Collider other)
        {
            OnLedgeDected?.Invoke(other.ClosestPointOnBounds(transform.position), other.transform.forward);
        }
    }
}
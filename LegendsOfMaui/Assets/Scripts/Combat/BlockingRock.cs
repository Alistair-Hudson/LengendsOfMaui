using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class BlockingRock : MonoBehaviour
    {
        private void OnTriggerEnter(Collider other)
        {
            if (other.TryGetComponent<Health>(out Health health))
            {
                health.SetInvulnerability(true);
            }
        }

        private void OnTriggerExit(Collider other)
        {
            if (other.TryGetComponent<Health>(out Health health))
            {
                health.SetInvulnerability(false);
            }
        }
    }
}
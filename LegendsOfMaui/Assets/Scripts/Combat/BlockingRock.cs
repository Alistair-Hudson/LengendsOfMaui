using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class BlockingRock : MonoBehaviour
    {
        [SerializeField]
        private float protectionDelay = 2f;

        private List<Health> protectedHealths = new List<Health>();

        private void OnDisable()
        {
            foreach (var health in protectedHealths)
            {
                health.StartCoroutine(DelayInvulnerabilityRemoval(health));
            }
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other.TryGetComponent<Health>(out Health health))
            {
                health.SetInvulnerability(true);
                protectedHealths.Add(health);
            }
        }

        private void OnTriggerExit(Collider other)
        {
            if (!other.TryGetComponent<Health>(out Health health))
            {
                return;
            }
            if (protectedHealths.Contains(health))
            {
                health.SetInvulnerability(false);
                protectedHealths.Remove(health);
            }
        }

        private IEnumerator DelayInvulnerabilityRemoval(Health health)
        {
            yield return new WaitForSeconds(protectionDelay);
            health.SetInvulnerability(false);
        }
    }
}
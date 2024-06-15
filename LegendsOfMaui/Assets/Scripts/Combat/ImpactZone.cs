using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class ImpactZone : MonoBehaviour
    {
        [SerializeField]
        private int maxRubble = 10;
        [SerializeField]
        private float impulse = 10;
        [SerializeField]
        private Rigidbody[] rubblePrefabs;

        private void OnDestroy()
        {
            ThrowRubble();
        }

        private void ThrowRubble()
        {
            for (int i = 0; i < maxRubble; i++)
            {
                int rubblePrefabIndex = UnityEngine.Random.Range(0, rubblePrefabs.Length);
                Rigidbody newRubble = Instantiate(rubblePrefabs[rubblePrefabIndex], transform.position, Quaternion.identity);
                newRubble.AddForce(Vector3.up * impulse, ForceMode.Impulse);
            }
        }
    }
}
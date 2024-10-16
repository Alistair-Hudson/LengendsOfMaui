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
        private GameObject protectingObjectPrefab = null;
        [SerializeField]
        private Rigidbody[] rubblePrefabs;

        private void OnTriggerEnter(Collider collider)
        {
            if (!(collider is TerrainCollider))
            {
                return;
            }

            ThrowRubble();

            CreateBlockingRock(collider);

            Destroy(gameObject);
        }

        private void CreateBlockingRock(Collider collider)
        {
            if (protectingObjectPrefab)
            {
                Quaternion direction = Quaternion.Euler(-transform.forward);
                Ray ray = new Ray(transform.position, Vector3.down);
                if (Physics.Raycast(ray, out RaycastHit hit))
                {
                    var blockingRockInstance = Instantiate(protectingObjectPrefab, hit.point, direction);
                }
            }
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
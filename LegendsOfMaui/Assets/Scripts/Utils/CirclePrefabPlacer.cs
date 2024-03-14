using Sirenix.OdinInspector;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class CirclePrefabPlacer : MonoBehaviour
    {
        [SerializeField]
        private GameObject[] prefabsToPlace; // Array of prefabs to randomly place
        [SerializeField]
        private Vector3 prefabScale = Vector3.one;
        [SerializeField]
        private int numberOfPrefabs = 10; // Number of prefabs to place
        [SerializeField]
        private float radius = 5f; // Radius of the circle
        [SerializeField]
        private bool prefabsHaveRandRotation = false;

        [Button("Generate Circle")]
        private void PlacePrefabs()
        {
            if (prefabsToPlace.Length == 0)
            {
                Debug.LogWarning("No prefabs assigned to the list.");
                return;
            }

            for (int j = transform.childCount - 1; j >= 0; j--)
            {
                DestroyImmediate(transform.GetChild(j).gameObject);
            }

            float angleBetween = (2 * Mathf.PI) / numberOfPrefabs;

            for (int i = 0; i < numberOfPrefabs; i++)
            {
                float angle = angleBetween * i;
                Vector3 pos = new Vector3(transform.position.x + radius * Mathf.Cos(angle), transform.position.y, transform.position.z + radius * Mathf.Sin(angle));
                GameObject prefabToInstantiate = prefabsToPlace[Random.Range(0, prefabsToPlace.Length)];
                Quaternion rot = prefabsHaveRandRotation ? Quaternion.Euler(Random.Range(0f, 360f), Random.Range(0f, 360f), Random.Range(0f, 360f)) : Quaternion.identity;
                var prefrabInstance = Instantiate(prefabToInstantiate, pos, rot, transform);
                prefrabInstance.transform.localScale = prefabScale;
            }
        }
    }
}
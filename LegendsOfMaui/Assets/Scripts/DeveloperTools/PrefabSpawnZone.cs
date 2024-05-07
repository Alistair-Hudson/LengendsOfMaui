using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    [RequireComponent(typeof(BoxCollider))]
    public class PrefabSpawnZone : MonoBehaviour
    {
        [SerializeField]
        private int totalPrefabsInArea = 10;
        [SerializeField]
        private GameObject[] prefabs;

        private BoxCollider _boxCollider = null;
        private List<GameObject> _spawnedPrefabs = new List<GameObject>();

        private void Awake()
        {
            _boxCollider = GetComponent<BoxCollider>();
        }

        private IEnumerator Start()
        {
            while (_spawnedPrefabs.Count < totalPrefabsInArea)
            {
                SpawnPrefab();
                yield return null;
            }
        }

        private void SpawnPrefab()
        {
            float xCoord = Random.Range(_boxCollider.bounds.min.x, _boxCollider.bounds.max.x);
            float zCoord = Random.Range(_boxCollider.bounds.min.z, _boxCollider.bounds.max.z);
            Vector3 planarCoords = new Vector3(xCoord, _boxCollider.bounds.min.y, zCoord);
            Ray ray = new Ray(planarCoords, Vector3.down);
            if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, LayerMask.GetMask("Terrian")))
            {
                Debug.Log("Hit Terrain");
                GameObject prefabInstance = Instantiate(prefabs[Random.Range(0, prefabs.Length)], hit.point, Quaternion.identity);
                prefabInstance.transform.parent = transform;
                if (prefabInstance.TryGetComponent<EnemyStateMachine>(out var enemyStateMachine))
                {
                    enemyStateMachine.OnDeathEvent += SpawnNewEnemy;
                }
                _spawnedPrefabs.Add(prefabInstance);
            }
        }

        private void SpawnNewEnemy(EnemyStateMachine enemy)
        {
            enemy.OnDeathEvent -= SpawnNewEnemy;
            _spawnedPrefabs.Remove(enemy.gameObject);
            SpawnPrefab();
        }
    }
}
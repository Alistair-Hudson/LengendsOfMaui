using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    public class TreePopulator : MonoBehaviour
    {
        [SerializeField] private GameObject[] _treePrototypes;

        [Button("Set Prototypes")]
        private void PopulateTreeBrush()
        {
            List<TreePrototype> treePrototypes = new List<TreePrototype>();
            foreach (GameObject treePrototype in _treePrototypes)
            {
                TreePrototype newPrototype = new TreePrototype();
                newPrototype.prefab = treePrototype;
                treePrototypes.Add(newPrototype);
            }

            Terrain[] terrains = GetComponentsInChildren<Terrain>();

            foreach (Terrain terrain in terrains)
            {
                TerrainData terrainData = terrain.terrainData;
                terrainData.treePrototypes = treePrototypes.ToArray();
            }
            
        }
    }
}
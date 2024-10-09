using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Object = UnityEngine.Object;

namespace NatureManufacture.RAM
{
    [Serializable]
    public class TerrainSplinesManagerDataHolder : MonoBehaviour
    {
        [SerializeField] private List<Object> terrainPainterObjects = new List<Object>();


        public List<Object> TerrainPainterObjects
        {
            get => terrainPainterObjects;
            set => terrainPainterObjects = value;
        }
        
        
        public List<ITerrainPainterGetData> GetTerrainPainterObjects()
        {
            List<ITerrainPainterGetData> terrainPainterObjects = new List<ITerrainPainterGetData>();

            foreach (Object terrainPainterObject in TerrainPainterObjects)
            {
                if (terrainPainterObject is ITerrainPainterGetData terrainPainter)
                {
                    terrainPainterObjects.Add(terrainPainter);
                }
            }

            return terrainPainterObjects;
        }
    }
}
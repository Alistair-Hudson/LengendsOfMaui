using System;
using UnityEngine;

namespace NatureManufacture.RAM
{
    public interface ITerrainPainterGetData
    {
        public TerrainPainterData PainterData { get; set; }
        public RamTerrainManager RamTerrainManager { get; set; }

        public MeshFilter MainMeshFilter { get; set; }

        public void GenerateForTerrain();
    }
}
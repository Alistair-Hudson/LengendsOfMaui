// /**
//  * Created by Pawel Homenko on  08/2022
//  */

using System;
using UnityEngine;
using UnityEngine.Serialization;

namespace NatureManufacture.RAM
{
    [Serializable]
    public class TerrainNoiseParameters
    {
        [FormerlySerializedAs("useUseNoise")] [SerializeField]
        private bool useNoise;

        [FormerlySerializedAs("noiseMultiplierInsidePower")] [SerializeField]
        private float noiseMultiplierPower = 1f;

        [SerializeField] private float noiseMultiplierInside = 1f;
        [SerializeField] private float noiseMultiplierOutside = 0.25f;
        [SerializeField] private float noiseSizeX = 10f;
        [SerializeField] private float noiseSizeZ = 10f;

        public bool UseNoise
        {
            get => useNoise;
            set => useNoise = value;
        }

        public float NoiseMultiplierInside
        {
            get => noiseMultiplierInside;
            set => noiseMultiplierInside = value;
        }

        public float NoiseMultiplierOutside
        {
            get => noiseMultiplierOutside;
            set => noiseMultiplierOutside = value;
        }

        public float NoiseSizeX
        {
            get => noiseSizeX;
            set => noiseSizeX = value;
        }

        public float NoiseSizeZ
        {
            get => noiseSizeZ;
            set => noiseSizeZ = value;
        }

        public float NoiseMultiplierPower
        {
            get => noiseMultiplierPower;
            set => noiseMultiplierPower = value;
        }

        public TerrainNoiseParameters()
        {
        }

        //Copy constructor
        public TerrainNoiseParameters(TerrainNoiseParameters terrainNoiseParameters)
        {
            useNoise = terrainNoiseParameters.useNoise;
            noiseMultiplierPower = terrainNoiseParameters.noiseMultiplierPower;
            noiseMultiplierInside = terrainNoiseParameters.noiseMultiplierInside;
            noiseMultiplierOutside = terrainNoiseParameters.noiseMultiplierOutside;
            noiseSizeX = terrainNoiseParameters.noiseSizeX;
            noiseSizeZ = terrainNoiseParameters.noiseSizeZ;
        }

        public bool CheckProfileChange(TerrainNoiseParameters otherParameters)
        {
            if (otherParameters == null)
                return false;

            //check all fields with other parameters fields
            if (useNoise != otherParameters.useNoise)
                return true;

            if (noiseMultiplierPower != otherParameters.noiseMultiplierPower)
                return true;

            if (noiseMultiplierInside != otherParameters.noiseMultiplierInside)
                return true;

            if (noiseMultiplierOutside != otherParameters.noiseMultiplierOutside)
                return true;

            if (noiseSizeX != otherParameters.noiseSizeX)
                return true;

            if (noiseSizeZ != otherParameters.noiseSizeZ)
                return true;


            return false;
        }
    }
}
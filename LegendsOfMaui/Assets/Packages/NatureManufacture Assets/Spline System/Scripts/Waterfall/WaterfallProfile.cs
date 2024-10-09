// /**
//  * Created by Pawel Homenko on  12/2023
//  */

using UnityEngine;

namespace NatureManufacture.RAM
{
    [CreateAssetMenu(fileName = "FenceProfile", menuName = "NatureManufacture/FenceProfile", order = 1)]
    public class WaterfallProfile : ScriptableObject, IProfile<WaterfallProfile>
    {
        [HideInInspector] [SerializeField] private GameObject gameObject;

        [SerializeField] private float triangleDensity = 8f;

        [field: SerializeField] public Material WaterfallMaterial { get; set; }
        [field: SerializeField] public float SimulationTime { get; set; } = 10;
        [field: SerializeField] public float TimeStep { get; set; } = 0.1f;

        [field: SerializeField] public float BaseStrength { get; set; } = 10f;
        [field: SerializeField] public Vector2 UvScale { get; set; } = new(0.1f, 0.03f);

        [field: SerializeField] public float RestitutionCoeff { get; set; } = 0.1f;
        [field: SerializeField] public float RestitutionAnglelerp { get; set; } = 0f;
        [field: SerializeField] public LayerMask RaycastMask { get; set; } = ~0;


        [field: SerializeField] public float BlurVelocityStrength { get; set; } = 2f;
        [field: SerializeField] public int BlurVelocityIterations { get; set; } = 2;
        [field: SerializeField] public int BlurVelocitySize { get; set; } = 2;
        
        
        [field: SerializeField] public float BlurPositionStrength { get; set; } = 2f;
        [field: SerializeField] public int BlurPositionIterations { get; set; } = 2;
        [field: SerializeField] public int BlurPositionSize { get; set; } = 2;
        
        [field: SerializeField] public float MaxWaterfallDistance { get; set; } = 20;
        [field: SerializeField] public float MinPointDistance { get; set; } = 0.5f;

        [field: SerializeField] public AnimationCurve TerrainOffset { get; set; } = new(new Keyframe(0, 0), new Keyframe(0.1f, 0.1f), new Keyframe(0.9f, 0.1f),new Keyframe(1, 0));
        
        [field: SerializeField] public AnimationCurve AlphaByDistance { get; set; } = AnimationCurve.Constant(0, 1, 1);

        [field: SerializeField] public float FloatSpeed { get; set; } = 10;

        [field: SerializeField] public bool ClipUnderTerrain { get; set; } = false;


        public float TriangleDensity
        {
            get => triangleDensity;
            set => triangleDensity = value;
        }

        public GameObject GameObject
        {
            get => gameObject;
            set => gameObject = value;
        }


        public void SetProfileData(WaterfallProfile otherProfile)
        {
            WaterfallMaterial = otherProfile.WaterfallMaterial;
            TriangleDensity = otherProfile.TriangleDensity;
            SimulationTime = otherProfile.SimulationTime;
            BaseStrength = otherProfile.BaseStrength;
            TimeStep = otherProfile.TimeStep;
            UvScale = otherProfile.UvScale;
            RestitutionCoeff = otherProfile.RestitutionCoeff;
            RestitutionAnglelerp = otherProfile.RestitutionAnglelerp;
            RaycastMask = otherProfile.RaycastMask;
            BlurVelocityStrength = otherProfile.BlurVelocityStrength;
            BlurVelocityIterations = otherProfile.BlurVelocityIterations;
            BlurVelocitySize = otherProfile.BlurVelocitySize;
            BlurPositionStrength = otherProfile.BlurPositionStrength;
            BlurPositionIterations = otherProfile.BlurPositionIterations;
            BlurPositionSize = otherProfile.BlurPositionSize;
            MaxWaterfallDistance = otherProfile.MaxWaterfallDistance;
            MinPointDistance = otherProfile.MinPointDistance;
            TerrainOffset = otherProfile.TerrainOffset;
            AlphaByDistance = otherProfile.AlphaByDistance;
            FloatSpeed = otherProfile.FloatSpeed;
            ClipUnderTerrain = otherProfile.ClipUnderTerrain;
        }

        public bool CheckProfileChange(WaterfallProfile otherProfile)
        {
            if (WaterfallMaterial != otherProfile.WaterfallMaterial)
                return true;
            if (TriangleDensity != otherProfile.TriangleDensity)
                return true;
            if (SimulationTime != otherProfile.SimulationTime)
                return true;
            if (BaseStrength != otherProfile.BaseStrength)
                return true;
            if (TimeStep != otherProfile.TimeStep)
                return true;
            if (UvScale != otherProfile.UvScale)
                return true;
            if (RestitutionCoeff != otherProfile.RestitutionCoeff)
                return true;
            if (RestitutionAnglelerp != otherProfile.RestitutionAnglelerp)
                return true;
            if (RaycastMask != otherProfile.RaycastMask)
                return true;
            if (BlurVelocityStrength != otherProfile.BlurVelocityStrength)
                return true;
            if (BlurVelocityIterations != otherProfile.BlurVelocityIterations)
                return true;
            if (BlurVelocitySize != otherProfile.BlurVelocitySize)
                return true;
            if (BlurPositionStrength != otherProfile.BlurPositionStrength)
                return true;
            if (BlurPositionIterations != otherProfile.BlurPositionIterations)
                return true;
            if (BlurPositionSize != otherProfile.BlurPositionSize)
                return true;
            
            if (MaxWaterfallDistance != otherProfile.MaxWaterfallDistance)
                return true;
            if (MinPointDistance != otherProfile.MinPointDistance)
                return true;
          
            if (FloatSpeed != otherProfile.FloatSpeed)
                return true;
            if (ClipUnderTerrain != otherProfile.ClipUnderTerrain)
                return true;

            return false;
        }
    }
}
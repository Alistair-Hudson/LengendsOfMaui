using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace NatureManufacture.RAM
{
    [CreateAssetMenu(fileName = "FenceProfile", menuName = "NatureManufacture/FenceProfile", order = 1)]
    public class FenceProfile : ScriptableObject, IProfile<FenceProfile>
    {
        [HideInInspector] [SerializeField] private GameObject gameObject;

        [SerializeField] private float triangleDensity = 8f;
        [SerializeField] private float distanceMultiplier = 1;
        [SerializeField] private float additionalDistance;


        [SerializeField] private bool bendMeshes;


        [SerializeField] private FenceObjectProbability firstSpan = new();
        [SerializeField] private FenceObjectProbability lastSpan = new();

        [SerializeField] private List<FenceObjectProbability> posts = new();


        [SerializeField] private int postRandomType;

        [SerializeField] private List<FenceObjectProbability> spans = new();
        [SerializeField] private int spanRandomType;


        [SerializeField] private bool scaleMesh = true;
        [SerializeField] private bool scaleMeshUnified = true;
        [SerializeField] private bool holdUp;
        [SerializeField] private bool randomSeed = true;
        [SerializeField] private int seed;


        public float TriangleDensity
        {
            get => triangleDensity;
            set => triangleDensity = value;
        }

        public float DistanceMultiplier
        {
            get => distanceMultiplier;
            set => distanceMultiplier = value;
        }

        public float AdditionalDistance
        {
            get => additionalDistance;
            set => additionalDistance = value;
        }

        public bool BendMeshes
        {
            get => bendMeshes;
            set => bendMeshes = value;
        }

        public List<FenceObjectProbability> Posts
        {
            get => posts;
            set => posts = value;
        }

        public int PostRandomType
        {
            get => postRandomType;
            set => postRandomType = value;
        }

        public List<FenceObjectProbability> Spans
        {
            get => spans;
            set => spans = value;
        }

        public int SpanRandomType
        {
            get => spanRandomType;
            set => spanRandomType = value;
        }


        public bool ScaleMesh
        {
            get => scaleMesh;
            set => scaleMesh = value;
        }

        public bool HoldUp
        {
            get => holdUp;
            set => holdUp = value;
        }

        public GameObject GameObject
        {
            get => gameObject;
            set => gameObject = value;
        }

        public int Seed
        {
            get => seed;
            set => seed = value;
        }

        public bool RandomSeed
        {
            get => randomSeed;
            set => randomSeed = value;
        }

        public FenceObjectProbability FirstSpan
        {
            get => firstSpan;
            set => firstSpan = value;
        }

        public FenceObjectProbability LastSpan
        {
            get => lastSpan;
            set => lastSpan = value;
        }

        public bool ScaleMeshUnified
        {
            get => scaleMeshUnified;
            set => scaleMeshUnified = value;
        }

        public void SetProfileData(FenceProfile otherProfile)
        {
            triangleDensity = otherProfile.triangleDensity;
            distanceMultiplier = otherProfile.distanceMultiplier;
            additionalDistance = otherProfile.additionalDistance;
            bendMeshes = otherProfile.bendMeshes;
            postRandomType = otherProfile.postRandomType;
            spanRandomType = otherProfile.spanRandomType;
            scaleMesh = otherProfile.scaleMesh;
            scaleMeshUnified = otherProfile.scaleMeshUnified;
            holdUp = otherProfile.holdUp;
            seed = otherProfile.seed;
            randomSeed = otherProfile.randomSeed;

            firstSpan = new FenceObjectProbability(otherProfile.firstSpan);
            lastSpan = new FenceObjectProbability(otherProfile.lastSpan);

            posts.Clear();
            spans.Clear();

            foreach (var post in otherProfile.posts)
            {
                posts.Add(new FenceObjectProbability(post));
            }

            foreach (var span in otherProfile.spans)
            {
                spans.Add(new FenceObjectProbability(span));
            }
        }

        public bool CheckProfileChange(FenceProfile otherProfile)
        {
            if (triangleDensity != otherProfile.triangleDensity)
            {
                return true;
            }

            if (distanceMultiplier != otherProfile.distanceMultiplier)
            {
                return true;
            }

            if (additionalDistance != otherProfile.additionalDistance)
            {
                return true;
            }

            if (bendMeshes != otherProfile.bendMeshes)
            {
                return true;
            }


            if (postRandomType != otherProfile.postRandomType)
            {
                return true;
            }


            if (spanRandomType != otherProfile.spanRandomType)
            {
                return true;
            }

            if (scaleMesh != otherProfile.scaleMesh)
            {
                return true;
            }
            
            if (scaleMeshUnified != otherProfile.scaleMeshUnified)
            {
                return true;
            }

            if (holdUp != otherProfile.holdUp)
            {
                return true;
            }

            if (seed != otherProfile.seed)
            {
                return true;
            }

            if (randomSeed != otherProfile.randomSeed)
            {
                return true;
            }

            if (firstSpan.gameObject != otherProfile.firstSpan.gameObject)
            {
                return true;
            }

            if (lastSpan.gameObject != otherProfile.lastSpan.gameObject)
            {
                return true;
            }


            return false;
        }
    }
}
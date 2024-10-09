
namespace NatureManufacture.RAM
{
    using UnityEngine;


    [RequireComponent(typeof(Camera))]
    [ExecuteInEditMode]
    public class RamPostProcessing : MonoBehaviour
    {
        [SerializeField] private new Camera camera;
        [SerializeField] private LayerMask layer = 16;


        [SerializeField] private bool debug = false;

        [SerializeField] private int numberOfSamples = 128;

        private Texture2D _maskTexture;
        private Color[] _maskColors;
        private static readonly int RamWaterLevel = Shader.PropertyToID("_RAMWaterLevelTex");

        private Vector3 _min;
        private Vector3 _max;
        private Ray _ray;
        private Vector3 _rayOrigin;
        private Collider _lastCollider;

        private void OnEnable()
        {
            camera = GetComponent<Camera>();
            InitializeMask();

            _ray = new Ray();
        }

        private void OnValidate()
        {
            camera = GetComponent<Camera>();
            InitializeMask();

            _ray = new Ray();
        }

        private void InitializeMask()
        {
            _maskTexture = new Texture2D(numberOfSamples, 1, TextureFormat.R16, false)
            {
                wrapMode = TextureWrapMode.Clamp,
            };

            _maskColors = _maskTexture.GetPixels();
        }

        private void LateUpdate()
        {
            UnderRamTest();
        }


        private void UnderRamTest()
        {
            if (camera == null) return;

            bool backFace = Physics.queriesHitBackfaces;
            Physics.queriesHitBackfaces = true;

            bool noWater = true;

            float waterLevel = 0;
            Vector3 hitPosition;
            string values = "";

            CalculateCameraMinMaxY();

            _ray.direction = camera.transform.up;

            for (int i = 0; i < numberOfSamples; i++)
            {
                float x = i / (float) (numberOfSamples - 1);
                waterLevel = 0;
                Vector3 rayOrigin = Vector3.Lerp(_min, _max, x);


                _ray.origin = rayOrigin;

                if (Physics.Raycast(_ray, out var hit, 100, layer))
                {
                    hitPosition = hit.point;

                    waterLevel = camera.WorldToViewportPoint(hitPosition).y;

                    noWater = CheckNoWater(noWater, hit);

                    if (debug)
                    {
                        Debug.DrawLine(rayOrigin, hitPosition, Color.red);
                    }
                }


                //waterLevel = Mathf.Clamp(waterLevel, 0, 1);
                if (debug)
                {
                    values += $"{waterLevel:0.0} ";
                }

                _maskColors[i].r = waterLevel;
            }


            _maskTexture.SetPixels(_maskColors);
            _maskTexture.Apply(false);
            if (debug)
            {
                Debug.Log(values);
                Vector3 minPointHit = Vector3.zero;
                Vector3 maxPointHit = Vector3.zero;


                _ray.origin = _min;

                if (Physics.Raycast(_ray, out var hit, 100, layer))
                {
                    minPointHit = hit.point;
                }

                _ray.origin = _max;
                if (Physics.Raycast(_ray, out hit, 100, layer))
                {
                    maxPointHit = hit.point;
                }

                Debug.DrawLine(minPointHit, maxPointHit, Color.blue);
            }

            //Debug.Log("No Water: " + noWater);
            //Debug.Log($"waterLevel {waterLevel} ");
            Shader.SetGlobalTexture(RamWaterLevel, _maskTexture);


            Physics.queriesHitBackfaces = backFace;
        }

        private void CalculateCameraMinMaxY()
        {
            Vector3 pos00 = camera.transform.InverseTransformPoint(camera.ViewportToWorldPoint(new Vector3(0, 0, camera.nearClipPlane)));
            Vector3 pos10 = camera.transform.InverseTransformPoint(camera.ViewportToWorldPoint(new Vector3(1, 0, camera.nearClipPlane)));
            Vector3 pos11 = camera.transform.InverseTransformPoint(camera.ViewportToWorldPoint(new Vector3(1, 1, camera.nearClipPlane)));
            Vector3 pos01 = camera.transform.InverseTransformPoint(camera.ViewportToWorldPoint(new Vector3(0, 1, camera.nearClipPlane)));

            float minX = Mathf.Min(pos00.x, pos10.x, pos11.x, pos01.x);
            float maxX = Mathf.Max(pos00.x, pos10.x, pos11.x, pos01.x);
            float minY = Mathf.Min(pos00.y, pos10.y, pos11.y, pos01.y);


            _min = camera.transform.TransformPoint(new Vector3(minX, minY, pos00.z));
            _max = camera.transform.TransformPoint(new Vector3(maxX, minY, pos00.z));
        }

        private bool CheckNoWater(bool noWater, RaycastHit hit)
        {
            if (noWater && _lastCollider != hit.collider)
            {
                RamSpline ramSpline = hit.collider.GetComponent<RamSpline>();
                LakePolygon lakePolygon = hit.collider.GetComponent<LakePolygon>();


                if (ramSpline != null || lakePolygon != null)
                {
                    noWater = false;
                    _lastCollider = hit.collider;
                }
            }

            return noWater;
        }

        private void OnDrawGizmos()
        {
            if (!debug) return;
            if (camera == null) return;


            Gizmos.color = Color.red;
            Gizmos.DrawSphere(_min, 0.01f);
            Gizmos.DrawSphere(_max, 0.01f);

            Gizmos.color = Color.green;
            for (int i = 0; i < numberOfSamples; i++)
            {
                float x = i / (float) (numberOfSamples - 1);
                Vector3 rayOrigin = Vector3.Lerp(_min, _max, x);
                Gizmos.DrawSphere(rayOrigin, 0.01f);
            }
        }
    }
}
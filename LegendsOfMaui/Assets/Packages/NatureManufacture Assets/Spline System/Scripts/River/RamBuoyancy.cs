using System.Collections.Generic;
using UnityEngine;

namespace NatureManufacture.RAM
{
    [RequireComponent(typeof(Rigidbody))]
    public class RamBuoyancy : MonoBehaviour
    {
        [SerializeField] private float buoyancy = 30;
        [SerializeField] public float viscosity = 2;
        [SerializeField] private float viscosityAngular = 0.4f;
        [SerializeField] private bool rotateToSpeed;
        [SerializeField] private float rotationSpeed = 5;

        [SerializeField] private LayerMask layer = 16;

        [SerializeField] private new Collider collider;

        [SerializeField] private int pointsInAxis = 2;

        [SerializeField] private List<Vector3> volumePoints = new();
        [SerializeField] private bool autoGenerateVolumePoints = true;

        [SerializeField] private bool debugForces;
        [SerializeField] private bool debugVolumePoints;
        private Rigidbody _rigidbody;
        private Vector3 _center = Vector3.zero;
        private Vector3 _lowestPoint;
        private Vector3[] _volumePointsMatrix;

        private GameObject _lastGameObject;
        private RamSpline _lastRamSpline;
        private LakePolygon _lastLakePolygon;
        private Waterfall _lastWaterfall;
        private List<Vector2> _uvs3 = new(100);
        private List<int> _triangles = new(100);

        private void Start()
        {
            _rigidbody = GetComponent<Rigidbody>();


            if (collider == null)
                collider = GetComponent<Collider>();

            if (collider == null)
            {
                Debug.LogError("Buoyancy doesn't have collider");
                enabled = false;
                return;
            }

            if (autoGenerateVolumePoints)
            {
                AutoGenerateVolumePoints();
            }

            _volumePointsMatrix = new Vector3[volumePoints.Count];
        }

        private void AutoGenerateVolumePoints()
        {
            Bounds bounds = collider.bounds;
            Vector3 size = bounds.size;
            Vector3 min = bounds.min;
            var step = new Vector3(size.x / pointsInAxis, size.y / pointsInAxis, size.z / pointsInAxis);


            for (int x = 0; x <= pointsInAxis; x++)
            for (int y = 0; y <= pointsInAxis; y++)
            for (int z = 0; z <= pointsInAxis; z++)
            {
                var vertice = new Vector3(min.x + x * step.x, min.y + y * step.y, min.z + z * step.z);
                Vector3 closestPoint = collider.ClosestPoint(vertice);

                if (Vector3.Distance(closestPoint, vertice) < float.Epsilon)
                    volumePoints.Add(transform.InverseTransformPoint(vertice));
            }
        }

        private void FixedUpdate()
        {
            WaterPhysics();
        }


        private void WaterPhysics()
        {
            if (volumePoints.Count == 0)
            {
                Debug.Log("Not initiated Buoyancy");
                return;
            }

            var ray = new Ray
            {
                direction = Vector3.up
            };

            bool backFace = Physics.queriesHitBackfaces;
            Physics.queriesHitBackfaces = true;

            float minY;

            CalculateLowestPoint();

            ray.origin = _lowestPoint;

            _center = Vector3.zero;

            if (Physics.Raycast(ray, out RaycastHit hit, 100, layer))
            {
                //var width = Mathf.Max(collider.bounds.size.x, collider.bounds.size.z);

#if UNITY_6000_0_OR_NEWER
                Vector3 velocity = _rigidbody.linearVelocity;
#else
                Vector3 velocity = _rigidbody.velocity;
#endif


                Vector3 velocityDirection = velocity.normalized;

                Vector3 upVector = hit.normal;

                minY = CalculateCenter(hit);

                _rigidbody.AddForceAtPosition(upVector * (buoyancy * (minY - _center.y)), _center);

                _rigidbody.AddForce(velocity * (-1 * viscosity));

                AddViscosityAngular(velocity, velocityDirection);

                GetMeshData(hit);

                AddFloatSpeed(hit, upVector, minY, velocity);

                RotateToSpeed();
            }


            Physics.queriesHitBackfaces = backFace;
        }

        private void CalculateLowestPoint()
        {
            Matrix4x4 thisMatrix = transform.localToWorldMatrix;

            _lowestPoint = volumePoints[0];
            float minY = float.MaxValue;
            for (int i = 0; i < volumePoints.Count; i++)
            {
                _volumePointsMatrix[i] = thisMatrix.MultiplyPoint3x4(volumePoints[i]);

                if (minY > _volumePointsMatrix[i].y)
                {
                    _lowestPoint = _volumePointsMatrix[i];
                    minY = _lowestPoint.y;
                }
            }
        }

        private void AddFloatSpeed(RaycastHit hit, Vector3 upVector, float minY, Vector3 velocity)
        {
            Vector3 verticeDirection = Vector3.zero;
            if (_lastRamSpline != null)
            {
                int verticeId1 = _triangles[hit.triangleIndex * 3];
                verticeDirection = _lastRamSpline.verticeDirection[verticeId1];
                Vector2 uv3 = _uvs3[verticeId1];

                verticeDirection = verticeDirection * uv3.y - new Vector3(verticeDirection.z, verticeDirection.y, -verticeDirection.x) * uv3.x;

                _rigidbody.AddForce(new Vector3(verticeDirection.x, 0, verticeDirection.z) * _lastRamSpline.BaseProfile.floatSpeed);
            }
            else if (_lastLakePolygon != null)
            {
                int verticeId1 = _triangles[hit.triangleIndex * 3];
                Vector2 uv3 = -_uvs3[verticeId1];

                verticeDirection = new Vector3(uv3.x, 0, uv3.y);

                _rigidbody.AddForce(verticeDirection * _lastLakePolygon.floatSpeed);
            }
            else if (_lastWaterfall != null)
            {
                int verticeId1 = _triangles[hit.triangleIndex * 3];
                verticeDirection = _lastWaterfall.VerticeDirection[verticeId1];

                _rigidbody.AddForce(verticeDirection * _lastWaterfall.BaseProfile.FloatSpeed); //* _lastWaterfall.floatSpeed);
            }

            DebugForces(verticeDirection, upVector, minY, velocity);
        }

        private float CalculateCenter(RaycastHit hit)
        {
            int verticesCount = 0;
            float minY = hit.point.y;
            for (int i = 0; i < _volumePointsMatrix.Length; i++)
                if (_volumePointsMatrix[i].y <= minY)
                {
                    _center += _volumePointsMatrix[i];
                    verticesCount++;
                }

            _center /= verticesCount;
            return minY;
        }

        private void RotateToSpeed()
        {
            if (!rotateToSpeed) return;

#if UNITY_6000_0_OR_NEWER
            Vector3 speed = _rigidbody.linearVelocity.normalized;
#else
            Vector3 speed = _rigidbody.velocity.normalized;
#endif

            speed.y = 0;

            Quaternion deltaRotation = Quaternion.LookRotation(speed);
            _rigidbody.MoveRotation(Quaternion.Slerp(transform.rotation, deltaRotation, Time.fixedDeltaTime * rotationSpeed));
        }

        private void GetMeshData(RaycastHit hit)
        {
            if (_lastGameObject == hit.collider.gameObject) return;

            hit.collider.TryGetComponent(out _lastRamSpline);
            hit.collider.TryGetComponent(out _lastLakePolygon);
            hit.collider.TryGetComponent(out _lastWaterfall);
            Mesh mesh = null;
            if (_lastRamSpline != null)
            {
                mesh = _lastRamSpline.meshFilter.sharedMesh;
            }
            else if (_lastLakePolygon != null)
            {
                mesh = _lastLakePolygon.meshFilter.sharedMesh;
            }
            else if (_lastWaterfall != null)
            {
                mesh = _lastWaterfall.MainMeshFilter.sharedMesh;
            }

            if (mesh == null) return;

            mesh.GetTriangles(_triangles, 0);
            mesh.GetUVs(3, _uvs3);
        }

        private void AddViscosityAngular(Vector3 velocity, Vector3 velocityDirection)
        {
            if (!(velocity.magnitude > 0.01f)) return;

            Vector3 pointFront = velocity.normalized * 10;
            Ray rayCollider;


            foreach (Vector3 item in _volumePointsMatrix)
            {
                Vector3 start = pointFront + item;
                rayCollider = new Ray(start, -velocityDirection);

                //Debug.Log(start + " " + v1 + " " + v2);

                //Debug.DrawRay(start, -velocityDirection * 50, Color.cyan);
                if (!collider.Raycast(rayCollider, out RaycastHit hitCollider, 50)) continue;

                Vector3 pointVelocity = _rigidbody.GetPointVelocity(hitCollider.point);
                _rigidbody.AddForceAtPosition(-pointVelocity * viscosityAngular, hitCollider.point);
                //Debug.Log(hitCollider.point);
                if (debugForces)
                    Debug.DrawRay(hitCollider.point, -pointVelocity * (viscosityAngular * 2), Color.red, 0.1f);
            }
        }

        private void OnDrawGizmosSelected()
        {
            if (!debugVolumePoints)
                return;


            if (collider != null && _volumePointsMatrix != null)
            {
                foreach (Vector3 item in _volumePointsMatrix)
                {
                    Gizmos.color = Color.red;
                    Gizmos.DrawSphere(item, .08f);
                }
            }


            Gizmos.color = Color.blue;
            Gizmos.DrawSphere(_lowestPoint, .08f);


            Gizmos.color = Color.green;
            Gizmos.DrawSphere(_center, .08f);
        }

        private void DebugForces(Vector3 verticeDirection, Vector3 upVector, float minY, Vector3 velocity)
        {
            if (!debugForces) return;

            if (_lastRamSpline == null && _lastLakePolygon == null && _lastWaterfall) return;

            const float vectorSize = 5;

            Vector3 position = transform.position;
            Debug.DrawRay(position + Vector3.up, verticeDirection * vectorSize, Color.red);
            Debug.DrawRay(_center, upVector * (buoyancy * (minY - _center.y) * vectorSize), Color.green);
            Debug.DrawRay(position, velocity * (-1 * viscosity * vectorSize), Color.magenta);
            Debug.DrawRay(position, velocity * vectorSize, Color.blue);
            Debug.DrawRay(position, _rigidbody.angularVelocity * vectorSize, Color.black);
        }
    }
}
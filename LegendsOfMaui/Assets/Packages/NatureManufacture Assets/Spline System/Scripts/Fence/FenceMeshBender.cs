using UnityEditor;
using UnityEngine;

namespace NatureManufacture.RAM
{
    public static class FenceMeshBender
    {
        public static void BendMeshesWithLod(Vector3 newPosition, float currentLength, GameObject go, Quaternion rotation, FenceObjectProbability probability, NmSpline nmSpline, bool holdUp,
            NmSplineDataFenceScale fenceScaleData)
        {
            MeshCollider[] meshColliders = go.GetComponentsInChildren<MeshCollider>();

            Transform goTransform = go.transform;

            goTransform.rotation = Quaternion.LookRotation(Vector3.left, Vector3.up) * Quaternion.Euler(probability.rotationOffset) * rotation;

            MeshFilter[] meshFilter = go.GetComponentsInChildren<MeshFilter>();

            Vector3 newPositionVertice;

            Vector3 position = goTransform.position;
            float xPosition = position.x;
            float newPositionZ = newPosition.z;
            float newPositionY = newPosition.y;

            NmSplinePoint splinePoint = nmSpline.NmSplinePointSearcher.FindPosition(currentLength, 0, out int searchLast);


            float offsetX = probability.positionOffset.x;
            float offsetY = probability.positionOffset.y;

            Vector2 additionalScale;


            searchLast = searchLast > 0 ? searchLast - 1 : 0;
            Vector3 eulerAngles;
            foreach (MeshFilter item in meshFilter)
            {
                var mesh = Object.Instantiate(item.sharedMesh);

                Vector3[] vertices = mesh.vertices;
                int verticeCount = vertices.Length;
                Transform meshFilterTransform = item.transform;

                for (int i = 0; i < verticeCount; i++)
                {
                    newPositionVertice = meshFilterTransform.TransformPoint(vertices[i]);
                    float splinePosition = currentLength - (newPositionVertice.x - xPosition);
                    splinePoint = nmSpline.NmSplinePointSearcher.FindPosition(splinePosition, splinePosition >= currentLength ? searchLast : 0, out _);
                    eulerAngles = splinePoint.Rotation.eulerAngles;
                    Quaternion splineRotation = Quaternion.AngleAxis(eulerAngles.z, splinePoint.Tangent) * Quaternion.AngleAxis(eulerAngles.y, splinePoint.Normal) *
                                                Quaternion.AngleAxis(eulerAngles.x, splinePoint.Binormal);


                    additionalScale = fenceScaleData.GetSearchData(splinePosition);

                    //newPositionVertice += splineRotation * splinePoint.Normal * yOffsetSpan;
                    Vector3 splinePointBinormal = splinePoint.Binormal * ((newPositionVertice.z - newPositionZ + offsetX) * additionalScale.x);
                    Vector3 splinePointNormal = (holdUp ? new Vector3(0, (newPositionVertice.y - newPositionY + offsetY), 0) : splinePoint.Normal * (newPositionVertice.y - newPositionY + offsetY)) * additionalScale.y;
                    vertices[i] = splinePoint.Position + splineRotation * (splinePointBinormal + splinePointNormal);


                    vertices[i] = meshFilterTransform.InverseTransformPoint(vertices[i]);
                }

                mesh.vertices = vertices;

                //mesh.RecalculateNormals(60, 0);
                //mesh.RecalculateNormals();
                //mesh.RecalculateTangents();

                TB.FrancNormalSolver.RecalculateNormals(mesh, 60);
                TB.FrancNormalSolver.RecalculateTangents(mesh);
                mesh = TB.FrancNormalSolver.WeldVertices(mesh);
                //mesh.Optimize();

                mesh.RecalculateBounds();
                // mesh.mesh
                //Unwrapping.GenerateSecondaryUVSet(mesh);


                if (meshColliders.Length > 0)
                {
                    for (int i = 0; i < meshColliders.Length; i++)
                    {
                        if (meshColliders[i].sharedMesh == item.sharedMesh)
                        {
                            meshColliders[i].sharedMesh = mesh;
                        }
                    }
                }

                item.sharedMesh = mesh;
            }
        }
    }
}
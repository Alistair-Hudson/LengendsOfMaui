// /**
//  * Created by Pawel Homenko on  07/2022
//  */

using System.Collections.Generic;
using UnityEngine;

namespace NatureManufacture.RAM
{
    public class RamMeshPartGenerator
    {
        private readonly RamSpline _ramSpline;

        public RamMeshPartGenerator(RamSpline ramSpline)
        {
            _ramSpline = ramSpline;
        }

        public void GenerateMeshParts(Mesh baseMesh)
        {
            foreach (Transform item in _ramSpline.meshesPartTransforms)
                if (item != null)
                    Object.DestroyImmediate(item.gameObject);


            _ramSpline.GetComponent<MeshRenderer>().enabled = false;

            int segments = _ramSpline.NmSpline.Points.Count - 1;
            int verticesLinesPart = Mathf.RoundToInt(segments / (float) _ramSpline.meshPartsCount);


            Vector3[] vertices = baseMesh.vertices;
            Vector3[] normals = baseMesh.normals;
         
            Vector2[] uvs = baseMesh.uv;
            Vector2[] uvs2 = baseMesh.uv3;
            Vector2[] uvs3 = baseMesh.uv4;
            Color[] vertexColors = baseMesh.colors;

            for (int mp = 0; mp < _ramSpline.meshPartsCount; mp++)
            {
                var go = new GameObject(_ramSpline.gameObject.name + "- Mesh part " + mp);
                go.transform.SetParent(_ramSpline.transform, false);
                go.transform.localPosition = Vector3.zero;
                go.transform.localEulerAngles = Vector3.zero;
                go.transform.localScale = Vector3.one;

                _ramSpline.meshesPartTransforms.Add(go.transform);

                var meshRendererPart = go.AddComponent<MeshRenderer>();

                meshRendererPart.sharedMaterial = _ramSpline.GetComponent<MeshRenderer>().sharedMaterial;
                meshRendererPart.receiveShadows = _ramSpline.BaseProfile.receiveShadows;
                meshRendererPart.shadowCastingMode = _ramSpline.BaseProfile.shadowCastingMode;


                var mf = go.AddComponent<MeshFilter>();
                var meshPart = new Mesh();
                meshPart.Clear();

                List<Vector3> verticesPart = new List<Vector3>();
                List<Vector3> normalsPart = new List<Vector3>();
                List<Vector2> uvPart = new List<Vector2>();
                List<Vector2> uv3Part = new List<Vector2>();
                List<Vector2> uv4Part = new List<Vector2>();
                List<Color> colorsPart = new List<Color>();
                List<int> trianglesPart = new List<int>();

                List<int> vertexIndices = new List<int>();

                int offset = 0;
                int newVertIndex;

                for (int i = 0; i <= segments - 1 && i < (mp + 1) * verticesLinesPart; i++)
                {
                    int vertsCount = _ramSpline.BaseProfile.vertsInShape * _ramSpline.NmSpline.Points[i].Density;
                    int vertsCountNext = _ramSpline.BaseProfile.vertsInShape * _ramSpline.NmSpline.Points[i + 1].Density;

                    if (i < mp * verticesLinesPart)
                    {
                        offset += vertsCount;
                        continue;
                    }

                    if (vertsCount < vertsCountNext)
                    {
                        int difference = vertsCountNext / vertsCount;

                        for (int l = 0; l < vertsCountNext - 1; l += 1)
                        {
                            int a = offset + l / difference;
                            int b = offset + vertsCount + l;
                            int c = offset + vertsCount + l + 1;

                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(b, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                        }

                        for (int l = 0; l < vertsCount - 1; l += 1)
                        {
                            int a = offset + l;
                            int c = offset + l + 1;
                            int b = offset + vertsCount + (l + 1) * difference;


                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(b, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                        }
                    }
                    else if (vertsCount > vertsCountNext)
                    {
                        int difference = vertsCount / vertsCountNext;

                        for (int l = 0; l < vertsCountNext - 1; l += 1)
                        {
                            int a = offset + (l + 1) * difference;
                            int b = offset + vertsCount + l;
                            int c = offset + vertsCount + l + 1;

                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(b, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                        }

                        for (int l = 0; l < vertsCount - 1; l += 1)
                        {
                            int a = offset + l;
                            int c = offset + +l + 1;
                            int b = offset + vertsCount + l / difference;

                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(b, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                        }
                    }
                    else
                    {
                        for (int l = 0; l < vertsCount - 1; l += 1)
                        {
                            int a = offset + l;
                            int b = offset + l + vertsCount;
                            int c = offset + l + 1 + vertsCount;
                            int d = offset + l + 1;

                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(b, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);

                            newVertIndex = NewVertIndex(c, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(d, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                            newVertIndex = NewVertIndex(a, vertexIndices, verticesPart, vertices, colorsPart, vertexColors, normalsPart, normals, uvPart, uvs, uv3Part, uvs2, uv4Part, uvs3);
                            trianglesPart.Add(newVertIndex);
                        }
                    }

                    offset += vertsCount;
                }


                if (verticesPart.Count > 0)
                {
                    Vector3 pivotChange = verticesPart[0];
                    for (int j = 0; j < verticesPart.Count; j++) verticesPart[j] = verticesPart[j] - pivotChange;

                    go.transform.position += pivotChange;

                    meshPart.vertices = verticesPart.ToArray();
                    meshPart.triangles = trianglesPart.ToArray();
                    meshPart.normals = normalsPart.ToArray();
                    meshPart.SetUVs(0,uvPart);
                    meshPart.SetUVs(2, uv3Part);
                    meshPart.SetUVs(3 ,uv4Part);
                    meshPart.colors = colorsPart.ToArray();


                    meshPart.RecalculateTangents();
                    mf.mesh = meshPart;

                    //MeshCollider meshCollider = go.AddComponent<MeshCollider>();

                    //meshCollider.cookingOptions = MeshColliderCookingOptions.InflateConvexMesh | MeshColliderCookingOptions.CookForFasterSimulation | MeshColliderCookingOptions.EnableMeshCleaning | MeshColliderCookingOptions.WeldColocatedVertices;
                    //meshCollider.skinWidth = 0.1f;
                    //meshCollider.convex = true;
                    //meshCollider.isTrigger = true;
                }
            }
        }

        private int NewVertIndex(int curVertIndex, List<int> vertexIndices, List<Vector3> verticesPart, Vector3[] vertices, List<Color> colorsPart, Color[] vertexColors, List<Vector3> normalsPart, Vector3[] normals, List<Vector2> uvPart,
            Vector2[] uvs,
            List<Vector2> uv3Part, Vector2[] uvs3, List<Vector2> uv4Part,
            Vector2[] uvs4)
        {
            int newVertIndex;
            if (!vertexIndices.Contains(curVertIndex))
            {
                newVertIndex = vertexIndices.Count;

                vertexIndices.Add(curVertIndex);
                verticesPart.Add(vertices[curVertIndex]);
                colorsPart.Add(vertexColors[curVertIndex]);
                normalsPart.Add(normals[curVertIndex]);
                uvPart.Add(uvs[curVertIndex]);
                uv3Part.Add(uvs3[curVertIndex]);
                uv4Part.Add(uvs4[curVertIndex]);
            }
            else
            {
                newVertIndex = vertexIndices.IndexOf(curVertIndex);
            }

            return newVertIndex;
        }
    }
}
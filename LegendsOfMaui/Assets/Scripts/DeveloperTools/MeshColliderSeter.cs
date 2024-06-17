using Sirenix.OdinInspector;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    [RequireComponent(typeof(MeshCollider))]
    public class MeshColliderSeter : MonoBehaviour
    {
        private void Awake()
        {
            SetMeshCollider();
        }

        [Button("Set MeshCollider")]
        private void SetMeshCollider()
        {
            var meshCollider = GetComponent<MeshCollider>();

            var meshFilter = GetComponentInChildren<MeshFilter>();
            if (meshFilter == null)
            {
                meshCollider.sharedMesh = null;
                return;
            }

            var mesh = meshFilter.mesh;
            if (mesh == null)
            {
                meshCollider.sharedMesh = null;
            }
            else
            {
                meshCollider.sharedMesh = mesh;
                meshCollider.convex = true;
            }


        }
    }
}
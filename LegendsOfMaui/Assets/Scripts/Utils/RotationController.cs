using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class RotationController : MonoBehaviour
    {
        [SerializeField]
        [Tooltip("Rotation is in degrees per second")]
        private Vector3 _rotationSpeed = Vector3.zero;

        private void FixedUpdate()
        {
            Vector3 rotateBy = _rotationSpeed * Time.fixedDeltaTime;
            Vector3 currentRotation = transform.localRotation.eulerAngles;
            Vector3 nextRotation = currentRotation + rotateBy;
            transform.localRotation = Quaternion.Euler(nextRotation);
        }
    }
}
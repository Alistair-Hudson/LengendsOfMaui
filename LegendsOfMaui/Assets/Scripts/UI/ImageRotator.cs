using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class ImageRotator : MonoBehaviour
    {
        [SerializeField]
        [Tooltip("Degrees per second")]
        private float rotationSpeed = 45;

        private void Update()
        {
            var currentRotation = transform.eulerAngles;
            var nextRotation = currentRotation + Vector3.forward * rotationSpeed * Time.deltaTime;
            transform.eulerAngles = nextRotation;
        }
    }
}
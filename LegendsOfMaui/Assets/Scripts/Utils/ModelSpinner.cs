using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class ModelSpinner : MonoBehaviour
    {
        [SerializeField]
        private float rotationPerSecond = 45;

        void Update()
        {
            Quaternion currentRotation = transform.rotation;
            Quaternion newRotation = Quaternion.Euler(0, currentRotation.eulerAngles.y + rotationPerSecond * Time.deltaTime, 0);
            Debug.Log(newRotation.eulerAngles);
            transform.rotation = newRotation;
        }
    }
}
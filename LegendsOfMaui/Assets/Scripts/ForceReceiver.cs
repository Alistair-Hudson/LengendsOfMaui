using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui
{
    [RequireComponent(typeof(CharacterController))]
    public class ForceReceiver : MonoBehaviour
    {
        private CharacterController _controller = null;

        private float _vertVelocity = 0;

        public Vector3 Movement => Vector3.up * _vertVelocity;

        private void Awake()
        {
            _controller = GetComponent<CharacterController>();
        }

        private void Update()
        {
            if (_vertVelocity < 0 && _controller.isGrounded)
            {
                _vertVelocity = Physics.gravity.y * Time.deltaTime;
            }
            else
            {
                _vertVelocity += Physics.gravity.y * Time.deltaTime;
            }
        }
    }
}
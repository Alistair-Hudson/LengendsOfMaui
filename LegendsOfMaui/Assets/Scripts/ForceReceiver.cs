using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui
{
    [RequireComponent(typeof(CharacterController))]
    public class ForceReceiver : MonoBehaviour
    {
        [SerializeField]
        private float _drag = 0.3f;

        private CharacterController _controller = null;

        private Vector3 _impact = Vector3.zero;
        private Vector3 _dampingVelocity = Vector3.zero;

        private float _vertVelocity = 0;

        public Vector3 Movement => _impact + Vector3.up * _vertVelocity;

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

            _impact = Vector3.SmoothDamp(_impact, Vector3.zero, ref _dampingVelocity, _drag);
        }

        public void AddForce(Vector3 force)
        {
            _impact += force;
        }
    }
}
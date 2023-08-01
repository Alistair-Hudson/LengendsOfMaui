using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui
{
    [RequireComponent(typeof(CharacterController))]
    public class ForceReceiver : MonoBehaviour
    {
        [SerializeField]
        private float _drag = 0.3f;

        private CharacterController _controller = null;
        private NavMeshAgent _navMeshAgent = null;

        private Vector3 _impact = Vector3.zero;
        private Vector3 _dampingVelocity = Vector3.zero;

        private float _vertVelocity = 0;

        public Vector3 Movement => _impact + Vector3.up * _vertVelocity;

        private void Awake()
        {
            _controller = GetComponent<CharacterController>();
            _navMeshAgent = GetComponent<NavMeshAgent>();
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

            if (_impact.sqrMagnitude <= 0.2f * 0.2f && _navMeshAgent != null)
            {
                _impact = Vector3.zero;
                _navMeshAgent.enabled = true;
            }
        }

        public void AddForce(Vector3 force)
        {
            _impact += force;
            if (_navMeshAgent != null)
            {
                _navMeshAgent.enabled = false;
            }
        }
    }
}
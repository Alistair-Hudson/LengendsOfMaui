using AlictronicGames.LegendsOfMaui.DeveloperTools;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.StateMachines.NPC
{
    [RequireComponent(typeof(NavMeshAgent), typeof(Collider))]
    public class NPCActionController : MonoBehaviour
    {
        [SerializeField]
        private WayPoint _destination = null;
        [SerializeField]
        private float _wayPointStopDistance = 1;

        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;
        private const float IDLE_SPEED = 0;
        private const float WALK_SPEED = 1.5f;

        private NavMeshAgent _navMeshAgent = null;
        private Collider _collider = null;
        private Animator _animator = null;

        private void Awake()
        {
            _navMeshAgent = GetComponent<NavMeshAgent>();
            _collider = GetComponent<Collider>();
            _animator = GetComponentInChildren<Animator>();
        }

        private void Start()
        {
            float animationSpeed = IDLE_SPEED;
            if (_destination)
            {
                _navMeshAgent.SetDestination(_destination.Position);
                animationSpeed = WALK_SPEED;
            }
            _animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
            _animator.SetFloat(FORWARD_SPEED, animationSpeed, ANIMATOR_DAMP_TIME, Time.deltaTime);
        }

        private void Update()
        {
            if (Vector3.Distance(_destination.Position, transform.position) <= _wayPointStopDistance)
            {
                _destination = _destination.NextWayPoint;
                _navMeshAgent.SetDestination(_destination.Position);
            }
        }
    }
}
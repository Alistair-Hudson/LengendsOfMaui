using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.DeveloperTools;
using System;
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
        private AnimatorOverrideController _animatorOverrideController = null;
        [SerializeField]
        private WayPoint _destination = null;
        [SerializeField]
        private float _wayPointStopDistance = 1;
        [SerializeField]
        private bool _isNocturnal = false;
        [SerializeField]
        private bool _isAlwaysActive = false;

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

            if (_animatorOverrideController)
            {
                _animator.runtimeAnimatorController = _animatorOverrideController;
            }
            this.enabled = _isAlwaysActive;
        }

        private void Start()
        {
            if (_isNocturnal)
            {
                DayNightCycle.NightIsActiveEvent += HandleNightActivation;
                HandleNightActivation(DayNightCycle.IsNight);
            }
        }

        private void Update()
        {
            if (_destination)
            {
                ChangeDestinationIfClose();
            }
        }

        private void OnEnable()
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

        private void OnDestroy()
        {
            if (_isNocturnal)
            {
                DayNightCycle.NightIsActiveEvent -= HandleNightActivation;
            }
        }

        private void ChangeDestinationIfClose()
        {
            if (Vector3.Distance(_destination.Position, transform.position) <= _wayPointStopDistance)
            {
                _destination = _destination.NextWayPoint;
                if (_destination)
                {
                    _navMeshAgent.SetDestination(_destination.Position);
                }
            }
        }

        private void HandleNightActivation(bool state)
        {
            gameObject.SetActive(state);
        }

        public void SetDestination(WayPoint destination)
        {
            _destination = destination;
            OnEnable();
        }
    }
}
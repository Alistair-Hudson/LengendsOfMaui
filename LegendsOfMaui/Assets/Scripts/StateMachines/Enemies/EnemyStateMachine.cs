using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Enemy
{
    [RequireComponent(typeof(CharacterController), typeof(ForceReceiver), typeof(NavMeshAgent))]
    public class EnemyStateMachine : StateMachine
    {
        [field: SerializeField]
        public float PlayerChaseRange { get; private set; } = 0f;
        [field: SerializeField]
        public float AttackRange { get; private set; } = 0f;
        [field: SerializeField]
        public float MovementSpeed { get; private set; } = 0f;

        public Animator Animator { get; private set; } = null;
        public GameObject Player { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public NavMeshAgent NavMeshAgent { get; private set; } = null;

        private void Awake()
        {
            CharacterController = GetComponent<CharacterController>();
            ForceReceiver = GetComponent<ForceReceiver>();
            NavMeshAgent = GetComponent<NavMeshAgent>();
            Animator = GetComponentInChildren<Animator>();
            Player = FindFirstObjectByType<Player.PlayerStateMachine>().gameObject;

            NavMeshAgent.updatePosition = false;
            NavMeshAgent.updateRotation = false;
        }

        private void Start()
        {
            SwitchState(new EnemyIdleState(this));
        }

        private void OnDrawGizmosSelected()
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, PlayerChaseRange);
        }
    }
}
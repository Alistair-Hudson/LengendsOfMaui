using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.StateMachines.NPC
{
    [RequireComponent(typeof(CharacterController), typeof(NavMeshAgent))]
    public class NPCStateMachine : StateMachine
    {
        public PlayerStateMachine Player { get; private set; } = null;
        public Animator Animator { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public NavMeshAgent NavMeshAgent { get; private set; } = null;

        private void Awake()
        {
            CharacterController = GetComponent<CharacterController>();
            NavMeshAgent = GetComponent<NavMeshAgent>();

            Animator = GetComponentInChildren<Animator>();

            NavMeshAgent.updatePosition = false;
            NavMeshAgent.updateRotation = false;

            Player = FindFirstObjectByType<PlayerStateMachine>();
        }

        private void Start()
        {
            SwitchState(new NPCIdleState(this));
        }
    }
}
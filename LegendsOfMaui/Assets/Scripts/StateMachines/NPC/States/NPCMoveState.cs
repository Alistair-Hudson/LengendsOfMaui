using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.NPC
{
    public class NPCMoveState : NPCBaseState
    {
        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public NPCMoveState(NPCStateMachine NPCStateMachine) : base(NPCStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            stateMachine.NavMeshAgent.ResetPath();
            stateMachine.NavMeshAgent.velocity = Vector3.zero;
        }

        public override void FixedTick()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            stateMachine.Animator.SetFloat(FORWARD_SPEED, 1, ANIMATOR_DAMP_TIME, deltaTime);
        }
    }
}
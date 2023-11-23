using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.NPC
{
    public abstract class NPCBaseState : State
    {
        protected NPCStateMachine stateMachine = null;

        public NPCBaseState(NPCStateMachine NPCStateMachine)
        {
            stateMachine = NPCStateMachine;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            stateMachine.CharacterController.Move(motion * deltaTime);
        }

        protected void Move(float deltaTime)
        {
            Move(Vector3.zero, deltaTime);
        }

        protected void FacePlayer()
        {
            if (stateMachine.Player == null)
            {
                return;
            }
            Vector3 lookDir = stateMachine.Player.transform.position - stateMachine.transform.position;
            lookDir.y = 0;
            stateMachine.transform.rotation = Quaternion.LookRotation(lookDir);
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public abstract class BossBaseState : State
    {
        protected BossStateMachine stateMachine = null;

        public BossBaseState(BossStateMachine bossStateMachine)
        {
            stateMachine = bossStateMachine;
        }

        protected void Move(Vector3 motion, float deltaTime)
        {
            stateMachine.CharacterController.Move(motion * deltaTime);
        }

        protected void Move(float deltaTime)
        {
            Move(Vector3.zero, deltaTime);
        }
    }
}
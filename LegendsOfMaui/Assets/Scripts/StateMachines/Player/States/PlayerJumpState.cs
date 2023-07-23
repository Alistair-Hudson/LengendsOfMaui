using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerJumpState : PlayerBaseState
    {
        public PlayerJumpState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            Debug.Log("Entered Jump");
        }

        public override void Exit()
        {
            Debug.Log("Exited Jump");
        }

        public override void Tick(float deltaTime)
        {
            Debug.Log("In Jump");
        }
    }
}
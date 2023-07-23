using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerDodgeState : PlayerBaseState
    {
        public PlayerDodgeState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            Debug.Log("Entered Dodge");
        }

        public override void Exit()
        {
            Debug.Log("Exited Dodge");
        }

        public override void Tick(float deltaTime)
        {
            Debug.Log("In Dodge");
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public abstract class PlayerBaseState : State
    {
        protected PlayerStateMachine _stateMachine = null;

        public PlayerBaseState(PlayerStateMachine playerStateMachine)
        {
            _stateMachine = playerStateMachine;
        }
    }
}
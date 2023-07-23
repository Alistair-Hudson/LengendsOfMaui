using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerStateMachine : StateMachine
    {
        private void Start()
        {
            SwitchState(new PlayerTestState(this));
        }
    }
}
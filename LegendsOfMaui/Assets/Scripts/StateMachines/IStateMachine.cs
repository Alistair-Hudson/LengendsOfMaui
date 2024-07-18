using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines
{
    public interface IStateMachine
    {
        string Name { get; }
        State CurrentState { get; }
    }
}

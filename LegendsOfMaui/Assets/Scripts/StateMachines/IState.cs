using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines
{
    public interface IState
    {
        void Enter();
        void Tick(float deltaTime);
        void FixedTick();
        void Exit();
    }
}

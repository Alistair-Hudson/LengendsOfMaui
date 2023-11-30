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
    }
}
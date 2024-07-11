using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public interface IBossAttack
    {
        bool AttackReady { get; }
        void InitializeAttackPattern(BossStateMachine bossStateMachine);
        void InitiateAttack();
    }
}
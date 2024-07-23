using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public interface IBossAttack
    {
        string AttackName { get; }
        float AttackDamage { get; }
        float KnockBackForce { get; }
        AttackType AttackType { get; }
        void InitializeAttackPattern(BossStateMachine bossStateMachine);
        void InitiateAttack();
    }
}
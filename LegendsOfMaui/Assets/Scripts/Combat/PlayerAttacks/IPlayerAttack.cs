using AlictronicGames.LegendsOfMaui.Saving;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public interface IPlayerAttack : ISaveable
    {
        float BaseAttackDamage { get; }
        float BaseKnockBackForce { get; }
        bool IsLearnt { get; }
        string AttackName { get; }
        Animation AttackAnimation { get; }
        IPlayerAttack GetNextFastAttack();
        IPlayerAttack GetNextHeavyAttack();
        IPlayerAttack GetNextJumpAttack();
        IPlayerAttack GetNextDodgeAttack();
        IPlayerAttack GetNextBlockAttack();
    }
}
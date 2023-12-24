using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    [System.Serializable]
    public class AttackData
    {
        [field: SerializeField]
        public string AnimationName { get; private set; } = "";
        [field: SerializeField]
        [field: Range(0f, 1f)]
        public float TransitionDuration { get; private set; } = 0;
        [field: SerializeField]
        public int ComboStateIndex { get; private set; } = -1;
        [field: SerializeField]
        [field: Range(0f, 1f)]
        public float ComboAttackTime { get; private set; } = 0;
        [field: SerializeField]
        [field: Range(0f, 1f)]
        public float ForceTime { get; private set; } = 0;
        [field: SerializeField]
        public float Force { get; private set; } = 0;
        [field: SerializeField]
        public float AttackDamage { get; private set; } = 0;
        [field: SerializeField]
        public float KnockbackForce { get; private set; } = 0;

        public AttackData(string animationName, float tranistionDuration, int comboStateIndex, float comboAttackTime, float forceTime, float force, float attackDamage, float knockbackForce)
        {
            AnimationName = animationName;
            TransitionDuration = tranistionDuration;
            ComboStateIndex = comboStateIndex;
            ComboAttackTime = comboAttackTime;
            ForceTime = forceTime;
            Force = force;
            AttackDamage = attackDamage;
            KnockbackForce = knockbackForce;
        }
    }
}
using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "EventBasedAttack", menuName = "Boss Attacks/Event Based Attack", order = 0)]
    public class EventBasedAttack : ScriptableObject, IBossAttack
    {
        [SerializeField]
        private AttackType _attackType = AttackType.None;
        [SerializeField]
        private float _delayBeforeAttack = 3;

        public bool AttackReady => throw new System.NotImplementedException();

        public void InitializeAttackPattern(BossStateMachine bossStateMachine)
        {
            
        }

        public void InitiateAttack()
        {
            
        }
    }
}
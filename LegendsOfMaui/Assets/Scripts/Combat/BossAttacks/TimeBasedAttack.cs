using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "TimedBasedAttack", menuName = "Boss Attacks/Timed Based Attack", order = 0)]
    public class TimeBasedAttack : ScriptableObject, IBossAttack
    {
        [SerializeField]
        private AttackType _attackType = AttackType.None;
        [SerializeField]
        private float _timeBetweenAttacks = 3;

        public bool AttackReady => throw new System.NotImplementedException();

        public void InitializeAttackPattern(BossStateMachine bossStateMachine)
        {
            //listen for boss death
            //Start coroutine for attack time
        }

        public void InitiateAttack()
        {
            //Use attack
            //start new attack coroutine
        }
    }
}
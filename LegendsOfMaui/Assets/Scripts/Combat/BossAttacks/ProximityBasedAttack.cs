using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "ProximityBasedAttack", menuName = "Boss Attacks/Proximity Based Attack", order = 0)]
    public class ProximityBasedAttack : ScriptableObject, IBossAttack
    {
        [SerializeField]
        private AttackType _attackType = AttackType.None;
        [SerializeField]
        private float _proximity = 10;
        [SerializeField]
        private float _timeBetweenAttacks = 3;
        [SerializeField]
        private bool _isAtttackUnderProximity = false;

        public bool AttackReady => throw new System.NotImplementedException();

        public void InitializeAttackPattern(BossStateMachine bossStateMachine)
        {
            //listen to boss death
            //start coroutine delay
        }

        public void InitiateAttack()
        {
            //use attack
            //start new coroutine
        }
    }
}
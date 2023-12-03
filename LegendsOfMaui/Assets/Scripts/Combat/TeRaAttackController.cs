using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class TeRaAttackController : MonoBehaviour
    {
        [SerializeField]
        private GameObject _attack0Prefab = null;
        [SerializeField]
        private GameObject _attack1Prefab = null;
        [SerializeField]
        private GameObject _attack2Prefab = null;

        private BossStateMachine bossStateMachine = null;

        private void Awake()
        {
            bossStateMachine = GetComponentInParent<BossStateMachine>();
        }

        public void CallAttack0()
        {
            var attackInstance = Instantiate(_attack0Prefab);
        }

        public void CallAttack1()
        {
            var attackInstance = Instantiate(_attack1Prefab);
        }

        public void CallAttack2()
        {
            var attackInstance = Instantiate(_attack2Prefab);
        }
    }
}
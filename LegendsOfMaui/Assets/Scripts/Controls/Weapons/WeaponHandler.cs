using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class WeaponHandler : MonoBehaviour
    {
        [SerializeField]
        private List<WeaponDamage> _weaponLogics = new List<WeaponDamage>();

        private PlayerStateMachine _playerStateMachine;

        private void Awake()
        {
            _playerStateMachine = GetComponentInParent<PlayerStateMachine>(true);
        }

        public void EnableWeapon()
        {
            foreach (var logic in _weaponLogics)
            {
                logic.enabled = true;
            }
        }

        public void DisableWeapon()
        {
            foreach (var logic in _weaponLogics)
            {
                logic.enabled = false;
            }
        }

        public void SetWeaponLogic(WeaponDamage weaponLogic)
        {
            _weaponLogics.Add(weaponLogic);
        }

        public void SetAttackChainReady()
        {
            if (_playerStateMachine == null)
            {
                return;
            }

            _playerStateMachine.IsChainAttackReady = true;
        }
    }
}
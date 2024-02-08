using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class WeaponHandler : MonoBehaviour
    {
        [SerializeField]
        private List<WeaponDamage> _weaponLogics = new List<WeaponDamage>();

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
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class WeaponHandler : MonoBehaviour
    {
        [SerializeField]
        private WeaponDamage _weaponLogic = null;

        public void EnableWeapon()
        {
            _weaponLogic.enabled = true;
        }

        public void DisableWeapon()
        {
            _weaponLogic.enabled = false;
        }

        public void SetWeaponLogic(WeaponDamage weaponLogic)
        {
            _weaponLogic.gameObject.SetActive(false);
            _weaponLogic = weaponLogic;
            _weaponLogic.gameObject.SetActive(true);
        }
    }
}
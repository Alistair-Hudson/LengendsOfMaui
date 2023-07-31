using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class WeaponHandler : MonoBehaviour
    {
        [SerializeField]
        private GameObject _weaponLogic = null;

        public void EnableWeapon()
        {
            _weaponLogic.SetActive(true);
        }

        public void DisableWeapon()
        {
            _weaponLogic.SetActive(false);
        }
    }
}
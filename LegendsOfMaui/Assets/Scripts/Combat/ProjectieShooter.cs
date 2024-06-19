using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class ProjectieShooter : MonoBehaviour
    {
        [SerializeField]
        private Projectile projectilePrefab = null;
        [SerializeField]
        private float projectileDamage = 50f;
        [SerializeField]
        private float projectileSpeed = 10f;

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<WeaponDamage>(out WeaponDamage weaponDamage))
            {
                return;
            }
            if (!weaponDamage.enabled)
            {
                return;
            }
            Debug.Log("Shooting projectile");                                                       
            var direction = other.transform.position - transform.position;
            var projectileInstance = Instantiate(projectilePrefab, GetComponent<Collider>().bounds.center, Quaternion.Euler(direction.normalized));
            projectileInstance.SetProjectile(GetComponent<Collider>(), projectileDamage, projectileSpeed);
            Destroy(gameObject);
        }
    }
}
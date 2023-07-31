using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class WeaponDamage : MonoBehaviour
    {
        [SerializeField]
        private Collider _playerCollider = null;

        private List<Collider> _collidedWith = new List<Collider>();

        public float BaseDamage { get; set; } = 0;

        private void OnEnable()
        {
            _collidedWith.Clear();
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other == _playerCollider)
            {
                return;
            }

            if (_collidedWith.Contains(other))
            {
                return;
            }

            _collidedWith.Add(other);

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(BaseDamage);
            }
        }
    }
}
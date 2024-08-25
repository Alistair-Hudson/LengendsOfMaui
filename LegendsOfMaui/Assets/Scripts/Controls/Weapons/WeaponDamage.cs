using AlictronicGames.LegendsOfMaui.Utils;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    [RequireComponent(typeof(AudioSource))]
    public class WeaponDamage : MonoBehaviour
    {
        [SerializeField]
        private Collider _characterCollider = null;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

        private List<Collider> _collidedWith = new List<Collider>();

        private AudioSource _weaponCollisionAudio = null;
        private float _damage = 0;
        private float _knockBack = 0;

        private void Awake()
        {
            _weaponCollisionAudio = GetComponent<AudioSource>();
        }

        private void OnEnable()
        {
            _collidedWith.Clear();
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other == _characterCollider)
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
                Debug.Log($"{name}: dealing {_damage} damage to {health.name}");
                health.DealDamage(_damage, _attackType);
                _weaponCollisionAudio.Play();
            }
            if (other.TryGetComponent<ForceReceiver>(out var forceReceiver))
            {
                var direction = other.transform.position - _characterCollider.transform.position;
                forceReceiver.AddForce(direction.normalized * _knockBack);
            }
        }

        public void SetAttack(float damage, float knockback)
        {
            Debug.Log($"{name} is set to deal {damage} damage and {knockback} knockback");
            _damage = damage;
            _knockBack = knockback;
        }
    }
}
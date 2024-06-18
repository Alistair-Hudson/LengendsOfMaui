using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Projectile : MonoBehaviour
    {
        [SerializeField]
        private float _lifeTime = 10;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

        private Collider _userCollider = null;
        private float _damage = 0f;

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(_lifeTime);
            Destroy(gameObject);
        }

        private void OnTriggerEnter(Collider other)
        {
            //Targeter is checked for because it uses a Collider to find targets
            if (other == _userCollider || other.TryGetComponent<Targeter>(out var targeter))
            {
                return;
            }

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damage, _attackType);
            }
        }

        public void SetProjectile(Collider userCollider, float damage, float velocity)
        {
            _userCollider = userCollider;
            _damage = damage;
            GetComponent<Rigidbody>().velocity = transform.forward * velocity;
        }
    }
}
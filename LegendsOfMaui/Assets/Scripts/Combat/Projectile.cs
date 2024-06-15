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
            if (other == _userCollider || other.TryGetComponent<Targeter>(out var targeter))
            {
                return;
            }
            Debug.Log(other.gameObject.name);
            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damage, _attackType);
            }
            Destroy(gameObject);
        }

        public void SetProjectile(Collider userCollider, float damage)
        {
            _userCollider = userCollider;
            _damage = damage;
        }
    }
}
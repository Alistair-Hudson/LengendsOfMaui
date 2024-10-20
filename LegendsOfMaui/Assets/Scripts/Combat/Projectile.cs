using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Projectile : MonoBehaviour
    {
        [SerializeField]
        private bool _destoryAfterDamage = true;
        [SerializeField]
        private float _lifeTime = 10;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

        private Collider _userCollider = null;
        private float _damage = 0f;
        private float _impactForce = 0f;

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(_lifeTime);
            Destroy(gameObject);
        }

        private void OnTriggerEnter(Collider other)
        {
            //Targeter is checked for because it uses a Collider to find targets
            if (other == _userCollider || other.TryGetComponent<Targeter>(out var targeter) 
                || other.TryGetComponent<EnemyActivationControl>(out var activationCaller))
            {
                return;
            }

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damage, _attackType, _impactForce);

                if (_destoryAfterDamage)
                {
                    Destroy(gameObject);
                }
            }
        }

        public void SetProjectile(Collider userCollider, float damage, float impactForce, float velocity)
        {
            _userCollider = userCollider;
            _damage = damage;
            _impactForce = impactForce;
            GetComponent<Rigidbody>().velocity = transform.forward * velocity;
        }
    }
}
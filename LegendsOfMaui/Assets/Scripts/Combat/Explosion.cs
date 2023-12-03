using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Explosion : MonoBehaviour
    {
        [SerializeField]
        private float _lifeTime = 10;
        [SerializeField]
        private float _expansionRatePerSecond = 1f;

        private Collider _userCollider = null;
        private SphereCollider _explosionCollider;
        private float _damage = 0f;

        private void Awake()
        {
            _explosionCollider = GetComponent<SphereCollider>();
            ParticleSystem[] particleSystems = GetComponentsInChildren<ParticleSystem>();
            foreach (var system in particleSystems)
            {
                var main = system.main;
                main.startLifetime = _lifeTime;
            }
        }

        private IEnumerator Start()
        {
            yield return new WaitForSeconds(_lifeTime);
            Destroy(gameObject);
        }

        private void Update()
        {
            _explosionCollider.radius += _expansionRatePerSecond * Time.deltaTime;
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other == _userCollider)
            {
                return;
            }

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damage);
            }
        }

        public void SetExplosion(Collider userCollider, float damage)
        {
            _userCollider = userCollider;
            _damage = damage;
        }
    }
}
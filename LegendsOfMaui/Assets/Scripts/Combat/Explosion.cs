using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Explosion : MonoBehaviour
    {
        [SerializeField] private Transform explosionVisuals = null;
        [SerializeField]
        private float _lifeTime = 10;
        [SerializeField]
        private float _expansionRatePerSecond = 1f;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

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
            float expansionIncrease = _expansionRatePerSecond * Time.deltaTime;
            _explosionCollider.radius += expansionIncrease;
            explosionVisuals.localScale += Vector3.one * (expansionIncrease * 2);//the 2 is to ensure the mesh expands at the same rate as the collider
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other == _userCollider)
            {
                return;
            }

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damage, _attackType);
            }
        }

        public void SetExplosion(Collider userCollider, float damage)
        {
            _userCollider = userCollider;
            _damage = damage;
        }
    }
}
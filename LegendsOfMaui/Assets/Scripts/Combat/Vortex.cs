using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class Vortex : MonoBehaviour
    {
        [SerializeField]
        private float _lifeTime = 10;
        [SerializeField]
        private float _speedPerSec = 2;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

        private Collider _userCollider = null;
        private NavMeshAgent _navMeshAgent = null;
        private PlayerStateMachine _playerStateMachine = null;
        private float _damagePerSecond = 0f;

        private void Awake()
        {
            _playerStateMachine = FindAnyObjectByType<PlayerStateMachine>();
            _navMeshAgent = GetComponent<NavMeshAgent>();
        }

        private IEnumerator Start()
        {

            yield return new WaitForSeconds(_lifeTime);
            Destroy(gameObject);
        }

        private void Update()
        {
            Vector3.MoveTowards(transform.position, _playerStateMachine.transform.position, _speedPerSec * Time.deltaTime);
        }

        private void OnTriggerStay(Collider other)
        {
            if (other == _userCollider)
            {
                return;
            }

            if (other.TryGetComponent<Health>(out var health))
            {
                health.DealDamage(_damagePerSecond * Time.deltaTime, _attackType, false);
            }
        }

        public void SetVortex(Collider userCollider, float damage)
        {
            _userCollider = userCollider;
            _damagePerSecond = damage;
        }
    }
}
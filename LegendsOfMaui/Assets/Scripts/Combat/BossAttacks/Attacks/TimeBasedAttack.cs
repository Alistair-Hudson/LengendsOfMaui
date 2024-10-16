using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "TimedBasedAttack", menuName = "Boss Attacks/Timed Based Attack", order = 0)]
    public class TimeBasedAttack : ScriptableObject, IBossAttack
    {
        [SerializeField]
        private float _timeBetweenAttacks = 3;
        [Header("Attack Data")]
        [SerializeField]
        private string _attackName = "";
        [SerializeField]
        private float _attackDamage = 0;
        [SerializeField]
        private float _knockBackForce = 0;
        [SerializeField]
        private AttackType _attackType = AttackType.None;

        private BossStateMachine _stateMachine = null;
        private Coroutine _attackTimer = null;
        private PlayerStateMachine _player = null;

        public string AttackName => _attackName;
        public float AttackDamage => _attackDamage;
        public float KnockBackForce => _knockBackForce;
        public AttackType AttackType => _attackType;

        public void InitializeAttackPattern(BossStateMachine bossStateMachine)
        {
            _stateMachine = bossStateMachine;
            _stateMachine.Health.OnDeath.AddListener(HandleOnDeath);
            _attackTimer = _stateMachine.StartCoroutine(AttackTimer());
            _player = FindFirstObjectByType<PlayerStateMachine>();
        }

        private IEnumerator AttackTimer()
        {
            yield return new WaitForSeconds(_timeBetweenAttacks);
            _stateMachine.BossAttackQueue.Enqueue(this);
        }

        private void HandleOnDeath()
        {
            if (_attackTimer != null)
            {
                _stateMachine.StopCoroutine(_attackTimer);
            }
        }

        public void InitiateAttack()
        {
            _stateMachine.SwitchState(new BossAttackState(_stateMachine, _attackName));
            _attackTimer = _stateMachine.StartCoroutine(AttackTimer());
        }
    }
}
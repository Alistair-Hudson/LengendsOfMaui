using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "EventBasedAttack", menuName = "Boss Attacks/Event Based Attack", order = 0)]
    public class EventBasedAttack : ScriptableObject, IBossAttack
    {
        [SerializeField]
        private float _delayBeforeAttack = 3;
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
        private PlayerStateMachine _player = null;
        private List<Coroutine> _attackTimers;

        public string AttackName => _attackName;
        public float AttackDamage => _attackDamage;
        public float KnockBackForce => _knockBackForce;
        public AttackType AttackType => _attackType;

        public void InitializeAttackPattern(BossStateMachine bossStateMachine)
        {
            _stateMachine = bossStateMachine;
            _stateMachine.Health.OnDeath.AddListener(HandleOnDeath);
            _attackTimers = new List<Coroutine>();
        }

        private void HandleOnDeath()
        {
            foreach (var attackTimer in _attackTimers)
            {
                _stateMachine.StopCoroutine(attackTimer);
            }
        }

        public void AddAttack()
        {
            _attackTimers.Add(_stateMachine.StartCoroutine(AttackTimer()));
        }

        private IEnumerator AttackTimer()
        {
            yield return new WaitForSeconds(_delayBeforeAttack);
            yield return new WaitUntil(() => _stateMachine.CurrentState is BossIdleState);
            PerformAttack();
        }

        private void PerformAttack()
        {
            _stateMachine.SwitchState(new BossAttackState(_stateMachine, _attackName));
        }
    }
}
using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class AllEnemyDeathTrigger : MonoBehaviour
    {
        List<EnemyStateMachine> _enemyStateMachines = new List<EnemyStateMachine>();
        List<BossStateMachine> _bossStateMachines = new List<BossStateMachine>();

        private void Awake()
        {
            _enemyStateMachines = FindObjectsByType<EnemyStateMachine>(FindObjectsSortMode.None).ToList();
            _bossStateMachines = FindObjectsByType<BossStateMachine>(FindObjectsSortMode.None).ToList();

            foreach (var enemy in _enemyStateMachines)
            {
                enemy.OnDeathEvent += OnEnemyDeathHandle;
            }

            foreach (var boss in _bossStateMachines)
            {
                boss.OnDeathEvent += OnBossDeathHandle;
            }

            gameObject.SetActive(false);
        }

        private void OnEnemyDeathHandle(EnemyStateMachine stateMachine)
        {
            stateMachine.OnDeathEvent -= OnEnemyDeathHandle;
            _enemyStateMachines.Remove(stateMachine);

            CheckAndActivateTrigger();
        }

        private void OnBossDeathHandle(BossStateMachine stateMachine)
        {
            stateMachine.OnDeathEvent -= OnBossDeathHandle;
            _bossStateMachines.Remove(stateMachine);

            CheckAndActivateTrigger();
        }

        private void CheckAndActivateTrigger()
        {
            if (_enemyStateMachines.Count <= 0 && _bossStateMachines.Count <= 0)
            {
                gameObject.SetActive(true);
            }
        }
    }
}
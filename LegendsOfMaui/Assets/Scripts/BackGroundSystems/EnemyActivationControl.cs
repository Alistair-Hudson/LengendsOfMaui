using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class EnemyActivationControl : MonoBehaviour
    {
        private void Awake()
        {
            GetComponent<SphereCollider>().radius = Camera.main.farClipPlane;
        }

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<EnemyStateMachine>(out var enemy))
            {
                return;
            }
            SetModelState(true, enemy);
        }

        private void OnTriggerExit(Collider other)
        {
            if (!other.TryGetComponent<EnemyStateMachine>(out var enemy))
            {
                return;
            }
            SetModelState(false, enemy);
        }

        private void SetModelState(bool state, EnemyStateMachine enemy)
        {
            enemy.Animator.gameObject.SetActive(state);
            enemy.enabled = state;
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using AlictronicGames.LegendsOfMaui.Utils;
using Sirenix.OdinInspector;
using Sirenix.Serialization;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Weapons
{
    public class TransformAttackCaller : SerializedMonoBehaviour
    {
        [OdinSerialize]
        private Dictionary<string, GameObject> _transformPrefabs = new Dictionary<string, GameObject>();

        private PlayerStateMachine _stateMachine = null;

        private void Awake()
        {
            _stateMachine = GetComponent<PlayerStateMachine>();
        }

        public void CallTransform(string transformName)
        {
            GameObject transformInstance =
                Instantiate(_transformPrefabs[transformName], transform.position, transform.rotation, transform);
            _stateMachine.MauiForms[MauiForms.Human].SetActive(false);
        }

        public void UndoTransform(GameObject transformInstance)
        {
            _stateMachine.MauiForms[MauiForms.Human].SetActive(true);
            _stateMachine.SwitchState(new PlayerFreeLookState(_stateMachine));
            GameObject.Destroy(transformInstance);
        }
    }
}
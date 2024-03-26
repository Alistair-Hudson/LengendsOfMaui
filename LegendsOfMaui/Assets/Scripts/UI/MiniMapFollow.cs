using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class MiniMapFollow : MonoBehaviour
    {
        private Transform _player = null;

        private void Awake()
        {
            _player = FindFirstObjectByType<PlayerStateMachine>().transform;
        }

        void Update()
        {
            transform.position = _player.position;
        }
    }
}
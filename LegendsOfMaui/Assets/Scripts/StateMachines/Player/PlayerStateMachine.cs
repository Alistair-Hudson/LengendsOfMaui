using AlictronicGames.LegendsOfMaui.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    [RequireComponent(typeof(InputReader))]
    public class PlayerStateMachine : StateMachine
    {
        public InputReader InputReader { get; private set; } = null;

        private void Awake()
        {
            InputReader = GetComponent<InputReader>();
        }

        private void Start()
        {
            InputReader.JumpEvent += HandleOnJump;
            InputReader.DodgeEvent += HandleOnDodge;
        }

        private void OnDestroy()
        {
            InputReader.JumpEvent -= HandleOnJump;
            InputReader.DodgeEvent -= HandleOnDodge;
        }

        private void HandleOnDodge()
        {
            SwitchState(new PlayerDodgeState(this));
        }

        private void HandleOnJump()
        {
            SwitchState(new PlayerJumpState(this));
        }
    }
}
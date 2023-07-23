using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

namespace AlictronicGames.LegendsOfMaui.Controls
{
    public class InputReader : MonoBehaviour, Controls.IPlayerActions
    {
        private Controls _controls = null;

        public event Action JumpEvent;
        public event Action DodgeEvent;

        private void Start()
        {
            _controls = new Controls();
            _controls.Player.SetCallbacks(this);

            _controls.Player.Enable();
        }

        private void OnDestroy()
        {
            _controls.Player.Disable();
        }

        public void OnJump(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                JumpEvent?.Invoke();
            }
        }

        public void OnDodge(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                DodgeEvent?.Invoke();
            }
        }
    }
}
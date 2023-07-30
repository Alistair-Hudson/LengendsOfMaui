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

        public Vector2 MovementValue { get; private set; } = Vector2.zero;

        public event Action JumpEvent;
        public event Action DodgeEvent;
        public event Action TargetEvent;
        public event Action CancelTargetEvent;

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

        public void OnMovement(InputAction.CallbackContext context)
        {
            MovementValue = context.ReadValue<Vector2>();
        }

        public void OnLook(InputAction.CallbackContext context)
        {
            
        }

        public void OnTarget(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                TargetEvent?.Invoke();
            }
        }

        public void OnCancelTarget(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                CancelTargetEvent?.Invoke();
            }
        }
    }
}
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
        public bool IsAttacking { get; private set; } = false;
        public bool IsBlocking { get; private set; } = false;

        public event Action JumpEvent;
        public event Action DodgeEvent;
        public event Action TargetEvent;
        public event Action SwapWeapon;
        public event Action ShapeShift;
        public event Action PerformAction;
        public event Action OpenCloseProgressMenu;

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

        public void OnAttack(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                IsAttacking = true;
            }
            else if (context.canceled)
            {
                IsAttacking = false;
            }
        }

        public void OnBlock(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                IsBlocking = true;
            }
            else if (context.canceled)
            {
                IsBlocking = false;
            }
        }

        public void OnSwapWeapon(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                SwapWeapon?.Invoke();
            }
        }

        public void OnTransform(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                ShapeShift?.Invoke();
            }
        }

        public void OnAction(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                PerformAction?.Invoke();
            }
        }

        public void OnOpenProgressMenu(InputAction.CallbackContext context)
        {
            if (context.performed)
            {
                OpenCloseProgressMenu?.Invoke();
            }
        }
    }
}
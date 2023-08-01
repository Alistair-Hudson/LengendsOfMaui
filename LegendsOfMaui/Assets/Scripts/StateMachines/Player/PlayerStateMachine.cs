using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    [RequireComponent(typeof(InputReader), typeof(CharacterController), typeof(ForceReceiver))]
    [RequireComponent(typeof(Health))]
    public class PlayerStateMachine : StateMachine
    {
        [field: SerializeField]
        public float FreeLookMoveSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float TargetingMoveSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public AttackData[] Attacks { get; private set; }

        private Health _health = null;

        public InputReader InputReader { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public Animator Animator { get; private set; } = null;
        public Transform MainCameraTransform { get; private set; } = null;
        public Targeter Targeter { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public WeaponDamage WeaponDamage { get; private set; } = null;

        private void Awake()
        {
            InputReader = GetComponent<InputReader>();
            CharacterController = GetComponent<CharacterController>();
            ForceReceiver = GetComponent<ForceReceiver>();
            _health = GetComponent<Health>();

            Animator = GetComponentInChildren<Animator>();
            Targeter = GetComponentInChildren<Targeter>();
            WeaponDamage = GetComponentInChildren<WeaponDamage>(true);
        }

        private void Start()
        {
            MainCameraTransform = Camera.main.transform;

            InputReader.JumpEvent += HandleOnJump;
            InputReader.DodgeEvent += HandleOnDodge;

            SwitchState(new PlayerFreeLookState(this));
        }

        private void OnDestroy()
        {
            InputReader.JumpEvent -= HandleOnJump;
            InputReader.DodgeEvent -= HandleOnDodge;
        }

        private void OnEnable()
        {
            _health.OnTakeDamage += HandleOnTakeDamage;
        }

        private void OnDisable()
        {
            _health.OnTakeDamage -= HandleOnTakeDamage;
        }

        private void HandleOnTakeDamage()
        {
            SwitchState(new PlayerImapctState(this));
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
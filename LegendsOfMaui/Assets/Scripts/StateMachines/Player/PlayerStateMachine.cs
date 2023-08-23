using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.Utils;
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
        private enum WeaponType
        {
            Mere = 0,
            Taiaha
        }

        [SerializeField]
        private AnimatorOverrideController _mereController = null;
        [SerializeField]
        private AnimatorOverrideController _taiahaController = null;

        [field: SerializeField]
        public float FreeLookMoveSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float TargetingMoveSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float HangingSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float DodgeDuration { get; private set; } = 0f;
        [field: SerializeField]
        public float DodgeDistance { get; private set; } = 0f;
        [field: SerializeField]
        public float JumpForce { get; private set; } = 0f;
        [field: SerializeField]
        public Vector3 PullUpOffset { get; private set; } = Vector3.zero;
        [field: SerializeField]
        public AttackData[] Attacks { get; private set; }

        private WeaponType _activeWeapon = WeaponType.Mere;

        public Health Health { get; private set; } = null;
        public InputReader InputReader { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public Animator Animator { get; private set; } = null;
        public Transform MainCameraTransform { get; private set; } = null;
        public Targeter Targeter { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public WeaponDamage WeaponDamage { get; private set; } = null;
        public LedgeDetector LedgeDetector { get; private set; } = null;
        public float PreviousDodgeTime { get; private set; } = Mathf.NegativeInfinity;

        #region UnityMethods
        private void Awake()
        {
            InputReader = GetComponent<InputReader>();
            CharacterController = GetComponent<CharacterController>();
            ForceReceiver = GetComponent<ForceReceiver>();
            Health = GetComponent<Health>();

            Animator = GetComponentInChildren<Animator>();
            Targeter = GetComponentInChildren<Targeter>();
            WeaponDamage = GetComponentInChildren<WeaponDamage>(true);
            LedgeDetector = GetComponentInChildren<LedgeDetector>();
        }

        private void Start()
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;

            MainCameraTransform = Camera.main.transform;

            InputReader.JumpEvent += HandleOnJump;
            InputReader.DodgeEvent += HandleOnDodge;
            InputReader.SwapWeapon += HandleWeaponSwap;

            Animator.runtimeAnimatorController = _mereController;

            SwitchState(new PlayerFreeLookState(this));
        }

        private void OnDestroy()
        {
            InputReader.JumpEvent -= HandleOnJump;
            InputReader.DodgeEvent -= HandleOnDodge;
            InputReader.SwapWeapon -= HandleWeaponSwap;
        }

        private void OnEnable()
        {
            Health.OnTakeDamage += HandleOnTakeDamage;
            Health.OnDeath += HandleOnDeath;
        }

        private void OnDisable()
        {
            Health.OnTakeDamage -= HandleOnTakeDamage;
            Health.OnDeath -= HandleOnDeath;
        }
        #endregion

        #region EventHandlers
        private void HandleOnDeath()
        {
            SwitchState(new PlayerDeathState(this));
        }

        private void HandleOnTakeDamage()
        {
            SwitchState(new PlayerImapctState(this));
        }

        private void HandleWeaponSwap()
        {
            switch (_activeWeapon)
            {
                case WeaponType.Mere:
                    SwapWeapon(WeaponType.Taiaha, _taiahaController);
                    break;
                case WeaponType.Taiaha:
                    SwapWeapon(WeaponType.Mere, _mereController);
                    break;
            }
        }

        private void SwapWeapon(WeaponType nextWeaponType, AnimatorOverrideController nextOverrideController)
        {
            _activeWeapon = nextWeaponType;
            Animator.runtimeAnimatorController = nextOverrideController;
        }

        private void HandleOnDodge()
        {
            //SwitchState(new PlayerDodgeState(this));
        }

        private void HandleOnJump()
        {
            //SwitchState(new PlayerJumpState(this));
        }
        #endregion

        #region PublicMethods

        #endregion
    }
}
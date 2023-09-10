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
        private WeaponDamage _mereLogic = null;
        [SerializeField]
        private WeaponDamage _taiahaLogic = null;
        [SerializeField]
        private AnimatorOverrideController _mereController = null;
        [SerializeField]
        private AnimatorOverrideController _taiahaController = null;
        [SerializeField]
        private GameObject _humanForm = null;
        [SerializeField]
        private GameObject _birdForm = null;

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
        private WeaponHandler _weaponHandler = null;


        public Health Health { get; private set; } = null;
        public InputReader InputReader { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public Animator Animator { get; private set; } = null;
        public Transform MainCameraTransform { get; private set; } = null;
        public Targeter Targeter { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public WeaponDamage CurrentWeaponDamage { get; private set; } = null;
        public LedgeDetector LedgeDetector { get; private set; } = null;
        public float PreviousDodgeTime { get; private set; } = Mathf.NegativeInfinity;
        public bool IsShapeShifted { get; private set; } = false;

        #region UnityMethods
        private void Awake()
        {
            InputReader = GetComponent<InputReader>();
            CharacterController = GetComponent<CharacterController>();
            ForceReceiver = GetComponent<ForceReceiver>();
            Health = GetComponent<Health>();

            _weaponHandler = GetComponentInChildren<WeaponHandler>();
            Targeter = GetComponentInChildren<Targeter>();
            LedgeDetector = GetComponentInChildren<LedgeDetector>();
            Animator = _humanForm.GetComponent<Animator>();

            CurrentWeaponDamage = _mereLogic;
        }

        private void Start()
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;

            MainCameraTransform = Camera.main.transform;

            InputReader.JumpEvent += HandleOnJump;
            InputReader.DodgeEvent += HandleOnDodge;
            InputReader.SwapWeapon += HandleWeaponSwap;
            InputReader.ShapeShift += HandleShapeShift;
            InputReader.PerformAction += HandlePerformAction;

            Animator.runtimeAnimatorController = _mereController;

            SwitchState(new PlayerFreeLookState(this));
        }

        private void OnDestroy()
        {
            InputReader.JumpEvent -= HandleOnJump;
            InputReader.DodgeEvent -= HandleOnDodge;
            InputReader.SwapWeapon -= HandleWeaponSwap;
            InputReader.ShapeShift += HandleShapeShift;
            InputReader.PerformAction += HandlePerformAction;
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

        private void HandleOnTakeDamage(float maxHealth, float currentHealth)
        {
            SwitchState(new PlayerImapctState(this));
        }

        private void HandleWeaponSwap()
        {
            if (IsShapeShifted)
            {
                return;
            }

            switch (_activeWeapon)
            {
                case WeaponType.Mere:
                    SwapWeapon(WeaponType.Taiaha, _taiahaController, _taiahaLogic);
                    break;
                case WeaponType.Taiaha:
                    SwapWeapon(WeaponType.Mere, _mereController, _mereLogic);
                    break;
            }
        }

        private void HandleOnDodge()
        {
            //SwitchState(new PlayerDodgeState(this));
        }

        private void HandleOnJump()
        {
            //SwitchState(new PlayerJumpState(this));
        }

        private void HandleShapeShift()
        {
            IsShapeShifted ^= true;
            _humanForm.SetActive(!IsShapeShifted);
            _birdForm.SetActive(IsShapeShifted);
            if (IsShapeShifted)
            {
                Animator = _birdForm.GetComponent<Animator>();
            }
            else
            {
                Animator = _humanForm.GetComponent<Animator>();
            }
        }

        private void HandlePerformAction()
        {

        }
        #endregion

        #region PrivateMethods
        private void SwapWeapon(WeaponType nextWeaponType, AnimatorOverrideController nextOverrideController, WeaponDamage weaponLogic)
        {
            _activeWeapon = nextWeaponType;
            Animator.runtimeAnimatorController = nextOverrideController;
            _weaponHandler.SetWeaponLogic(weaponLogic);
            CurrentWeaponDamage = weaponLogic;
        }

        private void ShapeShift()
        {

        }
        #endregion

        #region PublicMethods
        public void AddAttack(AttackData newAttack)
        {
            var oldAttacks = Attacks;
            Attacks = new AttackData[Attacks.Length + 1];
            for (int i = 0; i < oldAttacks.Length; i++)
            {
                Attacks[i] = oldAttacks[i];
            }
            Attacks[oldAttacks.Length] = newAttack;
        }
        #endregion
    }
}
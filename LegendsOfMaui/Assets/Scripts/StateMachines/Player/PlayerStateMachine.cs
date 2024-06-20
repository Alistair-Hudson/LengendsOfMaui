using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.Stats;
using AlictronicGames.LegendsOfMaui.Utils;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    [RequireComponent(typeof(InputReader), typeof(CharacterController), typeof(ForceReceiver))]
    [RequireComponent(typeof(Health))]
    public class PlayerStateMachine : StateMachine
    {
        [SerializeField]
        private GameObject _humanForm = null;
        [SerializeField]
        private GameObject _birdForm = null;
        [SerializeField]
        private List<AttackData> _attacks = new List<AttackData>();

        [field: SerializeField]
        public GameObject DeathWindow { get; private set; } = null;
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
        public TMP_Text PressToIntreract { get; private set; } = null;

        private WeaponHandler _weaponHandler = null;
        private Transform _mainCameraTransform = null;

        public Health Health { get; private set; } = null;
        public InputReader InputReader { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public Animator Animator { get; private set; } = null;
        public Targeter Targeter { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public WeaponDamage WeaponDamage { get; private set; } = null;
        public LedgeDetector LedgeDetector { get; private set; } = null;
        public float PreviousDodgeTime { get; private set; } = Mathf.NegativeInfinity;
        public float AdditionalAttackDamage { get; private set; } = 0;
        public float DodgeDurationModifier { get; private set; } = 0;
        public float DodgeDistanceModifier { get; private set; } = 0;
        public int Level {
            get
            {
                return GetComponent<PlayerManaProgression>().Level;
            }
        }
        public bool IsShapeShifted { get; private set; } = false;

        public event Action InteractCall;

        public Transform MainCameraTransform
        {
            get
            {
                if (!_mainCameraTransform)
                {
                    _mainCameraTransform = Camera.main.transform;
                }
                return _mainCameraTransform;
            }
            private set
            {
                _mainCameraTransform = value;
            }
        }

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
            WeaponDamage = GetComponentInChildren<WeaponDamage>(true);
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
            Health.OnDeath.AddListener(HandleOnDeath);
        }

        private void OnDisable()
        {
            Health.OnTakeDamage -= HandleOnTakeDamage;
            Health.OnDeath.RemoveListener(HandleOnDeath);
        }
        #endregion

        #region EventHandlers
        private void HandleOnDeath()
        {
            SwitchState(new PlayerDeathState(this));
        }

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, bool causesImpact)
        {
            if (causesImpact)
            {
                SwitchState(new PlayerImapctState(this));
            }
        }

        private void HandleWeaponSwap()
        {
            if (IsShapeShifted)
            {
                return;
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
            if (Health.IsDead)
            {
                return;
            }

            if (_birdForm == null || _humanForm == null)
            {
                return;
            }

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
                SwitchState(new PlayerFallingState(this));
            }
        }

        private void HandlePerformAction()
        {
            InteractCall?.Invoke();
        }
        #endregion

        #region PrivateMethods
        
        #endregion

        #region PublicMethods

        public AttackData GetAttackAtIndex(int index)
        {
            return _attacks[index];
        }

        public void AddAttack(AttackData newAttack)
        {
            _attacks.Add(newAttack);
        }

        public int GetNumberOfAttacks()
        {
            return _attacks.Count;
        }

        public void IncreaseAdditionalAttackDamage(float damageIncrease)
        {
            AdditionalAttackDamage += damageIncrease;
        }

        public void MoveToLocation(Vector3 newLocation)
        {
            transform.position = newLocation;
        }
        #endregion
    }
}
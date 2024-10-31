using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.Utils;
using System;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Stats;
using Sirenix.Serialization;
using TMPro;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    [RequireComponent(typeof(InputReader), typeof(CharacterController), typeof(ForceReceiver))]
    [RequireComponent(typeof(Health))]
    public class PlayerStateMachine : StateMachine
    {
        [SerializeField]
        private string _name = "";
        [OdinSerialize]
        private Dictionary<MauiForms, GameObject> _mauiForms = new Dictionary<MauiForms, GameObject>();
        [OdinSerialize]
        private Dictionary<string, AudioClip> _playerSoundBank = new Dictionary<string, AudioClip>();

        [SerializeField] 
        private WeaponDamage _weaponDamage = null;

        [Header("Basic Attacks")]
        [SerializeField]
        private FastAttack _baicFastAttack = null;
        [SerializeField]
        private HeavyAttack _basicHeavyAttack = null;

        [field: Space] 
        [field: SerializeField] 
        public PlayerStats PlayerStats { get; private set; } = null;
        [field: SerializeField]
        public GameObject DeathWindow { get; private set; } = null;
        [field: SerializeField]
        public float HangingSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public Vector3 PullUpOffset { get; private set; } = Vector3.zero;
        [field: SerializeField]
        public MauiForms CurrentForm { get; set; } = Utils.MauiForms.Human;
        [field: SerializeField]
        public TMP_Text PressToIntreract { get; private set; } = null;

        private WeaponHandler _weaponHandler = null;
        private Transform _mainCameraTransform = null;
        private AudioSource _audioSource = null;

        public override string Name => _name;
        public ParticleSystem TransformParticleSystem { get; private set; } = null;
        public FastAttack BasicFastAttack => _baicFastAttack;
        public HeavyAttack BasicHeavyAttack => _basicHeavyAttack;
        public Health Health { get; private set; } = null;
        public InputReader InputReader { get; private set; } = null;
        public CharacterController CharacterController { get; private set; } = null;
        public Animator Animator { get; set; } = null;
        public override AudioSource AudioSource => _audioSource;
        public Targeter Targeter { get; private set; } = null;
        public ForceReceiver ForceReceiver { get; private set; } = null;
        public WeaponDamage WeaponDamage => _weaponDamage;
        public LedgeDetector LedgeDetector { get; private set; } = null;
        public Dictionary<MauiForms, GameObject> MauiForms => _mauiForms;
        public Dictionary<string, AudioClip> PlayerSoundBank => _playerSoundBank;
        public float PreviousDodgeTime { get; private set; } = Mathf.NegativeInfinity;
        public float AdditionalAttackDamage { get; private set; } = 0;
        public float DodgeDurationModifier { get; private set; } = 0;
        public float DodgeDistanceModifier { get; private set; } = 0;
        public bool IsChainAttackReady { get; set; } = false;

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
            Animator = GetComponent<Animator>();
            _audioSource = GetComponent<AudioSource>();
            TransformParticleSystem = GetComponentInChildren<ParticleSystem>();
        }

        private void Start()
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;

            MainCameraTransform = Camera.main.transform;

            InputReader.JumpEvent += HandleOnJump;
            InputReader.DodgeEvent += HandleOnDodge;
            InputReader.ShapeShift += HandleShapeShift;
            InputReader.PerformAction += HandlePerformAction;

            Health.SetMaxHealth(PlayerStats.MaxHealth);
            Health.SetHealthRegen(PlayerStats.HealthRegen);

            SwitchState(new PlayerFreeLookState(this));
        }

        private void OnDestroy()
        {
            InputReader.JumpEvent -= HandleOnJump;
            InputReader.DodgeEvent -= HandleOnDodge;
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

        private void HandleOnTakeDamage(float maxHealth, float currentHealth, float force)
        {
            if (force > PlayerStats.FlinchThreshold)
            {
                SwitchState(new PlayerImapctState(this));
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

            if (_mauiForms.Count <= 0)
            {
                return;
            }

            TransformParticleSystem.Play();
            switch (CurrentForm)
            {
                case Utils.MauiForms.Human:
                    SwitchToNextForm(Utils.MauiForms.Pigeon);
                    break;
                case Utils.MauiForms.Pigeon:
                    SwitchToNextForm(Utils.MauiForms.Human);
                    break;
                default:
                    new IndexOutOfRangeException();
                    break;
            }
        }

        private void HandlePerformAction()
        {
            InteractCall?.Invoke();
        }
        #endregion

        #region PrivateMethods
        private void SwitchToNextForm(MauiForms nextForm)
        {
            foreach (var form in MauiForms.Values)
            {
                form.SetActive(false);
            }

            MauiForms[nextForm].SetActive(true);
            Animator.enabled = false;
            Animator = nextForm == Utils.MauiForms.Human ? GetComponent<Animator>() : MauiForms[nextForm].GetComponent<Animator>();
            Animator.enabled = true;
            CurrentForm = nextForm;
        }
        #endregion

        #region PublicMethods
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
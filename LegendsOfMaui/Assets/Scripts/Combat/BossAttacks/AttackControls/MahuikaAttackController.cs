using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.StateMachines.Enemy;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.XR;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public sealed class MahuikaAttackController : BossAttackController
    {
        [Header("Pyroball")]
        [SerializeField] 
        private Projectile _pyroBallPrefab = null;
        [SerializeField]
        private float _pyroBallSpeed = 1f;
        [SerializeField]
        private float _pyroBallForce = 1f;
        [SerializeField]
        private AudioClip _pyroBallSound = null;
        [SerializeField]
        private Transform _leftHand = null;
        [SerializeField]
        private Transform _rightHand = null;

        [Space]
        [Header("Pyro Pillar")]
        [SerializeField]
        private GameObject _pyroPillarPrefab = null;
        [SerializeField]
        private AudioClip _pyroPillarSound = null;

        [Space]
        [Header("Flame Wave")]
        [SerializeField]
        private GameObject _flameWavePrefab = null;
        [SerializeField]
        private AudioClip _flameWaveSound = null;

        [Space]
        [Header("Fire Spirits")]
        [SerializeField]
        private Queue<EnemyStateMachine> _fireSpirits = new Queue<EnemyStateMachine>();

        private AudioSource _audioSource = null;
        private PlayerStateMachine _player = null;

        private void Awake()
        {
            _audioSource = GetComponentInParent<AudioSource>(true);
            _player = FindAnyObjectByType<PlayerStateMachine>();
        }

        public void CallLeftPyroBall()
        {
            SpawnPyroball(_leftHand);
        }

        public void CallRightPyroBall()
        {
            SpawnPyroball(_rightHand);
        }

        public void CallPyroPillar()
        {
            GameObject pyroPillarInstance = Instantiate(_pyroPillarPrefab, _player.transform.position, Quaternion.identity);
            pyroPillarInstance.transform.parent = transform.parent;
            _audioSource.PlayOneShot(_pyroPillarSound);
        }

        public void CallFlameWave()
        {
            GameObject flameWave = Instantiate(_flameWavePrefab, transform.parent);
            _audioSource.PlayOneShot(_flameWaveSound);
        }

        public void CallSummonFireSpirit()
        {
            if (!_fireSpirits.TryDequeue(out EnemyStateMachine fireSpirit))
            {
                return;
            }

            fireSpirit.enabled = true;
        }

        private void SpawnPyroball(Transform hand)
        {
            Projectile pyroballInstance = Instantiate(_pyroBallPrefab, hand.position, Quaternion.identity);
            Vector3 lookDir = _playerStateMachine.transform.position - pyroballInstance.transform.position;
            pyroballInstance.transform.rotation = Quaternion.LookRotation(lookDir);
            pyroballInstance.transform.parent = transform.parent;
            pyroballInstance.SetProjectile(_bossStateMachine.Collider, _bossStateMachine.TimeBasedAttacks[0].AttackDamage, _pyroBallSpeed, _pyroBallForce);
            _audioSource.PlayOneShot(_pyroBallSound);
        }
    }
}
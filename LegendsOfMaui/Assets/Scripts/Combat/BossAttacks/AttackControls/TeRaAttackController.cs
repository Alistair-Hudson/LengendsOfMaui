using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public sealed class TeRaAttackController : BossAttackController
    {
        [SerializeField]
        private Transform _attackSpawnpoint = null;
        [SerializeField]
        private GameObject _pyroBallPrefab = null;
        [SerializeField]
        private GameObject _flameVortexPrefab = null;
        [SerializeField]
        private GameObject _explossionPrefab = null;
        [SerializeField]
        private AudioClip _pyroBallSound = null;
        [SerializeField]
        private AudioClip _flameVortexSound = null;
        [SerializeField]
        private AudioClip _explossionSound = null;
        [SerializeField]
        private float _pyroBallSpeed = 1f;

        private AudioSource _audioSource = null;

        private void Awake()
        {
            _audioSource = GetComponentInParent<AudioSource>(true);
        }

        public void CallPyroBall()
        {
            var attackInstance = Instantiate(_pyroBallPrefab, _attackSpawnpoint.position, Quaternion.identity);
            Vector3 lookDir = _playerStateMachine.transform.position - attackInstance.transform.position;
            attackInstance.transform.rotation = Quaternion.LookRotation(lookDir);
            attackInstance.transform.parent = transform.parent;
            attackInstance.GetComponent<Projectile>().SetProjectile(_bossStateMachine.Collider, _bossStateMachine.TimeBasedAttacks[0].AttackDamage, _pyroBallSpeed);
            _audioSource.PlayOneShot(_pyroBallSound);
        }

        public void CallFlameVortex()
        {
            var attackInstance = Instantiate(_flameVortexPrefab, _playerStateMachine.transform.position, Quaternion.identity);
            attackInstance.GetComponent<Vortex>().SetVortex(_bossStateMachine.Collider, _bossStateMachine.TimeBasedAttacks[1].AttackDamage);
            _audioSource.PlayOneShot(_flameVortexSound);
        }

        public void CallExplosion()
        {
            var attackInstance = Instantiate(_explossionPrefab, transform.position, Quaternion.identity);
            attackInstance.GetComponent<Explosion>().SetExplosion(_bossStateMachine.Collider, _bossStateMachine.TimeBasedAttacks[2].AttackDamage);
            _audioSource.PlayOneShot(_explossionSound);
        }
    }
}
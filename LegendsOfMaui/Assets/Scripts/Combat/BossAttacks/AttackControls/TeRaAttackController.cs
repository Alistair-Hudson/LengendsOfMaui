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
        private GameObject _attack0Prefab = null;
        [SerializeField]
        private GameObject _attack1Prefab = null;
        [SerializeField]
        private GameObject _attack2Prefab = null;
        [SerializeField]
        private float _attack0Speed = 1f;
        [SerializeField]
        private float _attack1Speed = 1f;
        [SerializeField]
        private float _attack2Speed = 1f;

        public void CallPyroBall()
        {
            var attackInstance = Instantiate(_attack0Prefab, _attackSpawnpoint.position, Quaternion.identity);
            Vector3 lookDir = _playerStateMachine.transform.position - attackInstance.transform.position;
            attackInstance.transform.rotation = Quaternion.LookRotation(lookDir);
            attackInstance.transform.parent = transform.parent;
            attackInstance.GetComponent<Projectile>().SetProjectile(bossStateMachine.Collider, bossStateMachine.TimeBasedAttacks[0].AttackDamage, _attack0Speed);
        }

        public void CallFlameVortex()
        {
            var attackInstance = Instantiate(_attack1Prefab, _playerStateMachine.transform.position, Quaternion.identity);
            attackInstance.GetComponent<Vortex>().SetVortex(bossStateMachine.Collider, bossStateMachine.TimeBasedAttacks[1].AttackDamage);
        }

        public void CallExplosion()
        {
            var attackInstance = Instantiate(_attack2Prefab, transform.position, Quaternion.identity);
            attackInstance.GetComponent<Explosion>().SetExplosion(bossStateMachine.Collider, bossStateMachine.TimeBasedAttacks[2].AttackDamage);
        }
    }
}
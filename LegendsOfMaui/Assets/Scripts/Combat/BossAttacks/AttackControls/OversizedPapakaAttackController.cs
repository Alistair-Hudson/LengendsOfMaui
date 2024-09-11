using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public sealed class OversizedPapakaAttackController : BossAttackController
    {
        [SerializeField] 
        private WeaponDamage _leftClaw = null;
        [SerializeField] 
        private WeaponDamage _rightClaw = null;

        public void EnableLeftClaw()
        {
            SetClaw(_leftClaw);
        }

        public void EnableRightClaw()
        {
            SetClaw(_rightClaw);
        }

        public void DisableLeftClaw()
        {
            _leftClaw.enabled = false;
        }

        public void DisableRightClaw()
        {
            _rightClaw.enabled = false;
        }

        private void SetClaw(WeaponDamage claw)
        {
            IBossAttack attack = _bossStateMachine.CurrentAttack;
            claw.enabled = true;
            claw.SetAttack(attack.AttackDamage, attack.KnockBackForce);
        }
    }
}
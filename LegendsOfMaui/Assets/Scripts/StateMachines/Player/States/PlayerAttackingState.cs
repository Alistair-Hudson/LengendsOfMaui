using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerAttackingState : PlayerBaseState
    {
        private AttackData _attack = null;

        private bool _isForcedApplied = false;

        public PlayerAttackingState(PlayerStateMachine playerStateMachine, int attackIndex) : base(playerStateMachine)
        {
            _attack = playerStateMachine.Attacks[attackIndex];
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(_attack.AnimationName, _attack.TransitionDuration);
            stateMachine.CurrentWeaponDamage.SetAttack(_attack.AtackDamage, _attack.KnockbackForce);
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);
            FaceTarget();

            float normalizedTime = GetNormalizedTime(stateMachine.Animator, "Attack");

            if (normalizedTime > _attack.ForceTime)
            {
                TryApplyForce();
            }

            if (normalizedTime < 1)
            {
                if (stateMachine.InputReader.IsAttacking)
                {
                    TryComboAttack(normalizedTime);
                }
            }
            else
            {
                SwitchBackToLocmotion();
            }
        }

        private void TryComboAttack(float normalizedTime)
        {
            if (_attack.ComboStateIndex == -1)
            {
                return;
            }

            if (normalizedTime < _attack.ComboAttackTime)
            {
                return;
            }
            stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.ComboStateIndex));
        }

        private void TryApplyForce()
        {
            if (_isForcedApplied)
            {
                return;
            }
            stateMachine.ForceReceiver.AddForce(stateMachine.transform.forward * _attack.Force);
            _isForcedApplied = true;
        }
    }
}
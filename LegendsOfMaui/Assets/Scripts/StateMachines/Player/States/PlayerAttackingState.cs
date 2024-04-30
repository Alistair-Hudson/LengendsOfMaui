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
            _attack = playerStateMachine.GetAttackAtIndex(attackIndex);
        }

        #region StateMachine
        public override void Enter()
        {
            stateMachine.transform.forward = Camera.main.transform.forward;
            stateMachine.Animator.CrossFadeInFixedTime(_attack.AnimationName, _attack.TransitionDuration);
            stateMachine.WeaponDamage.SetAttack(_attack.AttackDamage + stateMachine.AdditionalAttackDamage, _attack.KnockbackForce);
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

        public override void FixedTick()
        {

        }
        #endregion

        #region PrivateMethods
        private void TryComboAttack(float normalizedTime)
        {
            if (_attack.ComboStateIndex == -1 || _attack.ComboStateIndex >= stateMachine.GetNumberOfAttacks())
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
        #endregion
    }
}
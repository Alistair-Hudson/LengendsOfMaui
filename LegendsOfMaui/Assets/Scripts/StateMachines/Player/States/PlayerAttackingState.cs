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
            _stateMachine.Animator.CrossFadeInFixedTime(_attack.AnimationName, _attack.TransitionDuration);
            _stateMachine.WeaponDamage.BaseDamage = _attack.AtackDamage;
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);
            FaceTarget();

            float normalizedTime = GetNormalizedTime();

            if (normalizedTime > _attack.ForceTime)
            {
                TryApplyForce();
            }

            if (normalizedTime < 1)
            {
                if (_stateMachine.InputReader.IsAttacking)
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
            _stateMachine.SwitchState(new PlayerAttackingState(_stateMachine, _attack.ComboStateIndex));
        }

        private float GetNormalizedTime()
        {
            var currentInfo = _stateMachine.Animator.GetCurrentAnimatorStateInfo(0);
            var nextInfo = _stateMachine.Animator.GetNextAnimatorStateInfo(0);

            if (_stateMachine.Animator.IsInTransition(0) && nextInfo.IsTag("Attack"))
            {
                return nextInfo.normalizedTime;
            }
            else if (!_stateMachine.Animator.IsInTransition(0) && currentInfo.IsTag("Attack"))
            {
                return currentInfo.normalizedTime;
            }
            else
            {
                return 0;
            }
        }

        private void TryApplyForce()
        {
            if (_isForcedApplied)
            {
                return;
            }
            _stateMachine.ForceReceiver.AddForce(_stateMachine.transform.forward * _attack.Force);
            _isForcedApplied = true;
        }
    }
}
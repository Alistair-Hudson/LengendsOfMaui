using AlictronicGames.LegendsOfMaui.Combat;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerAttackingState : PlayerBaseState
    {
        private IPlayerAttack _attack = null;

        private bool _isForcedApplied = false;

        public PlayerAttackingState(PlayerStateMachine playerStateMachine, IPlayerAttack playerAttack) : base(playerStateMachine)
        {
            _attack = playerAttack;
        }

        #region StateMachine
        public override void Enter()
        {
            stateMachine.transform.forward = Camera.main.transform.forward;
            stateMachine.Animator.CrossFadeInFixedTime(_attack.AttackName, _attack.TransitionDuration);
            if (_attack.AttackSound != null)
            {
                stateMachine.AudioSource.PlayOneShot(_attack.AttackSound);
            }
            stateMachine.WeaponDamage.SetAttack(_attack.BaseAttackDamage + stateMachine.AdditionalAttackDamage, _attack.BaseKnockBackForce);
            stateMachine.InputReader.FastAttackEvent += OnFastAttack;
            stateMachine.InputReader.HeavyAttackEvent += OnHeavyAttack;
            stateMachine.InputReader.JumpEvent += OnJump;
            stateMachine.InputReader.DodgeEvent += OnDodge;
            stateMachine.InputReader.BlockingEvent += OnBlocking;
        }

        public override void Exit()
        {
            stateMachine.InputReader.FastAttackEvent -= OnFastAttack;
            stateMachine.InputReader.HeavyAttackEvent -= OnHeavyAttack;
            stateMachine.InputReader.JumpEvent -= OnJump;
            stateMachine.InputReader.DodgeEvent -= OnDodge;
            stateMachine.InputReader.BlockingEvent -= OnBlocking;
            stateMachine.IsChainAttackReady = false;
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);
            FaceTarget();

            float normalizedTime = GetNormalizedTime(stateMachine.Animator, "Attack");

            //TODO new force apllication
            //if (normalizedTime > _attack.ForceTime)
            //{
            //    TryApplyForce();
            //}

            if (normalizedTime >= 1)
            {
                SwitchBackToLocmotion();
            }
        }

        public override void FixedTick()
        {

        }
        #endregion

        #region PrivateMethods
        private void TryApplyForce()
        {
            if (_isForcedApplied)
            {
                return;
            }
            //stateMachine.ForceReceiver.AddForce(stateMachine.transform.forward * _attack.Force);
            _isForcedApplied = true;
        }
        #endregion

        #region EventHandlers
        private void OnBlocking()
        {
            if (!stateMachine.IsChainAttackReady)
            {
                return;
            }

            if (_attack.GetNextBlockAttack().IsLearnt)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.GetNextBlockAttack()));
            }
        }

        private void OnDodge()
        {
            if (!stateMachine.IsChainAttackReady)
            {
                return;
            }

            if (_attack.GetNextDodgeAttack().IsLearnt)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.GetNextDodgeAttack()));
            }
        }

        private void OnJump()
        {
            if (!stateMachine.IsChainAttackReady)
            {
                return;
            }

            if (_attack.GetNextJumpAttack().IsLearnt)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.GetNextJumpAttack()));
            }
        }

        private void OnHeavyAttack()
        {
            if (!stateMachine.IsChainAttackReady)
            {
                return;
            }

            if (_attack.GetNextHeavyAttack().IsLearnt)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.GetNextHeavyAttack()));
            }
        }

        private void OnFastAttack()
        {
            if (!stateMachine.IsChainAttackReady)
            {
                return;
            }

            if (_attack.GetNextFastAttack().IsLearnt)
            {
                stateMachine.SwitchState(new PlayerAttackingState(stateMachine, _attack.GetNextFastAttack()));
            }
        }
        #endregion
    }
}
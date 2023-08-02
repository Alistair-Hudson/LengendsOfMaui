using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerDeathState : PlayerBaseState
    {
        private readonly int DEATH = Animator.StringToHash("Death");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public PlayerDeathState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(DEATH, ANIMATOR_DAMP_TIME);
            stateMachine.WeaponDamage.gameObject.SetActive(false);
            stateMachine.CharacterController.enabled = false;
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            
        }
    }
}
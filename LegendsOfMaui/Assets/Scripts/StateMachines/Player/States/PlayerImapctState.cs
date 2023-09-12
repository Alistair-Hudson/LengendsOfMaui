using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Player
{
    public class PlayerImapctState : PlayerBaseState
    {
        private readonly int IMPACT = Animator.StringToHash("GetHit");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        private float _duration = 1f;

        public PlayerImapctState(PlayerStateMachine playerStateMachine) : base(playerStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(IMPACT, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {
            
        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);
            _duration -= deltaTime;
            if (_duration <= 0)
            {
                SwitchBackToLocmotion();
            }
        }

        public override void FixedTick()
        {

        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossIdleState : BossBaseState
    {
        private readonly int FORWARD_SPEED = Animator.StringToHash("ForwardMovement");
        private readonly int MOVEMENT = Animator.StringToHash("Movement");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public BossIdleState(BossStateMachine bossStateMachine) : base(bossStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(MOVEMENT, ANIMATOR_DAMP_TIME);
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {
            Move(deltaTime);

            stateMachine.Animator.SetFloat(FORWARD_SPEED, 0, ANIMATOR_DAMP_TIME, deltaTime);
        }

        public override void FixedTick()
        {

        }
    }
}
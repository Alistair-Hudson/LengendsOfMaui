using AlictronicGames.LegendsOfMaui.Combat.Targeting;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.StateMachines.Boss
{
    public class BossDeathState : BossBaseState
    {
        private readonly int DEATH = Animator.StringToHash("Death");
        private const float ANIMATOR_DAMP_TIME = 0.1f;

        public BossDeathState(BossStateMachine bossStateMachine) : base(bossStateMachine)
        {
        }

        public override void Enter()
        {
            stateMachine.Animator.CrossFadeInFixedTime(DEATH, ANIMATOR_DAMP_TIME);
            stateMachine.Collider.enabled = false;
            stateMachine.CallOnDeath();
            GameObject.Destroy(stateMachine.GetComponent<Target>());
        }

        public override void Exit()
        {

        }

        public override void Tick(float deltaTime)
        {

        }

        public override void FixedTick()
        {

        }
    }
}
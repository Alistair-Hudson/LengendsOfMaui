using AlictronicGames.LegendsOfMaui.StateMachines.Boss;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    public class BossAttackController : MonoBehaviour, IBossAttackController
    {
        protected BossStateMachine _bossStateMachine = null;
        protected PlayerStateMachine _playerStateMachine = null;

        private void Awake()
        {
            _bossStateMachine = GetComponentInParent<BossStateMachine>();
        }

        private void Start()
        {
            _playerStateMachine = FindAnyObjectByType<PlayerStateMachine>();
        }

        public void ReturnToIdle()
        {
            _bossStateMachine.SwitchState(new BossIdleState(_bossStateMachine));
        }
    }
}
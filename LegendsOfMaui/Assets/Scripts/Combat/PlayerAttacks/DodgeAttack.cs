using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "PlayerDodgeAttack", menuName = "Player Attacks/Dodge Attack", order = 0)]
    public class DodgeAttack : ScriptableObject, IPlayerAttack
    {
        [SerializeField]
        private string _attackName = "";
        [SerializeField]
        private Animation _attackAnimation = null;
        [SerializeField]
        private float _baseAttackDamge = 1;
        [SerializeField]
        private float _baseKnockBackForece = 0;
        [SerializeField]
        private float _tranisitionDuration = 0.1f;
        [SerializeField]
        private bool _isLearnt = false;

        [Header("Follow Up Attacks")]
        [SerializeField]
        private FastAttack _fastAttack = null;
        [SerializeField]
        private HeavyAttack _heavyAttack = null;
        [SerializeField]
        private DodgeAttack _dodgeAttack = null;
        [SerializeField]
        private JumpAttack _jumpAttack = null;
        [SerializeField]
        private BlockAttack _blockAttack = null;

        public bool IsLearnt => _isLearnt;
        public string AttackName => _attackName;
        public Animation AttackAnimation => _attackAnimation;
        public float BaseAttackDamage => _baseAttackDamge;
        public float BaseKnockBackForce => _baseKnockBackForece;
        public float TransitionDuration => _tranisitionDuration;

        public object CaptureState()
        {
            return _isLearnt;
        }

        public IPlayerAttack GetNextBlockAttack()
        {
            if (_blockAttack == null)
                return null;

            if (_blockAttack.IsLearnt)
                return _blockAttack;

            return null;
        }

        public IPlayerAttack GetNextDodgeAttack()
        {
            if (_dodgeAttack == null)
                return null;

            if (_dodgeAttack.IsLearnt)
                return _dodgeAttack;

            return null;
        }

        public IPlayerAttack GetNextFastAttack()
        {
            if (_fastAttack == null)
                return null;

            if (_fastAttack.IsLearnt)
                return _fastAttack;

            return null;
        }

        public IPlayerAttack GetNextHeavyAttack()
        {
            if (_heavyAttack == null)
                return null;

            if (_heavyAttack.IsLearnt)
                return _heavyAttack;

            return null;
        }

        public IPlayerAttack GetNextJumpAttack()
        {
            if (_jumpAttack == null)
                return null;

            if (_jumpAttack.IsLearnt)
                return _jumpAttack;

            return null;
        }

        public void RestoreState(object state)
        {
            _isLearnt = (bool)state;
        }
    }
}
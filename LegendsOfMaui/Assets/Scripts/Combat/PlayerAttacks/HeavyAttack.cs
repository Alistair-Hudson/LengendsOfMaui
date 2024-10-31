using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat
{
    [CreateAssetMenu(fileName = "PlayerHeavyAttack", menuName = "Player Attacks/Heavy Attack", order = 0)]
    public class HeavyAttack : ScriptableObject, IPlayerAttack
    {
        [SerializeField]
        private string _attackName = "";
        [SerializeField]
        private Animation _attackAnimation = null;
        [SerializeField]
        private AudioClip _attackSound = null;
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

        public AudioClip AttackSound => _attackSound;

        public float BaseAttackDamage => _baseAttackDamge;
        public float BaseKnockBackForce => _baseKnockBackForece;

        public float TransitionDuration => _tranisitionDuration;

        public object CaptureState()
        {
            return this;
        }

        public IPlayerAttack GetNextBlockAttack()
        {
            if (_blockAttack == null)
                return null;

            return _blockAttack.IsLearnt ? _blockAttack : null;
        }

        public IPlayerAttack GetNextDodgeAttack()
        {
            if (_dodgeAttack == null)
                return null;

            return _dodgeAttack.IsLearnt ? _dodgeAttack : null;
        }

        public IPlayerAttack GetNextFastAttack()
        {
            if (_fastAttack == null)
                return null;

            return _fastAttack.IsLearnt ? _fastAttack : null;
        }

        public IPlayerAttack GetNextHeavyAttack()
        {
            if (_heavyAttack == null)
                return null;

            return _heavyAttack.IsLearnt ? _heavyAttack : null;
        }

        public IPlayerAttack GetNextJumpAttack()
        {
            if (_jumpAttack == null)
                return null;

            return _jumpAttack.IsLearnt ? _jumpAttack : null;
        }

        public void RestoreState(object state)
        {
            if (state is not HeavyAttack attack)
            {
                return;
            }

            if (attack.AttackName != AttackName)
            {
                return;
            }

            _isLearnt = attack.IsLearnt;
        }
    }
}
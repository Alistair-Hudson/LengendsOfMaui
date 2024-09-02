using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.StateMachines;
using Sirenix.OdinInspector;
using Sirenix.Serialization;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class AnimationCallReceiver : SerializedMonoBehaviour
    {
        [SerializeField] 
        private AudioClip _movementSound = null;

        private StateMachine _stateMachine;

        private void Awake()
        {
            _stateMachine = GetComponentInParent<StateMachine>(true);
        }

        public void FootR()
        {

        }

        public void FootL()
        {

        }

        public void Hit()
        {

        }

        public void PlayMovementSound()
        {
            _stateMachine.AudioSource.PlayOneShot(_movementSound);
        }
    }
}
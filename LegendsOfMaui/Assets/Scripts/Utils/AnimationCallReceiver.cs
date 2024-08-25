using AlictronicGames.LegendsOfMaui.StateMachines;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class AnimationCallReceiver : MonoBehaviour
    {
        [SerializeField] private AudioClip _movementSound = null;

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
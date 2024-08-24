using AlictronicGames.LegendsOfMaui.StateMachines;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class AnimationCallReceiver : MonoBehaviour
    {
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

        public void PlayMovementSound(object sound)
        {
            if (sound is not AudioClip)
            {
                return;
            }

            _stateMachine.AudioSource.PlayOneShot((AudioClip)sound);
        }
    }
}
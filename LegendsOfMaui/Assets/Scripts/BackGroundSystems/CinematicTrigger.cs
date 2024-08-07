using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class CinematicTrigger : MonoBehaviour
    {
        [SerializeField]
        private DirectorCaller _directorCaller = null;
        [SerializeField]
        private CinematicTrigger[] _otherCinematicTriggers;

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out PlayerStateMachine player))
            {
                return;
            }

            _directorCaller.enabled = true;
            foreach (CinematicTrigger cinematicTrigger in _otherCinematicTriggers)
            {
                cinematicTrigger.gameObject.SetActive(false);
            }
            gameObject.SetActive(false);
        }
    }
}
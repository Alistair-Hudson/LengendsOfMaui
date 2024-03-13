using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(PlayableDirector))]
    public class DirectorCaller : MonoBehaviour
    {
        private void OnEnable()
        {
            GetComponent<PlayableDirector>().Play();
        }
    }
}
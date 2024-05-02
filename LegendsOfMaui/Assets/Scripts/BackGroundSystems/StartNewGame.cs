using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class StartNewGame : MonoBehaviour
    {
        [SerializeField]
        private string firstScene = "";

        public void StartGame()
        {
            FindFirstObjectByType<SceneControl>().StartCoroutine(SceneControl.LoadNextScene(firstScene));
        }
    }
}
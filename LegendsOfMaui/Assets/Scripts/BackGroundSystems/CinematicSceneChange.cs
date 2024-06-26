using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class CinematicSceneChange : MonoBehaviour
    {
        public void ChangeScene(string sceneName)
        {
            var sceneControl = FindAnyObjectByType<SceneControl>();
            if (sceneControl)
            {
                sceneControl.CallLoadNextScene(sceneName);
            }
        }
    }
}
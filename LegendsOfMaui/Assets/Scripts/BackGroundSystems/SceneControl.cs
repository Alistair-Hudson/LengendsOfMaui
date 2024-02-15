using AlictronicGames.LegendsOfMaui.Saving;
using Sirenix.OdinInspector;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class SceneControl : MonoBehaviour, ISaveable
    {
        [SerializeField]
        private string splashScene;

        private static string _splashScene;

        private void Awake()
        {
            _splashScene = splashScene;
        }

        private static void LoadSplashScene()
        {
            SceneManager.LoadSceneAsync(_splashScene);
        }

        private static void UnloadSplashScene()
        {
            SceneManager.UnloadSceneAsync(_splashScene);
        }

        [Button("Load Scene")]
        public static async void LoadNextScene(string sceneName)
        {
            LoadSplashScene();
            await SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Additive);
            UnloadSplashScene();
        }

        public object CaptureState()
        {
            return SceneManager.GetActiveScene();
        }

        public void RestoreState(object state)
        {
            if (state is Scene)
            {
                //LoadNextScene((Scene)state);
            }
        }


    }
}
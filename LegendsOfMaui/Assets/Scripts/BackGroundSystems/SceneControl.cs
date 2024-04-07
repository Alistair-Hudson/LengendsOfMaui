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

        private static IEnumerator LoadSplashScene()
        {
           yield return SceneManager.LoadSceneAsync(_splashScene);
        }

        private static IEnumerator UnloadSplashScene()
        {
            yield return SceneManager.UnloadSceneAsync(_splashScene);
        }

        [Button("Load Scene")]
        private void CallLoadNextScene(string sceneName)
        {
            StartCoroutine(LoadNextScene(sceneName));
        }

        public static IEnumerator LoadNextScene(string sceneName)
        {
            yield return LoadSplashScene();
            yield return SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Additive);
            yield return UnloadSplashScene();
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
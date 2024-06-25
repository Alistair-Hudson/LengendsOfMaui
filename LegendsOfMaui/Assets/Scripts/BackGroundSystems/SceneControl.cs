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
            Debug.Log("Splash Loaded");
        }

        private static IEnumerator UnloadSplashScene()
        {
            yield return SceneManager.UnloadSceneAsync(_splashScene);
            Debug.Log("Splash Unloaded");
        }

        [Button("Load Scene")]
        public void CallLoadNextScene(string sceneName)
        {
            Debug.Log($"Changing to {sceneName}");
            StartCoroutine(LoadNextScene(sceneName));
        }

        public static IEnumerator LoadNextScene(string sceneName)
        {
            yield return LoadSplashScene();
            Debug.Log("Loading " + sceneName);
            yield return SceneManager.LoadSceneAsync(sceneName, LoadSceneMode.Additive);
            Debug.Log(sceneName + " Loaded");
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
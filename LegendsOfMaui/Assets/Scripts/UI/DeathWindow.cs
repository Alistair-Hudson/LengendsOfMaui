using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.Controls;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class DeathWindow : MonoBehaviour
    {
        [SerializeField]
        private Button loadButton = null;
        [SerializeField]
        private Button quitButton = null;

        private void Awake()
        {
            InputReader[] inputReaders =  FindObjectsByType<InputReader>(FindObjectsSortMode.None);
            foreach (var reader in inputReaders)
            {
                reader.enabled = false;
            }

            quitButton.onClick.AddListener(Quit);

            Time.timeScale = 0;
            Cursor.visible = true;
            Cursor.lockState = CursorLockMode.None;
        }

        private void OnDestroy()
        {
            Time.timeScale = 1;
        }

        private void Quit()
        {
            Debug.Log("Quiting Game");
            FindFirstObjectByType<SceneControl>().StartCoroutine(SceneControl.LoadNextScene("MainMenu"));
        }
    }
}
using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    [RequireComponent(typeof(InputReader))]
    public class PauseMenu : MonoBehaviour
    {
        [SerializeField]
        private Button resumeButton = null;
        [SerializeField]
        private Button saveButton = null;
        [SerializeField]
        private Button loadButton = null;
        [SerializeField]
        private Button quitConfirmButton = null;
        [SerializeField]
        private Button exitConfirmButton = null;
        [SerializeField]
        private GameObject menuBG = null;

        private InputReader _inputReader = null;

        private void Awake()
        {
            _inputReader = GetComponent<InputReader>();
            _inputReader.OpenClosePauseMenu += OpenCloseMenuHandler;

            resumeButton.onClick.AddListener(OpenCloseMenuHandler);
            quitConfirmButton.onClick.AddListener(LoadMainMenu);
            exitConfirmButton.onClick.AddListener(Application.Quit);

            SetMenuState();
        }

        private void LoadMainMenu()
        {
            Debug.Log("quiting game");
            StartCoroutine(SceneControl.LoadNextScene("MainMenu"));
            OpenCloseMenuHandler();
        }

        private void OpenCloseMenuHandler()
        {
            if (IsCutScenePlaying())
            {
                return;
            }
            SetMenuState();
        }

        private void SetMenuState()
        {
            menuBG.SetActive(!menuBG.activeSelf);
            Cursor.visible = menuBG.activeSelf;
            Cursor.lockState = menuBG.activeSelf ? CursorLockMode.None : CursorLockMode.Locked;
            Time.timeScale = menuBG.activeSelf ? 0 : 1;
            var player = FindFirstObjectByType<PlayerStateMachine>();
            if (player != null)
            {
                player.GetComponent<InputReader>().enabled = !menuBG.activeSelf;
            }
        }

        private bool IsCutScenePlaying()
        {
            PlayableDirector[] directors = FindObjectsByType<PlayableDirector>(FindObjectsSortMode.None);
            foreach (PlayableDirector director in directors)
            {
                if (director.state == PlayState.Playing)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
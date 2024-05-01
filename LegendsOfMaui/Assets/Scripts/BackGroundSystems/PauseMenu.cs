using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
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

            OpenCloseMenuHandler();
        }

        private void OnEnable()
        {
            Cursor.visible = true;
        }

        private void OnDisable()
        {
            Cursor.visible = false;
        }

        private void LoadMainMenu()
        {
            SceneControl.LoadNextScene("MainMenu");
        }

        private void OpenCloseMenuHandler()
        {
            menuBG.SetActive(!menuBG.activeSelf);
        }
    }
}
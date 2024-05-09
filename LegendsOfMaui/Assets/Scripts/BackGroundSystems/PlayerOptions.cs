using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using static TMPro.TMP_Dropdown;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{

    public class PlayerOptions : MonoBehaviour
    {
        private readonly string GLOBAL_VOLUME = "Gobal Volume";
        private readonly string SCREEN_WIDTH = "Screen Width";
        private readonly string SCREEN_HEIGHT = "Screen Height";
        private readonly string LANGUAGE = "Language";
        private readonly string FULL_SCREEN_MODE = "Full Screen Mode";

        public enum Language
        {
            English = 0,
            Maori
        }

        [SerializeField]
        private TMP_Dropdown screenResolutionDropdown = null;
        [SerializeField]
        private TMP_Dropdown screenModeDropdown = null;
        [SerializeField]
        private Slider volumeSlider = null;

        private float _globalVolume = 1f;
        private int _screenWidth = 1920;
        private int _screenHeight = 1080;
        private FullScreenMode _fullScreenMode = FullScreenMode.FullScreenWindow;
        private Language _language = Language.English;

        private void Awake()
        {
            screenResolutionDropdown.onValueChanged.AddListener(OnScreenResolutionChange);
            screenModeDropdown.onValueChanged.AddListener(OnScreenModeChange);
            volumeSlider.onValueChanged.AddListener(SetGlobalVolume);
        }

        private void OnEnable()
        {
            LoadPlayerPrefs();
        }

        public void LoadPlayerPrefs()
        {
            string resolution = $"{PlayerPrefs.GetInt(SCREEN_WIDTH, 1920)}x{PlayerPrefs.GetInt(SCREEN_HEIGHT, 1080)}";
            OptionData resultionData = new OptionData { text = resolution };
            int resolutionValue = screenResolutionDropdown.options.IndexOf(resultionData);
            screenResolutionDropdown.value =  resolutionValue;
            screenModeDropdown.value = PlayerPrefs.GetInt(FULL_SCREEN_MODE, 0);
            volumeSlider.value = PlayerPrefs.GetFloat(GLOBAL_VOLUME, 1f);

            SetLanguage((Language)PlayerPrefs.GetInt(LANGUAGE, 0));
            OnScreenResolutionChange(screenResolutionDropdown.value);
            OnScreenModeChange(screenModeDropdown.value);
            SetGlobalVolume(volumeSlider.value);
        }

        public void SavePlayerPrefs()
        {
            PlayerPrefs.SetInt(LANGUAGE, (int)_language);
            PlayerPrefs.SetInt(SCREEN_HEIGHT, _screenHeight);
            PlayerPrefs.SetInt(SCREEN_WIDTH, _screenWidth);
            PlayerPrefs.SetInt(FULL_SCREEN_MODE, (int)_fullScreenMode);
            PlayerPrefs.SetFloat(GLOBAL_VOLUME, _globalVolume);
        }

        public void SetFullScreenMode(FullScreenMode mode)
        {
            _fullScreenMode = mode;
            Screen.SetResolution(_screenWidth, _screenHeight, mode);
        }

        public void SetResolution(int width, int height)
        {
            _screenWidth = width;
            _screenHeight = height;
            Screen.SetResolution(width, height, _fullScreenMode);
        }

        public void SetLanguage(Language language)
        {
            _language = language;
        }

        public void SetGlobalVolume(float volume)
        {
            _globalVolume = volume;
            AudioListener.volume = volume;
        }

        private void OnScreenResolutionChange(int dropdownValue)
        {
            string resolution = screenResolutionDropdown.options[dropdownValue].text;
            string[] values = resolution.Split('x');
            SetResolution(int.Parse(values[0]), int.Parse(values[1]));
        }

        private void OnScreenModeChange(int dropdownValue)
        {
            dropdownValue++; //this is here to remove the use of FullScreenMode.Exclussive
            SetFullScreenMode((FullScreenMode)dropdownValue);
        }
    }
}
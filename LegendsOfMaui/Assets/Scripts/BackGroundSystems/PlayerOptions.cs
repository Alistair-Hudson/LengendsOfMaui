using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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

        private float _globalVolume = 1f;
        private int _screenWidth = 1920;
        private int _screenHeight = 1080;
        private FullScreenMode _fullScreenMode = FullScreenMode.FullScreenWindow;
        private Language _language = Language.English;

        private void LoadPlayerPrefs()
        {
            SetLanguage((Language)PlayerPrefs.GetInt(LANGUAGE, 0));
            SetResolution(PlayerPrefs.GetInt(SCREEN_WIDTH, 1080), PlayerPrefs.GetInt(SCREEN_HEIGHT, 1920));
            SetFullScreenMode((FullScreenMode)PlayerPrefs.GetInt(FULL_SCREEN_MODE, 1));
            SetGlobalVolume(PlayerPrefs.GetFloat(GLOBAL_VOLUME, 1f));
        }

        private void SavePlayerPrefs()
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
    }
}
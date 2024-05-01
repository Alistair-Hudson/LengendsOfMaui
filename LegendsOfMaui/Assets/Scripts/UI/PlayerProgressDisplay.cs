using AlictronicGames.LegendsOfMaui.Controls;
using AlictronicGames.LegendsOfMaui.Stats;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class PlayerProgressDisplay : MonoBehaviour
    {
        [SerializeField]
        private Image _matuProgressDisplay = null;
        [SerializeField]
        private Image _koruProgressDisplay = null;
        [SerializeField]
        private TMP_Text _matuLevelDisplay = null;
        [SerializeField]
        private TMP_Text _koruLevelDisplay = null;
        [SerializeField]
        private TMP_Text _matuNextDisplay = null;
        [SerializeField]
        private TMP_Text _koruNextDisplay = null;

        private PlayerManaProgression _playerManaProgression = null;

        private void Awake()
        {
            _playerManaProgression = GetComponentInParent<PlayerManaProgression>();

            _playerManaProgression.MatuManaAdded += MatuLevelUpHandler;
            _playerManaProgression.KoruManaAdded += KoruLevelUpHandler;

            _playerManaProgression.GetComponent<InputReader>().OpenCloseProgressMenu += OpenCloseProgressMenuHandler;
            OpenCloseProgressMenuHandler();
        }

        private void OnEnable()
        {
            Time.timeScale = 0;
            Cursor.lockState = CursorLockMode.Confined;
            Cursor.visible = true;
        }

        private void OnDisable()
        {
            Time.timeScale = 1;
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }

        private void OnDestroy()
        {
            _playerManaProgression.MatuManaAdded -= MatuLevelUpHandler;
            _playerManaProgression.KoruManaAdded -= KoruLevelUpHandler;
            _playerManaProgression.GetComponent<InputReader>().OpenCloseProgressMenu -= OpenCloseProgressMenuHandler;
        }

        private void MatuLevelUpHandler(float matuMana, int matuLevel, string nextMatuBonus)
        {
            _matuLevelDisplay.text = $"Matau Level: {matuLevel}";
            _matuNextDisplay.text = nextMatuBonus;
            _matuProgressDisplay.fillAmount = _playerManaProgression.ProgessPercentage(matuMana, matuLevel);
        }

        private void KoruLevelUpHandler(float koruMana, int koruLevel, string nextKoruBonus)     
        {
            _koruLevelDisplay.text = $"Koru Level: {koruLevel}";
            _koruNextDisplay.text = nextKoruBonus;
            _koruProgressDisplay.fillAmount = _playerManaProgression.ProgessPercentage(koruMana, koruLevel);
        }

        private void OpenCloseProgressMenuHandler()
        {
            gameObject.SetActive(!gameObject.activeSelf);
        }
    }
}
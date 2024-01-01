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

        private PlayerManaProgression _playerManaProgression = null;

        private void Awake()
        {
            _playerManaProgression = GetComponentInParent<PlayerManaProgression>();

            _playerManaProgression.MatuManaAdded += MatuLevelUpHandler;
            _playerManaProgression.KoruManaAdded += KoruLevelUpHandler;
        }

        private void OnEnable()
        {
            Cursor.visible = true;
        }

        private void OnDisable()
        {
            Cursor.visible = false;
        }

        private void OnDestroy()
        {
            _playerManaProgression.MatuManaAdded -= MatuLevelUpHandler;
            _playerManaProgression.KoruManaAdded -= KoruLevelUpHandler;
        }

        private void MatuLevelUpHandler(float matuMana, int matuLevel)
        {
            _matuLevelDisplay.text = $"Matu Level: {matuLevel}";
            _matuProgressDisplay.fillAmount = _playerManaProgression.ProgessPercentage(matuMana, matuLevel);
        }

        private void KoruLevelUpHandler(float koruMana, int koruLevel)
        {
            _koruLevelDisplay.text = $"Koru Level: {koruLevel}";
            _koruProgressDisplay.fillAmount = _playerManaProgression.ProgessPercentage(koruMana, koruLevel);
        }
    }
}
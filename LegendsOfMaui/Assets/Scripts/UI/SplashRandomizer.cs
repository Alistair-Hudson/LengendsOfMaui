using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class SplashRandomizer : MonoBehaviour
    {
        [SerializeField]
        private Image splashImage = null;
        [SerializeField]
        private TMP_Text subText = null;
        [SerializeField]
        private Sprite[] images;
        [SerializeField]
        private string[] textLines;

        private void Awake()
        {
            splashImage.sprite = images[Random.Range(0, images.Length)];
            subText.text = textLines[Random.Range(0, textLines.Length)];
        }
    }
}
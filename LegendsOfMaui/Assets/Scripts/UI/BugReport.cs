using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class BugReport : MonoBehaviour
    {
        [SerializeField]
        private string email = "alictron@gmail.com";

        public void SendBugReport()
        {
            Application.OpenURL($"mailto:{email}?subject=Bug%20Report%20Legends%20Of%20Maui");
        }
    }
}
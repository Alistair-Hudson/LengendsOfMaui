using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class CloseUI : MonoBehaviour
    {
        private void Update()
        {
            if (Input.anyKeyDown)
            {
                Destroy(gameObject);
            }
        }
    }
}
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.UI
{
    public class QuestWaypointMarker : MonoBehaviour
    {
        [SerializeField]
        private Image markerImage = null;
        [SerializeField]
        private TMP_Text distanceDisplay = null;

        private Transform playerLocation = null;

        private void OnEnable()
        {
            playerLocation = FindAnyObjectByType<PlayerStateMachine>().transform;
        }

        private void Update()
        {
            float minX = markerImage.GetPixelAdjustedRect().width / 2;
            float maxX = Screen.width - minX;

            float minY = markerImage.GetPixelAdjustedRect().height / 2;
            float maxY = Screen.width - minY;

            Vector2 pos = Camera.main.WorldToScreenPoint(transform.position);

            if (Vector3.Dot((transform.position - Camera.main.transform.position), Camera.main.transform.forward) < 0)
            {
                if (pos.x < Screen.width / 2)
                {
                    pos.x = maxX;
                }
                else
                {
                    pos.x = minX;
                }
            }

            pos.x = Mathf.Clamp(pos.x, minX, maxX);
            pos.y = Mathf.Clamp(pos.y, minY, maxY);

            markerImage.transform.position = pos;
            distanceDisplay.text = Mathf.FloorToInt(Vector3.Distance(playerLocation.position, transform.position)).ToString();
        }
    }
}
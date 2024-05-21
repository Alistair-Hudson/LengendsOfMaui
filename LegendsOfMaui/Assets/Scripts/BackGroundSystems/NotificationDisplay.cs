using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class NotificationDisplay : MonoBehaviour
    {
        [SerializeField]
        private GameObject notificationPrefab = null;
        [SerializeField]
        private float notificationLifeTime = 5f;
        [SerializeField]
        private int maxNotificationDisplayed = 5;

        private static GameObject _notificationPrefab = null;
        private static Transform _transform = null;
        private static float _notificationLifeTime = 5f;

        private void Awake()
        {
            _notificationPrefab = notificationPrefab;
            _transform = transform;
            _notificationLifeTime = notificationLifeTime;
        }

        public static void AddNotification(string newNotificationMessage)
        {
            GameObject newNotification = Instantiate(_notificationPrefab, _transform);
            newNotification.GetComponentInChildren<TMP_Text>().text = newNotificationMessage;
            Destroy(newNotification, _notificationLifeTime);
        }
    }
}
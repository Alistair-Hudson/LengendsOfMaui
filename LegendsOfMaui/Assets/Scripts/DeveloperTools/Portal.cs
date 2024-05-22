using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.Saving;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    [RequireComponent(typeof(SaveableEntity))]
    public class Portal : MonoBehaviour, ISaveable
    {
        public enum DestintionID
        {
            A, B, C, D, E, F, G, H
        }

        private readonly string AUTO_SAVE_FILE = "Auto Save";

        [SerializeField]
        private string connectingScene = "";
        [SerializeField]
        private DestintionID destintionID = DestintionID.A;
        [SerializeField]
        private Transform spawnLocation = null;
        [SerializeField]
        private bool isOpen = true;


        public Transform SpawnLocation { get => spawnLocation; }
        public DestintionID Destintion { get => destintionID; }

        private void Start()
        {
            gameObject.SetActive(isOpen);
        }

        private void OnTriggerEnter(Collider other)
        {
            if (!other.TryGetComponent<PlayerStateMachine>(out var playerStateMachine))
            {
                return;
            }

            StartCoroutine(Transition());
        }

        private IEnumerator Transition()
        {
            DontDestroyOnLoad(gameObject);
            SaveSystemWrapper.Save(AUTO_SAVE_FILE);
            yield return SceneControl.LoadNextScene(connectingScene);
            SaveSystemWrapper.Load(AUTO_SAVE_FILE);

            Portal otherPortal = GetOtherPortal();
            UpdatePlayer(otherPortal);
            SaveSystemWrapper.Save(AUTO_SAVE_FILE);

            Destroy(gameObject);
        }

        private void UpdatePlayer(Portal otherPortal)
        {
            PlayerStateMachine player = FindAnyObjectByType<PlayerStateMachine>();
            player.transform.position = otherPortal.SpawnLocation.position;
            player.transform.rotation = otherPortal.SpawnLocation.rotation;
        }

        private Portal GetOtherPortal()
        {
            Portal[] portals = FindObjectsByType<Portal>(FindObjectsSortMode.None);
            foreach (Portal portal in portals)
            {
                if (portal == this)
                {
                    continue;
                }
                if (portal.Destintion == destintionID)
                {
                    return portal;
                }
            }

            return null;
        }

        private void OnDrawGizmos()
        {
            Gizmos.color = Color.white;
            Gizmos.DrawSphere(spawnLocation.position, 1);
        }

        public object CaptureState()
        {
            return isOpen;
        }

        public void RestoreState(object state)
        {
            isOpen = (bool)state;
            gameObject.SetActive(isOpen);
        }
    }
}
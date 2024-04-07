using AlictronicGames.LegendsOfMaui.BackGroundSystems;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    public class Portal : MonoBehaviour
    {
        public enum DestintionID
        {
            A, B, C, D, E, F, G, H
        }

        [SerializeField]
        private string connectingScene = "";
        [SerializeField]
        private DestintionID destintionID = DestintionID.A;
        [SerializeField]
        private Transform spawnLocation = null;


        public Transform SpawnLocation { get => spawnLocation; }
        public DestintionID Destintion { get => destintionID; }

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
            yield return SceneControl.LoadNextScene(connectingScene);

            Portal otherPortal = GetOtherPortal();
            UpdatePlayer(otherPortal);

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
    }
}
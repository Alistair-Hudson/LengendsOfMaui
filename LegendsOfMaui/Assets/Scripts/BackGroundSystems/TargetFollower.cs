using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class TargetFollower : MonoBehaviour
    {
        [SerializeField] private Transform _target = null;

        private void Update()
        {
            transform.position = _target.position;
        }
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.DeveloperTools
{
    public class WayPoint : MonoBehaviour
    {
        [SerializeField]
        private WayPoint _nextWayPoint = null;

        public WayPoint NextWayPoint { get => _nextWayPoint; }
        public Vector3 Position { get => transform.position; }

        private void OnDrawGizmos()
        {
            if (_nextWayPoint)
            {
                Gizmos.DrawLine(transform.position, _nextWayPoint.transform.position);
            }

            Gizmos.color = Color.yellow;
            Gizmos.DrawSphere(transform.position, 0.1f);
        }
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Targeting
{
    public class Targeter : MonoBehaviour
    {
        [SerializeField]
        private Cinemachine.CinemachineTargetGroup _targetGroup = null;

        private List<Target> _targets = new List<Target>();
        private Camera _mainCamera = null;

        public Target CurrentTarget { get; private set; } = null;

        private void Start()
        {
            _mainCamera = Camera.main;
        }

        public bool SelectTarget()
        {
            if (_targets.Count <= 0)
            {
                return false;
            }

            Target closestTarget = null;
            float cloestTargetDist = Mathf.Infinity;

            foreach (var target in _targets)
            {
                Vector2 viewPos = _mainCamera.WorldToViewportPoint(target.transform.position);
                if (viewPos.x < 0 || viewPos.x > 1 || viewPos.y < 0 || viewPos.y > 1)
                {
                    continue;
                }

                Vector2 toCenter = viewPos - new Vector2(0.5f, 0.5f);
                if (toCenter.sqrMagnitude < cloestTargetDist)
                {
                    closestTarget = target;
                    cloestTargetDist = toCenter.sqrMagnitude;
                }
            }

            if (closestTarget == null)
            {
                return false;
            }

            CurrentTarget = closestTarget;
            _targetGroup.AddMember(CurrentTarget.transform, 1f, 2f);
            return true;
        }

        public void CancelTarget()
        {
            if (CurrentTarget == null)
            {
                return;
            }

            _targetGroup.RemoveMember(CurrentTarget.transform);
            CurrentTarget = null;
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other.TryGetComponent<Target>(out var target))
            {
                _targets.Add(target);
                target.TargetDestroyed += HandleTargetDestroyed;
            }
        }

        private void OnTriggerExit(Collider other)
        {
            if (other.TryGetComponent<Target>(out var target))
            {
                RemoveTarget(target);
            }
        }

        private void HandleTargetDestroyed(Target target)
        {
            RemoveTarget(target);
        }

        private void RemoveTarget(Target target)
        {
            if (_targets.Contains(target))
            {
                target.TargetDestroyed -= HandleTargetDestroyed;
                _targets.Remove(target);
                CurrentTarget = null;
                CancelTarget();
            }
        }
    }
}
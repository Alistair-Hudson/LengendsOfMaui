using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Targeting
{
    public class Target : MonoBehaviour
    {
        [SerializeField]
        private Canvas _targetDisplay = null;

        public event Action<Target> TargetDestroyed;

        #region UnityCalls
        private void Start()
        {
            SetDisplayState(false);
        }

        private void OnDestroy()
        {
            TargetDestroyed?.Invoke(this);
            SetDisplayState(false);
        }
        #endregion

        #region PublicMethods
        public void SetDisplayState(bool state)
        {
            _targetDisplay.gameObject.SetActive(state);
        }
        #endregion
    }
}
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Combat.Targeting
{
    public class Target : MonoBehaviour
    {
        public event Action<Target> TargetDestroyed;

        private void OnDestroy()
        {
            TargetDestroyed?.Invoke(this);
        }
    }
}
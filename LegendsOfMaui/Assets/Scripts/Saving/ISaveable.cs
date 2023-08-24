using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Saving
{
    public interface ISaveable
    {
        public object CaptureState();
        public void RestoreState(object state);
    }
}
using AlictronicGames.LegendsOfMaui.Saving;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public class Experience : MonoBehaviour, ISaveable
    {
        private float _totalExperience = 0;

        public float TotalExperience { get => _totalExperience; }

        public event Action OnExperienceGained;
        
        public void GainExperience(float gained)
        {
            _totalExperience += gained;
            OnExperienceGained();
        }

        public object CaptureState()
        {
            return _totalExperience;
        }

        public void RestoreState(object state)
        {
            _totalExperience = (float)state;
        }
    }
}
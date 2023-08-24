using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    [RequireComponent(typeof(Experience))]
    public class BaseStats : MonoBehaviour
    {
        [SerializeField]
        private Progression _progression = null;

        private int _level = 0;
        private Experience _experience = null;
        
        public int Level { get => _level; }

        public event Action OnStatsUpdate;

        #region UnityCalls
        private void Awake()
        {
            _experience = GetComponent<Experience>();
        }

        private void Start()
        {
            _level = CalculateLevel();
            if (_experience != null)
            {
                _experience.OnExperienceGained += UpdateLevel;
            }
        }

        private void OnDestroy()
        {
            if (_experience != null)
            {
                _experience.OnExperienceGained -= UpdateLevel;
            }
        }
        #endregion

        #region PublicMethods
        public int CalculateLevel()
        {
            if (_experience == null)
            {
                return 1;
            }

            float currentXP = _experience.TotalExperience;
            int penultimateLevel = _progression.GetLevels(Stats.XPToLevel);
            for (int i = 1; i <= penultimateLevel; i++)
            {
                float xpToLevel = _progression.GetStats(Stats.XPToLevel, i);
                if (currentXP < xpToLevel)
                {
                    return i;
                }
            }
            return penultimateLevel + 1;
        }

        public float GetStat(Stats stat)
        {
            float statTotal = _progression.GetStats(stat, CalculateLevel());
            statTotal += AdditveModifiers(stat);
            statTotal *= PercentageModifiers(stat);
            return statTotal;
        }
        #endregion

        #region PrivateMethods
        private float PercentageModifiers(Stats stat)
        {
            float percentageTotal = 100;
            var modifiers = GetComponents<IStatModifier>();
            foreach (var modifier in modifiers)
            {
                var statmods = modifier.GetPercentageModifier(stat);
                foreach (var statmod in statmods)
                {
                    percentageTotal += statmod;
                }
            }

            return percentageTotal / 100;
        }

        private float AdditveModifiers(Stats stat)
        {
            float statTotal = 0;
            var modifiers = GetComponents<IStatModifier>();
            foreach (var modifier in modifiers)
            {
                var statmods = modifier.GetAdditiveModifier(stat);
                foreach (var statmod in statmods)
                {
                    statTotal += statmod;
                }
            }

            return statTotal;
        }
        #endregion

        #region EventCalls
        private void UpdateLevel()
        {
            int newLevel = CalculateLevel();
            if (newLevel != _level)
            {
                _level = newLevel;
                OnStatsUpdate();
            }
        }

        private void UpdateStats()
        {
            OnStatsUpdate();
        }
        #endregion
    }
}
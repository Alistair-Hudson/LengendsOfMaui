using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    [CreateAssetMenu(fileName = "Progression", menuName = "ScriptableObjects/Progression", order = 0)]
    public class Progression : ScriptableObject
    {
        [System.Serializable]
        private class ProgressionStat
        {
            [SerializeField]
            private Stats stat;
            [SerializeField]
            private float[] levels;

            public Stats Stat { get => stat; }
            public float[] Levels { get => levels; }
        }

        [SerializeField]
        private ProgressionStat[] _stats = null;

        private Dictionary<Stats, float[]> _statsLookUp = null;

        #region PrivateMethods
        private void BuildLookUp()
        {
            _statsLookUp = new Dictionary<Stats, float[]>();
            foreach (var stat in _stats)
            {
                _statsLookUp.Add(stat.Stat, stat.Levels);
            }
        }
        #endregion

        #region PublicMethods
        public float GetStats(Stats stat, int level)
        {
            if (_statsLookUp == null)
            {
                BuildLookUp();
            }

            float[] levels = _statsLookUp[stat];
            return (level <= levels.Length ? levels[level - 1] : levels[levels.Length - 1]);
        }

        public int GetLevels(Stats stat)
        {
            if (_statsLookUp == null)
            {
                BuildLookUp();
            }

            return _statsLookUp[stat].Length;
        }
        #endregion
    }
}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public class MonsterStats : ScriptableObject
    {
        public Dictionary<int, float> HealthPerLevel { get; private set; } = new Dictionary<int, float>();
        public Dictionary<int, float> AttackPerLevel { get; private set; } = new Dictionary<int, float>();
        public Dictionary<int, float> ManaPerLevel { get; private set; } = new Dictionary<int, float>();

        public void SetMonsterStats(int level, string[] stats)
        {
            HealthPerLevel[level] = float.Parse(stats[1]);
            AttackPerLevel[level] = float.Parse(stats[2]);
            ManaPerLevel[level] = float.Parse(stats[3]);
        }
    }
}
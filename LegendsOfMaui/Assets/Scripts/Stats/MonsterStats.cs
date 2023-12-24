using Sirenix.OdinInspector;
using Sirenix.Serialization;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public class MonsterStats : SerializedScriptableObject
    {
        [OdinSerialize]
        public Dictionary<int, float> HealthPerLevel { get; private set; } = new Dictionary<int, float>();
        [OdinSerialize]
        public Dictionary<int, float> AttackPerLevel { get; private set; } = new Dictionary<int, float>();
        [OdinSerialize]
        public Dictionary<int, float> ManaPerLevel { get; private set; } = new Dictionary<int, float>();

        public void SetMonsterStats(int level, string[] stats)
        {
            if (float.TryParse(stats[1], out float health))
            {
                HealthPerLevel[level] = health;
            }
            else
            {
                Debug.LogError($"Failed to add health at level {level}");
            }

            if (float.TryParse(stats[2], out float attack))
            {
                AttackPerLevel[level] = attack;
            }
            else
            {
                Debug.LogError($"Failed to add attack at level {level}");
            }

            if (float.TryParse(stats[3], out float mana))
            {
                ManaPerLevel[level] = mana;
            }
            else
            {
                Debug.LogError($"Failed to add mana at level {level}");
            }
        }
    }
}
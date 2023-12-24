using Sirenix.OdinInspector;
using Sirenix.Serialization;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public class PlayerProgessionTable : SerializedScriptableObject
    {
        [SerializeField]
        private int AtackDamageIndex = 1;
        [SerializeField]
        private int AttackNumberIndex = 2;
        [SerializeField]
        private int MaxHealthIndex = 3;
        [SerializeField]
        private int HealthRegenIndex = 4;

        public struct MatuData
        {
            public float AttackDamageIncrease;
            public bool IncreaseNumberOfAttacks;
        }

        public struct KoruData
        {
            public float MaxHealthIncrease;
            public float HealthRegenIncrease;
        }

        [OdinSerialize]
        public Dictionary<int, MatuData> MatuDatas { get; private set; } = new Dictionary<int, MatuData>();
        [OdinSerialize]
        public Dictionary<int, KoruData> KoruDatas { get; private set; } = new Dictionary<int, KoruData>();

        public void SetStat(int level, string[] stats)
        {
            MatuData matuData = new MatuData
            {
                AttackDamageIncrease = float.Parse(stats[AtackDamageIndex]),
                IncreaseNumberOfAttacks = bool.Parse(stats[AttackNumberIndex])
            };
            MatuDatas[level] = matuData;

            KoruData koruData = new KoruData
            {
                MaxHealthIncrease = float.Parse(stats[MaxHealthIndex]),
                HealthRegenIncrease = float.Parse(stats[HealthRegenIndex])
            };
            KoruDatas[level] = koruData;
        }
    }
}
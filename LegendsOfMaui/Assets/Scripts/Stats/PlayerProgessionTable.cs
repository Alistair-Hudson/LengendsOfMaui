using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using Sirenix.OdinInspector;
using Sirenix.Serialization;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    public class PlayerProgessionTable : SerializedScriptableObject
    {
        [Header("Matu Indicies")]
        [SerializeField]
        private int _attackDamageIncreaseIndex = 1;
        [SerializeField]
        private int _attackNumberIndex = 2;
        [SerializeField]
        private int _animationNameIndex = 3;
        [SerializeField]
        private int _transitionDurationIndex = 4;
        [SerializeField]
        private int _comboStateIndex = 5;
        [SerializeField]
        private int _comboAttackTimeIndex = 6;
        [SerializeField]
        private int _forceTimeIndex = 7;
        [SerializeField]
        private int _forceIndex = 8;
        [SerializeField]
        private int _attackDamageIndex = 9;
        [SerializeField]
        private int _knockbackForce = 10;

        [Header("Koru Indicies")]
        [SerializeField]
        private int _maxHealthIndex = 1;
        [SerializeField]
        private int _healthRegenIndex = 2;

        public struct MatuData
        {
            public float AttackDamageIncrease;
            public AttackData NewAttack;
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

        public void SetStat(int level, string[] matuStats, string[] koruStats)
        {
            AttackData newAttackData = null;
            if (matuStats[_attackNumberIndex] == "TRUE")
            {
                newAttackData = new AttackData(matuStats[_animationNameIndex], 
                                                float.Parse(matuStats[_transitionDurationIndex]), 
                                                int.Parse(matuStats[_comboStateIndex]),
                                                float.Parse(matuStats[_comboAttackTimeIndex]),
                                                float.Parse(matuStats[_forceTimeIndex]),
                                                float.Parse(matuStats[_forceIndex]),
                                                float.Parse(matuStats[_attackDamageIndex]),
                                                float.Parse(matuStats[_knockbackForce])
                                                );
            }
            MatuData matuData = new MatuData
            {
                AttackDamageIncrease = float.Parse(matuStats[_attackDamageIncreaseIndex]),
                NewAttack = newAttackData
            };
            MatuDatas[level] = matuData;

            KoruData koruData = new KoruData
            {
                MaxHealthIncrease = float.Parse(koruStats[_maxHealthIndex]),
                HealthRegenIncrease = float.Parse(koruStats[_healthRegenIndex])
            };
            KoruDatas[level] = koruData;
        }
    }
}
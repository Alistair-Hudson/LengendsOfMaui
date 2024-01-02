using AlictronicGames.LegendsOfMaui.Saving;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    [RequireComponent(typeof(PlayerStateMachine))]
    public class PlayerManaProgression : MonoBehaviour, ISaveable
    {
        [System.Serializable]
        private class ProgessionSaveData
        {
            public float ManaPool { get; private set; }
            public float TotalMatuMana { get; private set; }
            public float TotalKoruMana { get; private set; }
            public int MatuLevel { get; private set; }
            public int KoruLevel { get; private set; }

            public ProgessionSaveData(float manaPool, float totalMatuMana, float totalKoruMana, int matuLevel, int koruLevel)
            {
                ManaPool = manaPool;
                TotalMatuMana = totalMatuMana;
                TotalKoruMana = totalKoruMana;
                MatuLevel = matuLevel;
                KoruLevel = koruLevel;
            }
        }

        [SerializeField]
        private PlayerProgessionTable _progessionTable = null;

        private PlayerStateMachine _playerStateMachine = null;

        private static float _manaPool = 0;
        private float _totalMatuMana = 0;
        private float _totalKoruMana = 0;
        private int _matuLevel = 0;
        private int _koruLevel = 0;

        public int MaxMatuLevel { get => _progessionTable.MatuDatas.Count; }
        public int MaxKoruLevel { get => _progessionTable.KoruDatas.Count; }
        public float ManaRequiredForMaxMatuLevel { get => ManaRequiredToLevelUp(MaxMatuLevel); }
        public float ManaRequiredForMaxKoruLevel { get => ManaRequiredToLevelUp(MaxKoruLevel); }

        public event Action<float, int> MatuManaAdded;
        public event Action<float, int> KoruManaAdded;

        private void Awake()
        {
            _playerStateMachine = GetComponent<PlayerStateMachine>();
            MatuManaAdded?.Invoke(_totalMatuMana, _matuLevel);
            KoruManaAdded?.Invoke(_totalKoruMana, _koruLevel);
        }

        private void MatuLevelUp()
        {
            if (_matuLevel >= MaxMatuLevel)
            {
                return;
            }
            _matuLevel++;
            var matuLevelData = _progessionTable.MatuDatas[_matuLevel];
            _playerStateMachine.IncreaseAdditionalAttackDamage(matuLevelData.AttackDamageIncrease);
            if (matuLevelData.NewAttack != null)
            {
                _playerStateMachine.AddAttack(matuLevelData.NewAttack);
            }
        }

        private void KoruLevelUp()
        {
            if (_koruLevel >= MaxKoruLevel)
            {
                return;
            }
            _koruLevel++;
            var koruData = _progessionTable.KoruDatas[_koruLevel];
            _playerStateMachine.Health.SetMaxHealth(_playerStateMachine.Health.MaxHealth + koruData.MaxHealthIncrease);
            _playerStateMachine.Health.SetHealthRegen(_playerStateMachine.Health.HealthRegenPerSecond + koruData.HealthRegenIncrease);
        }

        private bool LevelUp(ref float mana, int level)
        {
            float manaRequired = ManaRequiredToLevelUp(level + 1);
            if (mana >= manaRequired)
            {
                return true;
            }
            return false;
        }

        private float ManaRequiredToLevelUp(int level)
        {
            if (level < 0)
            {
                return 0;
            }
            float manaRequired = 1000 * (level) + ManaRequiredToLevelUp(level - 1); //Temporary level up formula
            return manaRequired;
        }

        private void AddManaToProgressionTree(ref float treeMana, ref int treeLevel, float mana, Action levelUpFunction)
        {
            if (_manaPool < mana)
            {
                return;
            }
            treeMana += mana;
            _manaPool -= mana;
            if (LevelUp(ref treeMana, treeLevel))
            {
                levelUpFunction();
            }
        }

        public void AddManaToMatu(float mana)
        {
            AddManaToProgressionTree(ref _totalMatuMana, ref _matuLevel, mana, MatuLevelUp);
            MatuManaAdded?.Invoke(_totalMatuMana, _matuLevel);
        }

        public void AddManaToKoru(float mana)
        {
            AddManaToProgressionTree(ref _totalKoruMana, ref _koruLevel, mana, KoruLevelUp);
            KoruManaAdded?.Invoke(_totalKoruMana, _koruLevel);
        }

        public static void AddManaToPool(float mana)
        {
            _manaPool += mana;
        }

        public object CaptureState()
        {
            return new ProgessionSaveData(_manaPool, _totalMatuMana, _totalKoruMana, _matuLevel, _koruLevel);
        }

        public void RestoreState(object state)
        {
            if (state is ProgessionSaveData)
            {
                ProgessionSaveData saveData = (ProgessionSaveData)state;

                _manaPool = saveData.ManaPool;
                _totalMatuMana = saveData.TotalMatuMana;
                _totalKoruMana = saveData.TotalKoruMana;

                for (int i = 0; i <= saveData.MatuLevel; i++)
                {
                    MatuLevelUp();
                }
                MatuManaAdded?.Invoke(_totalMatuMana, _matuLevel);

                for (int j = 0; j <= saveData.KoruLevel; j++)
                {
                    KoruLevelUp();
                }
                KoruManaAdded?.Invoke(_totalKoruMana, _koruLevel);
            }
        }

        public float ProgessPercentage(float mana, int level)
        {
            float requiredToLevelUp = ManaRequiredToLevelUp(level + 1);
            float requiredForCurrentLevel = ManaRequiredToLevelUp(level);
            float requiredDifference = requiredToLevelUp - requiredForCurrentLevel;
            float manaMinusForCurrentLevel = mana - requiredForCurrentLevel;
            float percentageAchievedBetweenLevels = manaMinusForCurrentLevel / requiredDifference;
            return percentageAchievedBetweenLevels;
        }
    }
}
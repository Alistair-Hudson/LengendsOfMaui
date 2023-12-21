using AlictronicGames.LegendsOfMaui.Saving;
using AlictronicGames.LegendsOfMaui.StateMachines.Player;
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

        private float _manaPool = 0;
        private float _totalMatuMana = 0;
        private float _totalKoruMana = 0;
        private int _matuLevel = 0;
        private int _koruLevel = 0;

        private void Awake()
        {
            _playerStateMachine = GetComponent<PlayerStateMachine>();
        }

        private void MatuLevelUp()
        {
            _matuLevel++;
            var matuLevelData = _progessionTable.MatuDatas[_matuLevel];
            _playerStateMachine.IncreaseAdditionalAttackDamage(matuLevelData.AttackDamageIncrease);
            if (matuLevelData.IncreaseNumberOfAttacks)
            {
                _playerStateMachine.AddAttack(null);
            }
        }

        private void KoruLevelUp()
        {
            _koruLevel++;
            var koruData = _progessionTable.KoruDatas[_koruLevel];
            _playerStateMachine.Health.SetMaxHealth(_playerStateMachine.Health.MaxHealth + koruData.MaxHealthIncrease);
            _playerStateMachine.Health.SetHealthRegen(_playerStateMachine.Health.HealthRegenPerSecond + koruData.HealthRegenIncrease);
        }

        public void AddManaToMatu(float mana)
        {
            _totalMatuMana += mana;
            if (/*level up formula*/false)
            {
                MatuLevelUp();
            }

        }

        public void AddManaToKoru(float mana)
        {
            _totalKoruMana += mana;
            if (/*level up formula*/false)
            {
                KoruLevelUp();
            }

        }

        public void AddManaToPool(float mana)
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

                for (int j = 0; j <= saveData.KoruLevel; j++)
                {
                    KoruLevelUp();
                }
            }

        }
    }
}
using System.Collections;
using System.Collections.Generic;
using Sirenix.OdinInspector;
using Sirenix.Serialization;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    [CreateAssetMenu(fileName = "[Stats]", menuName = "EnemyStats", order = 0)]
    public class EnemyStats : SerializedScriptableObject
    {
        [field: SerializeField] 
        public string Name { get; private set; } = "";
        [field: SerializeField]
        public float Health { get; private set; } = 0f;
        [field: SerializeField]
        public float FlinchThreshold { get; private set; } = 0;
        [field: SerializeField]
        public float ChaseRange { get; private set; } = 0f;
        [field: SerializeField]
        public float MovementSpeed { get; private set; } = 0f;
        [field: Space]
        [Header("Attack Data")]
        [field: SerializeField]
        public float AttackRange { get; private set; } = 0f;
        [field: SerializeField]
        public float AttackDamage { get; private set; } = 0f;
        [field: SerializeField]
        public float KnockBackForce { get; private set; } = 0f;
        [field: Space]
        [field: SerializeField]
        public float ManaDrop { get; private set; } = 0f;
        [field: Space]
        [field: SerializeField]
        public bool IsAerial { get; private set; } = false;
        [field: SerializeField]
        public bool IsNocternal { get; private set; } = false;
        [field: OdinSerialize]
        public Dictionary<string, AudioClip> SoundBank { get; private set; } = new Dictionary<string, AudioClip>();
    }
}
using AlictronicGames.LegendsOfMaui.Saving;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Stats
{
    [CreateAssetMenu(fileName = "PlayerStats", menuName = "Player Stats", order = 0)]
    public class PlayerStats : ScriptableObject, ISaveable
    {
        [Header("Combat Stats")]
        [field: SerializeField]
        public float MaxHealth = 100f;
        [field: SerializeField]
        public float FlinchThreshold = 10f;
        [field: SerializeField] 
        public float HealthRegen = 1f;

        [field: Space]
        [field: Header("Static Fields")]
        [field: SerializeField]
        public float FreeLookMovementSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float TargetingMovementSpeed { get; private set; } = 6f;
        [field: SerializeField]
        public float MaxFlyingHeight { get; private set; } = 10f;
        [field: SerializeField]
        public float DodgeDuration { get; private set; } = 0.1f;
        [field: SerializeField]
        public float DodgeDistance { get; private set; } = 1f;
        [field: SerializeField]
        public float JumpForce { get; private set; } = 4f;

        public object CaptureState()
        {
            return this;
        }

        public void RestoreState(object state)
        {
            if (state is not PlayerStats stats)
            {
                return;
            }

            MaxHealth = stats.MaxHealth;
            HealthRegen = stats.HealthRegen;
            FlinchThreshold = stats.FlinchThreshold;

            FreeLookMovementSpeed = stats.FreeLookMovementSpeed;
            TargetingMovementSpeed = stats.TargetingMovementSpeed;
            MaxFlyingHeight = stats.MaxFlyingHeight;
            DodgeDuration = stats.DodgeDuration;
            DodgeDistance = stats.DodgeDistance;
            JumpForce = stats.JumpForce;
        }
    }
}
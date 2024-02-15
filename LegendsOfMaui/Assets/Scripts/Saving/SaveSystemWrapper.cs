using Sirenix.OdinInspector;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Saving
{
    [RequireComponent(typeof(SavingSystem))]
    public class SaveSystemWrapper : MonoBehaviour
    {
        private static SavingSystem savingSystem = null;

        private void Awake()
        {
            savingSystem = GetComponent<SavingSystem>();
        }

        [Button("Quick Load")]
        public static void Load(string fileName)
        {
            savingSystem.Load(fileName);
        }

        [Button("Quick Save")]
        public static void Save(string fileName)
        {
            savingSystem.Save(fileName);
        }
    }
}
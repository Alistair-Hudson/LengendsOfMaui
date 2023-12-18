using AlictronicGames.LegendsOfMaui.Stats;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Editor
{
    public class CSVToSO : MonoBehaviour
    {
        private static string _progressCSVPath = "/Editor/CSVs/Moves.csv";
        private static string _monstersCSVPath = "/Editor/CSVs/Monsters";

        [MenuItem("Tools/Generate Monster Stats")]
        public static void GenerateMonsterStats()
        {
            string[] CSVs = Directory.GetFiles(Application.dataPath + _monstersCSVPath);
            foreach (string csv in CSVs)
            {
                if (csv.EndsWith(".csv"))
                {
                    GenerateMonsterStatsForMonster(csv);
                }
            }
        }

        private static void GenerateMonsterStatsForMonster(string csv)
        {
            string fileName = csv.Remove(0, (Application.dataPath + _monstersCSVPath).Length + 1);
            fileName = fileName.TrimEnd('.', 'c', 's', 'v');
            
            MonsterStats monsterStats = AssetDatabase.LoadAssetAtPath($"Assets/Resources/MonsterStats/{fileName}.asset", typeof(MonsterStats)) as MonsterStats;
            if (!monsterStats)
            {
                monsterStats = ScriptableObject.CreateInstance<MonsterStats>();
                AssetDatabase.CreateAsset(monsterStats, $"Assets/Resources/MonsterStats/{fileName}.asset");
            }

            string[] lines = File.ReadAllLines(csv);
            for (int i = 1; i < lines.Length; i++)
            {
                string[] line = lines[i].Split(',');
                monsterStats.SetMonsterStats();
            }
        }
    }
}
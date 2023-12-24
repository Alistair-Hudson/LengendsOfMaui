using AlictronicGames.LegendsOfMaui.Stats;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Editor
{
    public class CSVToSO
    {
        private static string _matuProgressCSVPath = "/Editor/CSVs/MatuProgress.csv";
        private static string _koruProgressCSVPath = "/Editor/CSVs/KoruProgress.csv";
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
                monsterStats.SetMonsterStats(i, line);
            }
        }

        [MenuItem("Tools/Generate Player Progession Stats")]
        public static void GeneratePlayerProgessionStats()
        {
            string[] matuLines = File.ReadAllLines(Application.dataPath + _matuProgressCSVPath);
            string[] koruLines = File.ReadAllLines(Application.dataPath + _koruProgressCSVPath);
            if (matuLines.Length != koruLines.Length)
            {
                Debug.LogError("Ensure that the number of Matu levels and Koru Levels are equal");
            }

            for (int i = 0; i < matuLines.Length; i++)
            {
                string[] matuLine = matuLines[i].Split(',');
                string[] koruLine = koruLines[i].Split(',');
                PlayerProgessionTable playerProgession = AssetDatabase.LoadAssetAtPath("Assets/Resources/PlayerProgression.asset", typeof(PlayerProgessionTable)) as PlayerProgessionTable;
                if (playerProgession)
                {
                    playerProgession.SetStat(i, matuLine, koruLine);
                }
                else
                {
                    playerProgession = ScriptableObject.CreateInstance<PlayerProgessionTable>();
                    playerProgession.SetStat(i, matuLine, koruLine);
                    AssetDatabase.CreateAsset(playerProgession, "Assets/Resources/PlayerProgression.asset");
                }

                AssetDatabase.SaveAssets();
            }
        }
    }
}
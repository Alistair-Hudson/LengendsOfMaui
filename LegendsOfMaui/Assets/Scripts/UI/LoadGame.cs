using AlictronicGames.LegendsOfMaui.Saving;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class LoadGame : MonoBehaviour
{
    [SerializeField]
    private TMP_Text _name = null;
    [SerializeField]
    private TMP_Text _date = null;

    private string fileName = "";

    public void Setup(string name, string date, string fileName)
    {
        _name.text = name;
        _date.text = date;
        this.fileName = fileName;
    }

    public void Load()
    {
        SaveSystemWrapper.Load(fileName);
    }
}

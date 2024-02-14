using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PersitantSystems : MonoBehaviour
{
    private void Awake()
    {
        var persitantSyatems = FindObjectsByType<PersitantSystems>(FindObjectsSortMode.None);
        if (persitantSyatems.Length > 1)
        {
            Destroy(gameObject);
        }
        else
        {
            DontDestroyOnLoad(gameObject);
        }
    }
}

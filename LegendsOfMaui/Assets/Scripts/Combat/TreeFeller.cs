using System;
using System.Collections;
using System.Collections.Generic;
using AlictronicGames.LegendsOfMaui.Combat;
using AlictronicGames.LegendsOfMaui.Combat.Weapons;
using UnityEngine;

public class TreeFeller : MonoBehaviour
{
    [SerializeField] 
    private float _fellTime = 3.0f;

    public void StartFell()
    {
        StartCoroutine(RotationLerp());
    }

    private IEnumerator RotationLerp()
    {
        float time = 0.0f;
        Vector3 currentRotation = transform.rotation.eulerAngles;
        Vector3 finalRotation = currentRotation + Vector3.right * 90.0f;

        while (time < _fellTime)
        {
            Vector3 newRotation = Vector3.Lerp(currentRotation, finalRotation, time / _fellTime);
            transform.rotation = Quaternion.Euler(newRotation);
            yield return null;
            time += Time.deltaTime;
        }

        transform.rotation = Quaternion.Euler(finalRotation);
    }
}

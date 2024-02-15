using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PressToBegin : MonoBehaviour
{
    [SerializeField]
    private GameObject _menu = null;

    private void Update()
    {
        if (Input.anyKeyDown)
        {
            _menu.SetActive(true);
            gameObject.SetActive(false);
        }
    }
}

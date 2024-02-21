using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class SetSelecetedElement : MonoBehaviour
{
    [SerializeField]
    private GameObject objectToSet = null;

    private void OnEnable()
    {
        if (objectToSet)
        {
            EventSystem.current.SetSelectedGameObject(objectToSet);
        }
    }
}

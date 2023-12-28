using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class HeldButtonHandler : MonoBehaviour, IPointerDownHandler, IPointerUpHandler
{
    [SerializeField]
    private UnityEvent _buttonActionCall = null;

    private bool _isHeld = false;

    private void Update()
    {
        if (_isHeld)
        {
            _buttonActionCall?.Invoke();
        }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        _isHeld = true;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        _isHeld = false;
    }
}

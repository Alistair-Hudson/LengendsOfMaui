using AlictronicGames.LegendsOfMaui.StateMachines;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.UI
{
    [RequireComponent(typeof(TMP_Text))]
    public class NameDisplay : MonoBehaviour
    {
        private TMP_Text _nameDisplay = null;

        private void Awake()
        {
            _nameDisplay = GetComponent<TMP_Text>();
            _nameDisplay.text = GetComponentInParent<StateMachine>().Name;
        }
    }
}
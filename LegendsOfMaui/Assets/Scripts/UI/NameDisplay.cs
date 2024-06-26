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
        private TMP_Text _nameDisplay;

        private void OnEnable()
        {
            _nameDisplay = GetComponent<TMP_Text>();
            string name = GetComponentInParent<StateMachine>().gameObject.name;
            name = name.Replace("(Clone)", "");
            _nameDisplay.text = name;
        }
    }
}
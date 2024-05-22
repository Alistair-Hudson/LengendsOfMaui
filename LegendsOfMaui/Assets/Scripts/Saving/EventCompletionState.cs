using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Saving
{
    [RequireComponent(typeof(SaveableEntity))]
    public class EventCompletionState : MonoBehaviour, ISaveable
    {
        public enum EventState
        {
            Waiting = 0,
            Active,
            Completed
        }

        [SerializeField]
        private EventState eventState = EventState.Waiting;

        public EventState EventStatus { get => eventState; }

        private void Awake()
        {
            if (eventState != EventState.Active)
            {
                gameObject.SetActive(false);
            }
        }

        public void SetEventActive()
        {
            eventState = EventState.Active;
        }

        public void SetEventComplete()
        {
            eventState = EventState.Completed;
        }

        public object CaptureState()
        {
            return eventState;
        }

        public void RestoreState(object state)
        {
            eventState = (EventState)state;
            if (eventState != EventState.Active)
            {
                gameObject.SetActive(false);
            }
        }
    }
}
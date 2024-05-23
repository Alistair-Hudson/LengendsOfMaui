using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Saving
{
    [ExecuteAlways]
    public class SaveableEntity : MonoBehaviour
    {
        [SerializeField]
        private string _uniqueId = "";

        private static Dictionary<string, SaveableEntity> _globalLookUp = new Dictionary<string, SaveableEntity>();

        #region PublicMethods
        public string GetUniqueId()
        {
            return _uniqueId;
        }

        public object CaptureState()
        {
            Dictionary<string, object> state = new Dictionary<string, object>();
            ISaveable[] saveables = GetComponents<ISaveable>();
            foreach (ISaveable saveable in saveables)
            {
                state[saveable.GetType().ToString()] = saveable.CaptureState();
            }
            return state;
        }

        public void RestoreState(object state)
        {
            Dictionary<string, object> stateDict = (Dictionary<string, object>)state;
            ISaveable[] saveables = GetComponents<ISaveable>();
            foreach(ISaveable saveable in saveables)
            {
                string typeString = saveable.GetType().ToString();
                if (stateDict.ContainsKey(typeString))
                {
                    saveable.RestoreState(stateDict[typeString]);
                }
            }
        }
        #endregion

        #region PrivateMethods
#if UNITY_EDITOR
        private void Update()
        {
            if (Application.IsPlaying(gameObject))
            {
                return;
            }
            if (string.IsNullOrEmpty(gameObject.scene.path))
            {
                return;
            }

            SerializedObject serializedObject = new SerializedObject(this);
            SerializedProperty property = serializedObject.FindProperty("_uniqueId");

            if (string.IsNullOrEmpty(property.stringValue) || !IsUnique(property.stringValue))
            {
                property.stringValue = System.Guid.NewGuid().ToString();
                serializedObject.ApplyModifiedProperties();
            }

            _globalLookUp[property.stringValue] = this;
        }
#endif
        private bool IsUnique(string candidate)
        {
            if (!_globalLookUp.ContainsKey(candidate))
            {
                return true;
            }

            if (_globalLookUp[candidate] == this)
            {
                return true;
            }

            if (_globalLookUp[candidate] == null)
            {
                _globalLookUp.Remove(candidate);
                return true;
            }

            if (_globalLookUp[candidate].GetUniqueId() != candidate)
            {
                _globalLookUp.Remove(candidate);
                return true;
            }

            return false;
        }
        #endregion
    }
}
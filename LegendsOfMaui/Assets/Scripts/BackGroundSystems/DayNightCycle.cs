using AlictronicGames.LegendsOfMaui.Saving;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.BackGroundSystems
{
    public class DayNightCycle : MonoBehaviour, ISaveable
    {
        [SerializeField]
        private float _fullDayLength = 0;
        [SerializeField]
        private float _startTime = 0;
        [SerializeField]
        private Vector3 _noonRotation;

        [Header("Sun")]
        [SerializeField]
        private Light _sun = null;
        [SerializeField]
        private Gradient _sunColour;
        [SerializeField]
        private AnimationCurve _sunIntensity;

        [Header("Moon")]
        [SerializeField]
        private Light _moon = null;
        [SerializeField]
        private Gradient _moonColour;
        [SerializeField]
        private AnimationCurve _moonIntensity;

        [Header("Other Lighting")]
        [SerializeField]
        private AnimationCurve _lightingIntensityMultiplier;
        [SerializeField]
        private AnimationCurve _reflectionsIntensityMultiplier;

        private float _timeRate = 0;
        
        public static float Time { get; private set; } = 0;

        private void Awake()
        {
            _timeRate = 1 / _fullDayLength;
            Time = _startTime;
        }

        private void Update()
        {
            Time += _timeRate * UnityEngine.Time.deltaTime;
            while (Time >= 1)
            {
                Time--;
            }

            _sun.transform.eulerAngles = (Time - 0.25f) * _noonRotation * 4;
            _moon.transform.eulerAngles = (Time - 0.75f) * _noonRotation * 4;

            _sun.intensity = _sunIntensity.Evaluate(Time);
            _moon.intensity = _moonIntensity.Evaluate(Time);

            _sun.color = _sunColour.Evaluate(Time);
            _moon.color = _moonColour.Evaluate(Time);

            ActivateDeactivateLight(_sun);
            ActivateDeactivateLight(_moon);

            RenderSettings.ambientIntensity = _lightingIntensityMultiplier.Evaluate(Time);
            RenderSettings.reflectionIntensity = _reflectionsIntensityMultiplier.Evaluate(Time);
        }

        private void ActivateDeactivateLight(Light light)
        {
            if (light.intensity == 0 && light.gameObject.activeInHierarchy)
            {
                light.gameObject.SetActive(false);
            }
            else if (light.intensity > 0 && light.gameObject.activeInHierarchy)
            {
                light.gameObject.SetActive(true);
            }
        }

        public object CaptureState()
        {
            return Time;
        }

        public void RestoreState(object state)
        {
            if (state is float)
            {
                Time = (float)state;
            }
        }
    }
}
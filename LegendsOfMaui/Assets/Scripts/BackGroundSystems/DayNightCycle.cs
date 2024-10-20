using AlictronicGames.LegendsOfMaui.Saving;
using System;
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
        private static float _dawnTime = 0.3f;
        [SerializeField]
        private static float _duskTime = 0.7f;
        [SerializeField]
        private float _xAngleOffset = 30;
        [SerializeField]
        private AnimationCurve _celestialRotation;

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
        public static bool IsNight { get => !(Time > _dawnTime && Time < _duskTime); }

        public static Action<bool> NightIsActiveEvent;
        public static Action<bool> DayIsActiveEvent;

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

            NightIsActiveEvent?.Invoke(IsNight);
            DayIsActiveEvent?.Invoke(!IsNight);

            transform.eulerAngles =  new Vector3(_xAngleOffset, 0, Time * 360);
            var celestialRotation = _celestialRotation.Evaluate(Time);
            _sun.transform.localEulerAngles= new Vector3(_sun.transform.localEulerAngles.x, 0, celestialRotation);
            _moon.transform.localEulerAngles = new Vector3(_moon.transform.localEulerAngles.x, 0, -celestialRotation);

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
            else if (light.intensity > 0 && !light.gameObject.activeInHierarchy)
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
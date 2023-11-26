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

        private float _time = 0;
        private float _timeRate = 0;

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

        private void Start()
        {
            _timeRate = 1 / _fullDayLength;
            _time = _startTime;
        }

        private void Update()
        {
            _time += _timeRate * Time.deltaTime;
            while (_time >= 1)
            {
                _time--;
            }

            _sun.transform.eulerAngles = (_time - 0.25f) * _noonRotation * 4;
            _moon.transform.eulerAngles = (_time - 0.75f) * _noonRotation * 4;

            _sun.intensity = _sunIntensity.Evaluate(_time);
            _moon.intensity = _moonIntensity.Evaluate(_time);

            _sun.color = _sunColour.Evaluate(_time);
            _moon.color = _moonColour.Evaluate(_time);

            ActivateDeactivateLight(_sun);
            ActivateDeactivateLight(_moon);

            RenderSettings.ambientIntensity = _lightingIntensityMultiplier.Evaluate(_time);
            RenderSettings.reflectionIntensity = _reflectionsIntensityMultiplier.Evaluate(_time);
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
            return _time;
        }

        public void RestoreState(object state)
        {
            if (state is float)
            {
                _time = (float)state;
            }
        }
    }
}
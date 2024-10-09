// /**
//  * Created by Pawel Homenko on  08/2022
//  */

namespace NatureManufacture.RAM
{
    using NatureManufacture.RAM;
    using UnityEditor;
    using UnityEngine;

    [CustomPropertyDrawer(typeof(TerrainNoiseParameters))]
    public class TerrainNoiseParametersDrawer : PropertyDrawer
    {
        private SerializedProperty _useUseNoise;
        private SerializedProperty _noiseMultiplierPower;
        private SerializedProperty _noiseMultiplierInside;
        private SerializedProperty _noiseMultiplierOutside;
        private SerializedProperty _noiseSizeX;
        private SerializedProperty _noiseSizeZ;

        private float _nextPositionY;

        private Rect GetNextPosition(Rect currentPos)
        {
            Rect rect = new Rect(currentPos.x, currentPos.y + _nextPositionY, currentPos.width, EditorGUIUtility.singleLineHeight);
            _nextPositionY += EditorGUIUtility.singleLineHeight + 2;

            return rect;
        }

        public override float GetPropertyHeight(SerializedProperty property, GUIContent label)
        {
            _useUseNoise = property.FindPropertyRelative("useNoise");
            _noiseMultiplierPower = property.FindPropertyRelative("noiseMultiplierPower");
            _noiseMultiplierInside = property.FindPropertyRelative("noiseMultiplierInside");
            _noiseMultiplierOutside = property.FindPropertyRelative("noiseMultiplierOutside");
            _noiseSizeX = property.FindPropertyRelative("noiseSizeX");
            _noiseSizeZ = property.FindPropertyRelative("noiseSizeZ");

            float totalHeight = 0;
            totalHeight += EditorGUI.GetPropertyHeight(_useUseNoise);

            if (!_useUseNoise.boolValue) return totalHeight;

            totalHeight += EditorGUI.GetPropertyHeight(_noiseMultiplierPower) + 2;
            totalHeight += EditorGUI.GetPropertyHeight(_noiseMultiplierInside) + 2;
            totalHeight += EditorGUI.GetPropertyHeight(_noiseMultiplierOutside) + 2;
            totalHeight += EditorGUI.GetPropertyHeight(_noiseSizeX) + 2;
            totalHeight += EditorGUI.GetPropertyHeight(_noiseSizeZ) + 2;

            return totalHeight;
        }


        public override void OnGUI(Rect position, SerializedProperty property, GUIContent label)
        {
            _nextPositionY = 0;

            _useUseNoise = property.FindPropertyRelative("useNoise");
            _noiseMultiplierPower = property.FindPropertyRelative("noiseMultiplierPower");
            _noiseMultiplierInside = property.FindPropertyRelative("noiseMultiplierInside");
            _noiseMultiplierOutside = property.FindPropertyRelative("noiseMultiplierOutside");
            _noiseSizeX = property.FindPropertyRelative("noiseSizeX");
            _noiseSizeZ = property.FindPropertyRelative("noiseSizeZ");

            EditorGUI.BeginProperty(position, label, property);


            EditorGUI.PropertyField(GetNextPosition(position), _useUseNoise);
            if (_useUseNoise.boolValue)
            {
                EditorGUI.indentLevel++;
                EditorGUI.PropertyField(GetNextPosition(position), _noiseMultiplierPower);
                EditorGUI.PropertyField(GetNextPosition(position), _noiseMultiplierInside);
                EditorGUI.PropertyField(GetNextPosition(position), _noiseMultiplierOutside);
                EditorGUI.PropertyField(GetNextPosition(position), _noiseSizeX);
                EditorGUI.PropertyField(GetNextPosition(position), _noiseSizeZ);
                EditorGUI.indentLevel--;
            }

            EditorGUI.EndProperty();
        }
    }
}
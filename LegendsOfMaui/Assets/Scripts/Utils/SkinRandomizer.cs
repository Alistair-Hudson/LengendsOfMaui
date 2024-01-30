using Sirenix.OdinInspector;
using Sirenix.Serialization;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace AlictronicGames.LegendsOfMaui.Utils
{
    public class SkinRandomizer : SerializedMonoBehaviour
    {
        [SerializeField]
        private string textureMapInput = "_BaseMap";
        [OdinSerialize]
        private Dictionary<Renderer, Texture[]> skinLUT = new Dictionary<Renderer, Texture[]>();

        private void OnEnable()
        {
            foreach (Renderer renderer in skinLUT.Keys)
            {
                SelectandApplyRandomSkin(renderer);
            }
        }

        [Button("Generate")]
        private void SelectandApplyRandomSkin(Renderer renderer)
        {
            Material newMaterial = new Material(renderer.material);
            int selectedIndex = UnityEngine.Random.Range(0, skinLUT[renderer].Length);
            newMaterial.SetTexture(textureMapInput, skinLUT[renderer][selectedIndex]);
            renderer.material = newMaterial;
        }
    }
}
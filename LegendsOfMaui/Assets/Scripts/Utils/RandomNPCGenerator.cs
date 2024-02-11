using Sirenix.OdinInspector;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomNPCGenerator : MonoBehaviour
{
    [SerializeField]
    private GameObject[] Heads;
    [SerializeField]
    private GameObject[] HairStyles;
    [SerializeField]
    private Material[] HairColours;
    [SerializeField]
    private Material[] TaoMokos;

    [SerializeField]
    private bool autoGenerateOnEnable = false;

    private void OnEnable()
    {
        if (autoGenerateOnEnable)
        {
            GenerateNPC();
        }
    }

    [Button("Generate NPC")]
    public void GenerateNPC()
    {
        HideGameObjects(Heads);
        HideGameObjects(HairStyles);

        int randomHeadIndex = UnityEngine.Random.Range(0, Heads.Length);
        int randomHairStyleIndex = UnityEngine.Random.Range(0, HairStyles.Length);
        int randomHairColourIndex = UnityEngine.Random.Range(0, HairColours.Length);
        int randomTaoMokoIndex = UnityEngine.Random.Range(0, TaoMokos.Length);

        GameObject head = Heads[randomHeadIndex];
        head.SetActive(true);
        if (head.TryGetComponent<MeshRenderer>(out var meshRender))
        {
            meshRender.material = TaoMokos[randomTaoMokoIndex];
        }
        else if (head.TryGetComponent<SkinnedMeshRenderer>(out var skinRender))
        {
            skinRender.material = TaoMokos[randomTaoMokoIndex];
        }
        else
        {
            Debug.LogError("No Mesh found for the Head");
        }

        GameObject hairstyle = HairStyles[randomHairStyleIndex];
        hairstyle.SetActive(true);
        if (hairstyle.TryGetComponent<MeshRenderer>(out var hairMeshRender))
        {
            hairMeshRender.material = HairColours[randomHairColourIndex];
        }
        else if (hairstyle.TryGetComponent<SkinnedMeshRenderer>(out var skinRender))
        {
            skinRender.material = HairColours[randomHairColourIndex];
        }
        else
        {
            Debug.LogError("No mesh found for the Hair");
        }
    }

    private void HideGameObjects(GameObject[] gameObjects)
    {
        foreach (var item in gameObjects)
        {
            item.SetActive(false);
        }
    }
}

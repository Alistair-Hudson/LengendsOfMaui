using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class LoadSaveGamesList : MonoBehaviour
{
    [SerializeField]
    private LoadGame saveGameTemplatePrefab = null;
    [SerializeField]
    private Button backButton = null;
    [SerializeField]
    private GameObject contentHolder = null;

    private void OnEnable()
    {
        var saveFiles = Directory.GetFiles(Application.persistentDataPath);
        bool isFirstSelected = false;

        if (saveFiles.Length <= 0)
        {
            EventSystem.current.SetSelectedGameObject(backButton.gameObject);
            return;
        }

        foreach (var saveFile in saveFiles)
        {
            if (!saveFile.EndsWith(".sav"))
            {
                continue;
            }
            var saveInstance = Instantiate(saveGameTemplatePrefab, contentHolder.transform);
            string[] pathComponents = saveFile.Split('/');
            string name = pathComponents[pathComponents.Length - 1];
            var lastWriteTime = File.GetLastWriteTimeUtc(saveFile);
            saveInstance.Setup(name, lastWriteTime.ToString());
            if (!isFirstSelected)
            {
                EventSystem.current.SetSelectedGameObject(saveInstance.gameObject);
            }
        }
    }

    private void OnDisable()
    {
        for (int i = contentHolder.transform.childCount - 1; i >= 0; i--)
        {
            Destroy(contentHolder.transform.GetChild(i).gameObject);
        }
    }
}

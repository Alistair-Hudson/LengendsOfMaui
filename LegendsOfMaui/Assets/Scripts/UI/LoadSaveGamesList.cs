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
            var saveInstance = Instantiate(saveGameTemplatePrefab, transform);
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
}

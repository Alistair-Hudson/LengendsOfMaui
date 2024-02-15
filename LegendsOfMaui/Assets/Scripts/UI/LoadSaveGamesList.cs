using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;

public class LoadSaveGamesList : MonoBehaviour
{
    [SerializeField]
    private LoadGame saveGameTemplatePrefab = null;

    private void OnEnable()
    {
        var saveFiles = Directory.GetFiles(Application.persistentDataPath);

        foreach (var saveFile in saveFiles)
        {
            var saveInstance = Instantiate(saveGameTemplatePrefab, transform);
            string[] pathComponents = saveFile.Split('/');
            string name = pathComponents[pathComponents.Length - 1];
            var lastWriteTime = File.GetLastWriteTimeUtc(saveFile);
            saveInstance.Setup(name, lastWriteTime.ToString());
        }
    }
}

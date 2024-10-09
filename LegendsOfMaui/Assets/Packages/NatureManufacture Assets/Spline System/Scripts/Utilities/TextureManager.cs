using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


namespace NatureManufacture.RAM
{
    public class TextureManager : MonoBehaviour
    {
        public static Texture2D ToTexture2D(RenderTexture rTex, TextureFormat format)
        {
           
            Texture2D tex = new Texture2D(rTex.width, rTex.height, format, false);
            var currentActiveRT = RenderTexture.active;
            RenderTexture.active = rTex;

            tex.ReadPixels(new Rect(0, 0, rTex.width, rTex.height), 0, 0);
            tex.Apply();

            RenderTexture.active = currentActiveRT;
            return tex;
        }

        public static void SaveTexture(RenderTexture texture, TextureFormat format)
        {
            SaveTexture(ToTexture2D(texture, format));
        }

        public static void SaveTexture(Texture2D texture)
        {
            byte[] bytes = texture.EncodeToPNG();
            var dirPath = Application.dataPath + "/RenderOutput";
            if (!System.IO.Directory.Exists(dirPath))
            {
                System.IO.Directory.CreateDirectory(dirPath);
            }

            System.IO.File.WriteAllBytes(dirPath + "/R_" + DateTime.Now.ToString("yyMMddhhmmss") + ".png", bytes);
            Debug.Log(bytes.Length / 1024 + "Kb was saved as: " + dirPath);
#if UNITY_EDITOR
            UnityEditor.AssetDatabase.Refresh();
#endif
        }
    }
}
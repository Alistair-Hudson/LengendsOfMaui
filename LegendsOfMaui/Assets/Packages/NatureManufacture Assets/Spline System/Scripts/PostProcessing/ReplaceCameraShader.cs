using UnityEngine.Rendering;

namespace NatureManufacture.RAM
{
    using UnityEngine;

    [ExecuteInEditMode]
    public class ReplaceCameraShader : MonoBehaviour
    {
        public Camera mainCamera; // main camera

        private Camera cameraComp; // second camera

        public Shader replacedWith;
        public static readonly string targetTextureName = "_TransparencyFocusMask";
        public static readonly string targetDepthName = "_DepthFocusMask";

        public int resolutionX = 32;
        public int resolutionY = 32;

        private RenderTexture target;
        private RenderTexture targetDepth;

        private void OnEnable()
        {
            if (mainCamera != null)
            {
                cameraComp = GetComponent<Camera>();
                cameraComp.depthTextureMode = DepthTextureMode.None;

                if (replacedWith != null)
                    cameraComp.SetReplacementShader(replacedWith, "RenderType");

                //cameraComp.SetReplacementShader(replacedWith, "Focused");


                target = new RenderTexture(resolutionX, resolutionY, 24, RenderTextureFormat.ARGBFloat);
                targetDepth = new RenderTexture(resolutionX, resolutionY, 24, RenderTextureFormat.Depth);
                cameraComp.targetTexture = target;
                Shader.SetGlobalTexture(targetTextureName, target);
                Shader.SetGlobalTexture(targetDepthName, targetDepth);

                cameraComp.SetTargetBuffers(target.colorBuffer, targetDepth.depthBuffer);
            }
            
          
        }

        private void OnDisable()
        {
            cameraComp = GetComponent<Camera>();
            cameraComp.ResetReplacementShader();

            if (cameraComp.targetTexture != null)
            {
                RenderTexture temp = cameraComp.targetTexture;
                cameraComp.targetTexture = null;
                DestroyImmediate(temp);
            }

            target = null;
            targetDepth = null;
            Shader.SetGlobalTexture(targetDepthName, targetDepth);
            Shader.SetGlobalTexture(targetTextureName, target);
        }
    }
}
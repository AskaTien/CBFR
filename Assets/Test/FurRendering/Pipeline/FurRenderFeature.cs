using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class FurRenderFeature : ScriptableRendererFeature
{
    [System.Serializable]
    public class FurRenderSettings
    {
        public string passTag = "FurRenderFeature";
        public RenderPassEvent Event = RenderPassEvent.AfterRenderingTransparents;

        public FilterSettings filterSettings = new FilterSettings();

        public Material overrideMaterial = null;
        public int overrideMaterialPassIndex = 0;
    }

    [System.Serializable]
    public class FilterSettings
    {
        public LayerMask LayerMask;
        public string[] PassNames;

        public FilterSettings()
        {
            LayerMask = 0;
        }
    }

    [System.Serializable]
    public class CustomCameraSettings
    {
        public bool overrideCamera = false;
        public bool restoreCamera = true;
        public Vector4 offset;
        public float cameraFieldOfView = 60.0f;
    }

    public FurRenderSettings settings = new FurRenderSettings();

    FurRenderPass furRenderPass;

    public override void Create()
    {
        FilterSettings filter = settings.filterSettings;
        furRenderPass = new FurRenderPass(settings.passTag, settings.Event, filter.PassNames, filter.LayerMask);

        furRenderPass.overrideMaterial = settings.overrideMaterial;
        furRenderPass.overrideMaterialPassIndex = settings.overrideMaterialPassIndex;
    }

    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
    {
        renderer.EnqueuePass(furRenderPass);
    }
}


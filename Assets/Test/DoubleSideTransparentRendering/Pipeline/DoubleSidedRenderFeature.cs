using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class DoubleSidedRenderFeature : ScriptableRendererFeature
{
    DrawBackFacePass m_DrawBackFacePass;

    public override void Create()
    {
        StencilStateData stencilData = new StencilStateData();
        StencilState m_DefaultStencilState = StencilState.defaultValue;
        m_DefaultStencilState.enabled = stencilData.overrideStencilState;
        m_DefaultStencilState.SetCompareFunction(stencilData.stencilCompareFunction);
        m_DefaultStencilState.SetPassOperation(stencilData.passOperation);
        m_DefaultStencilState.SetFailOperation(stencilData.failOperation);
        m_DefaultStencilState.SetZFailOperation(stencilData.zFailOperation);

        m_DrawBackFacePass = new DrawBackFacePass("Render Back Face", false, RenderPassEvent.BeforeRenderingTransparents, RenderQueueRange.transparent, -1, m_DefaultStencilState, stencilData.stencilReference);
    }

    // Here you can inject one or multiple render passes in the renderer.
    // This method is called when setting up the renderer once per-camera.
    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
    {
        renderer.EnqueuePass(m_DrawBackFacePass);
    }
}



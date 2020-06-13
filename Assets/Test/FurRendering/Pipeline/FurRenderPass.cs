using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public class FurRenderPass : ScriptableRenderPass
{
    FilteringSettings m_FilteringSettings;
    string m_ProfilerTag;
    ProfilingSampler m_ProfilingSampler;

    public Material overrideMaterial { get; set; }
    public int overrideMaterialPassIndex { get; set; }

    List<ShaderTagId> m_ShaderTagIdList = new List<ShaderTagId>();

    RenderStateBlock m_RenderStateBlock;

    public FurRenderPass(string profilerTag, RenderPassEvent renderPassEvent, string[] shaderTags, int layerMask)
    {
        m_ProfilerTag = profilerTag;
        m_ProfilingSampler = new ProfilingSampler(profilerTag);
        this.renderPassEvent = renderPassEvent;
        this.overrideMaterial = null;
        this.overrideMaterialPassIndex = 0;
        RenderQueueRange renderQueueRange = RenderQueueRange.opaque;
        m_FilteringSettings = new FilteringSettings(renderQueueRange, layerMask);

        if (shaderTags != null && shaderTags.Length > 0)
        {
            foreach (var passName in shaderTags)
                m_ShaderTagIdList.Add(new ShaderTagId(passName));
        }
        else
        {
            m_ShaderTagIdList.Add(new ShaderTagId("SRPDefaultUnlit"));
            m_ShaderTagIdList.Add(new ShaderTagId("UniversalForward"));
            m_ShaderTagIdList.Add(new ShaderTagId("LightweightForward"));
        }

        m_RenderStateBlock = new RenderStateBlock(RenderStateMask.Nothing);
    }

    public override void Execute(ScriptableRenderContext context, ref RenderingData renderingData)
    {
        SortingCriteria sortingCriteria = SortingCriteria.CommonTransparent;

        DrawingSettings drawingSettings = CreateDrawingSettings(m_ShaderTagIdList, ref renderingData, sortingCriteria);
        drawingSettings.overrideMaterial = overrideMaterial;


        CommandBuffer cmd = CommandBufferPool.Get(m_ProfilerTag);
        using (new ProfilingScope(cmd, m_ProfilingSampler))
        {

            context.ExecuteCommandBuffer(cmd);
            cmd.Clear();

            for (int i = 0; i < overrideMaterialPassIndex; i++)
            { 
                drawingSettings.overrideMaterialPassIndex = i;
                context.DrawRenderers(renderingData.cullResults, ref drawingSettings, ref m_FilteringSettings, ref m_RenderStateBlock);
            }
        }
        context.ExecuteCommandBuffer(cmd);
        CommandBufferPool.Release(cmd);
    }
}

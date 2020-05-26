Shader "Hidden/TextureView"
{
    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline"}
        LOD 100
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        HLSLINCLUDE



        ENDHLSL

        Pass
        {
            Name "Depth Texture"
            HLSLPROGRAM
                #pragma vertex Vert
                #pragma fragment Frag
            
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"

                half4 Frag(Varyings input) : SV_Target
                {
                    half4 col;
                    col = SampleSceneDepth(input.uv);
                    return col;
                }
            ENDHLSL
        }

        Pass
        {
            Name "World Position"
            HLSLPROGRAM
                #pragma vertex Vert
                #pragma fragment Frag

                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"

                half4 Frag(Varyings input) : SV_Target
                {
                    half4 col;
                    col = SampleSceneDepth(input.uv);
                    return col;
                }
            ENDHLSL
        }

        Pass
        {
            Name "Opaque Texture"
            HLSLPROGRAM
                #pragma vertex Vert
                #pragma fragment Frag

                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareOpaqueTexture.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"

                half4 Frag(Varyings input) : SV_Target
                {
                    half4 col;
                    col.rgb = SampleSceneColor(input.uv);
                    return col;
                }
            ENDHLSL
        }
    }
}

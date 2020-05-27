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
                #pragma vertex VertWS
                #pragma fragment Frag

                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"

                struct VaryingsWS
                {
                    float4 positionCS    : SV_POSITION;
                    float4 uv            : TEXCOORD0;
                    UNITY_VERTEX_OUTPUT_STEREO
                };

                VaryingsWS VertWS(Attributes input)
                {
                    VaryingsWS output;
                    UNITY_SETUP_INSTANCE_ID(input);
                    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

                    output.positionCS = TransformObjectToHClip(input.positionOS.xyz);

                    float4 projPos = output.positionCS * 0.5;
                    projPos.xy = projPos.xy + projPos.w;

                    output.uv.xy = input.uv;
                    output.uv.zw = projPos.xy;

                    return output;
                }

                half4 Frag(VaryingsWS input) : SV_Target
                {
                    half4 col;

                    float depth = SAMPLE_TEXTURE2D_X(_CameraDepthTexture, sampler_PointClamp, input.uv.xy).r;
                    float3 worldPos = ComputeWorldSpacePosition(input.uv.zw, depth, unity_MatrixInvVP);

                    col.rgb = worldPos;

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

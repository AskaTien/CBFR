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
            Name "Slice"
            HLSLPROGRAM
                #pragma vertex Vert
                #pragma fragment Frag

                //CBUFFER_START(UnityPerMaterial)
                //half _NumSlices;
                //CBUFFER_END

                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"

                half4 Frag(Varyings input) : SV_Target
                {
                    half4 col;
                    float depth = LinearEyeDepth(SampleSceneDepth(input.uv), _ZBufferParams);

                    float _NumSlices = 31;
                    int slice = floor(log(depth) * _NumSlices / log(_ProjectionParams.z / _ProjectionParams.y) - _NumSlices * log(_ProjectionParams.y) / log(_ProjectionParams.z / _ProjectionParams.y));
                    
                    col.r = 1 - step(3, fmod(slice + 2, 6));
                    col.g = 1 - step(3, fmod(slice, 6));
                    col.b = 1 - step(3, fmod(slice + 4, 6));
                    col.a = 1;
                    
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
                #include "Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/Common.hlsl"
                #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DeclareDepthTexture.hlsl"


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

                    float depth = SampleSceneDepth(input.uv);
                    //float depth = SAMPLE_TEXTURE2D_X(_CameraDepthTexture, sampler_PointClamp, input.uv.xy).r;
#if UNITY_REVERSED_Z
                    depth = 1.0 - depth;
#endif

                    depth = 2.0 * depth - 1.0;


                    float3 worldPos = ComputeWorldSpacePosition(input.uv.zw, depth, unity_MatrixInvVP);
                    //float3 viewPos = ComputeViewSpacePosition(input.uv.zw, depth, unity_CameraInvProjection);
                    //float4 worldPos = float4(mul(unity_CameraToWorld, float4(viewPos, 1.0)).xyz, 1.0);

                    col.rgb = worldPos.rgb;

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

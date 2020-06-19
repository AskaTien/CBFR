Shader "Custom/NeneFur"
{
    Properties
    {
        [MainColor]   _BaseColor("Color", Color) = (0.042, 0.218, 1, 1)
        [MainTexture] _BaseMap("Base Map (RGB) Smoothness / Alpha (A)", 2D) = "white" {}

        _FurLength("Fur Length", Float) = 1
        _FurPattern("Fur Pattern", 2D) = "white" {}
        
        _FurRootThickness("Fur Root Thickness", Range(0, 2)) = 1
        _FurTipThickness("Fur Tip Thickness", Range(0, 1)) = 0.1
        _ThicknessRootToTipDistribution("Thickness Root to Tip Distribution", Float) = 1.0

        _AlphaOffset("Alpha Offset", Float) = 0
    }
    SubShader
    {
        Tags {"Queue" = "AlphaTest" "RenderType" = "TransparentCutout" "IgnoreProjector" = "True" "RenderPipeline" = "UniversalPipeline" }
        LOD 100

        //Blend[_SrcBlend][_DstBlend]
        //ZWrite On
        //Cull Back

        HLSLINCLUDE
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

        TEXTURE2D(_BaseMap);            SAMPLER(sampler_BaseMap);
        TEXTURE2D(_FurPattern);         SAMPLER(sampler_FurPattern);

        CBUFFER_START(UnityPerMaterial)
        float4 _BaseMap_ST;
        half4 _BaseColor;
        half _FurLength;
        float4 _FurPattern_ST;
        half _FurRootThickness;
        half _FurTipThickness;
        half _ThicknessRootToTipDistribution;
        half _AlphaOffset;
        CBUFFER_END


        struct Attributes
        {
            float4 positionOS       : POSITION;
            float3 normalOS         : NORMAL;
            float2 uv0               : TEXCOORD0;
            float2 uv1               : TEXCOORD1;
        };

        struct Varyings
        {
            float4 vertex    : SV_POSITION;
            float2 uv        : TEXCOORD0;
            float  thickness : TEXCOORD1;
            //float2  uv1 : TEXCOORD2;
        };

        Varyings vert(Attributes input)
        {
            Varyings output = (Varyings)0;

            VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
            output.vertex = vertexInput.positionCS;
            output.uv = input.uv0;
            //output.uv1 = input.uv1;

            output.thickness = lerp((1 - _FurRootThickness), (1 - _FurTipThickness), pow(abs(input.uv1.y), _ThicknessRootToTipDistribution));

            return output;
        }

        half4 frag(Varyings input) : SV_Target
        {
            half2 uv = input.uv;
            half4 diffuseAlpha = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, TRANSFORM_TEX(uv, _BaseMap));
            half3 diffuse = diffuseAlpha.rgb * _BaseColor.rgb;
            half fur = SAMPLE_TEXTURE2D(_FurPattern, sampler_FurPattern, TRANSFORM_TEX(uv, _FurPattern)).r;

            half alpha = fur - input.thickness;
            clip(alpha + _AlphaOffset);

            //diffuse.rbg = input.uv1.y;

            return half4(diffuse, alpha);
        }
        ENDHLSL

        Pass
        {
            Name "FUR_LAYER"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #pragma vertex vert
            #pragma fragment frag

            ENDHLSL
        }
    }
}

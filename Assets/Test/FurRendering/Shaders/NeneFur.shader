Shader "Custom/NeneFur"
{
    Properties
    {
        [MainColor]   _BaseColor("Color", Color) = (0.042, 0.218, 1, 1)

        _FurLength("Fur Length", Float) = 1
        _FurPattern("Fur Pattern", 2D) = "white" {}
        
        _FurRootThickness("Fur Root Thickness", Range(0, 1)) = 1
        _FurTipThickness("Fur Tip Thickness", Range(0, 1)) = 0.1
        _AlphaOffset("Alpha Offset", Float) = 0
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" "IgnoreProjector" = "True" "RenderPipeline" = "UniversalPipeline" }
        LOD 100

        //Blend[_SrcBlend][_DstBlend]
        ZWrite On
        Cull Back

        HLSLINCLUDE
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        
        #define _ALPHATEST_ON
        
        #define FURSTEP 0.0f

        CBUFFER_START(UnityPerMaterial)
        half4 _BaseColor;
        half _FurLength;
        float4 _FurPattern_ST;
        half _FurRootThickness;
        half _FurTipThickness;
        half _AlphaOffset;
        CBUFFER_END

        TEXTURE2D(_FurPattern);            SAMPLER(sampler_FurPattern);

        struct Attributes
        {
            float4 positionOS       : POSITION;
            float3 normalOS         : NORMAL;
            float2 uv               : TEXCOORD0;
        };

        struct Varyings
        {
            float4 vertex    : SV_POSITION;
            float2 uv        : TEXCOORD0;
            float  thickness : TEXCOORD1;
        };

        Varyings vert(Attributes input)
        {
            Varyings output = (Varyings)0;

            input.positionOS.xyz += _FurLength * FURSTEP * input.normalOS;

            VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
            output.vertex = vertexInput.positionCS;
            output.uv = TRANSFORM_TEX(input.uv, _FurPattern);

            output.thickness = lerp((1 - _FurRootThickness), (1 - _FurRootThickness), FURSTEP);

            return output;
        }

        half4 frag(Varyings input) : SV_Target
        {
            half2 uv = input.uv;
            half fur = SAMPLE_TEXTURE2D(_FurPattern, sampler_FurPattern, uv).r;
            half4 color = _BaseColor;

            half alpha = fur - input.thickness;
            AlphaDiscard(alpha, 0.0h, _AlphaOffset);

            return color;
        }
        ENDHLSL

        Pass
        {
            Name "FUR_LAYER_1"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x


            #pragma vertex vert
            #pragma fragment frag

            #define FURSTEP 0.05

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_2"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.1

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_3"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.15

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_4"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.2

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_5"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.25

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_6"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.3

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_7"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.35

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_8"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.4

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_9"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.45

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }

        Pass
        {
            Name "FUR_LAYER_10"
            HLSLPROGRAM
            // Required to compile gles 2.0 with standard srp library
            #pragma prefer_hlslcc gles
            #pragma exclude_renderers d3d11_9x

            #define FURSTEP 0.5

            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            ENDHLSL
        }
    }
}

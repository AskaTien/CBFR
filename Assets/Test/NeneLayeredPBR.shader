Shader "Nene/LayeredPBR"
{
	Properties
	{
		//[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		//[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		
		[KeywordEnum(One,Two,Three,Four,Five,Six,Seven,Eight)] _LayerNumbers("Layer Numbers", Float) = 0
		
		_WholeColor("Whole Color", Color) = (1,1,1,1)
		_WholePattern("Whole Pattern", 2D) = "black" {}
		_WholePatternColor("Whole Pattern Color", Color) = (1,1,1,1)
		_WholeNAOR("Whole NAOR", 2D) = "bump" {}
		_WholeNormalScale("Whole Normal Scale", Range(0 , 3)) = 1
		_WholeAOScale("Whole AO Scale", Range(0 , 1)) = 1
		_WholeRoughnessScale("Whole Roughness Scale", Range(0 , 1)) = 1
		_WholeMetallicScale("Whole Metallic Scale", Range(0 , 1)) = 0
		
		[NoScaleOffset]_Layer1Mask("Layer1 Mask", 2D) = "black" {}
		_Layer1Color("Layer1 Color", Color) = (1,0,0,1)
		_Layer1Pattern("Layer1 Pattern", 2D) = "black" {}
		_Layer1PatternColor("Layer1 Pattern Color", Color) = (1,1,1,1)
		_Layer1NAOR("Layer1 NAOR", 2D) = "bump" {}
		_Layer1NormalScale("Layer1 Normal Scale", Range(0 , 3)) = 1
		_Layer1AOScale("Layer1 AO Scale", Range(0 , 1)) = 1
		_Layer1RoughnessScale("Layer1 Roughness Scale", Range(0 , 1)) = 1
		_Layer1MetallicScale("Layer1 Metallic Scale", Range(0 , 1)) = 0
		
		[NoScaleOffset]_Layer2Mask("Layer2 Mask", 2D) = "black" {}
		_Layer2Color("Layer2 Color", Color) = (0,1,0,1)
		_Layer2Pattern("Layer2 Pattern", 2D) = "black" {}
		_Layer2PatternColor("Layer2 Pattern Color", Color) = (1,1,1,1)
		_Layer2NAOR("Layer2 NAOR", 2D) = "bump" {}
		_Layer2NormalScale("Layer2 Normal Scale", Range(0 , 3)) = 1
		_Layer2AOScale("Layer2 AO Scale", Range(0 , 1)) = 1
		_Layer2RoughnessScale("Layer2 Roughness Scale", Range(0 , 1)) = 1
		_Layer2MetallicScale("Layer2 Metallic Scale", Range(0 , 1)) = 0
		
		[NoScaleOffset]_Layer3Mask("Layer3 Mask", 2D) = "black" {}
		_Layer3Color("Layer3 Color", Color) = (0,0,1,1)
		_Layer3Pattern("Layer3 Pattern", 2D) = "black" {}
		_Layer3PatternColor("Layer3 Pattern Color", Color) = (1,1,1,1)
		_Layer3NAOR("Layer3 NAOR", 2D) = "bump" {}
		_Layer3NormalScale("Layer3 Normal Scale", Range(0 , 3)) = 1
		_Layer3AOScale("Layer3 AO Scale", Range(0 , 1)) = 1
		_Layer3RoughnessScale("Layer3 Roughness Scale", Range(0 , 1)) = 1
		_Layer3MetallicScale("Layer3 Metallic Scale", Range(0 , 1)) = 0
		
		[NoScaleOffset]_Layer4Mask("Layer4 Mask", 2D) = "black" {}
		_Layer4Color("Layer4 Color", Color) = (0,0,0,1)
		_Layer4Pattern("Layer4 Pattern", 2D) = "black" {}
		_Layer4PatternColor("Layer4 Pattern Color", Color) = (1,1,1,1)
		_Layer4NAOR("Layer4 NAOR", 2D) = "bump" {}
		_Layer4NormalScale("Layer4 Normal Scale", Range(0 , 3)) = 1
		_Layer4AOScale("Layer4 AO Scale", Range(0 , 1)) = 1
		_Layer4RoughnessScale("Layer4 Roughness Scale", Range(0 , 1)) = 1
		_Layer4MetallicScale("Layer4 Metallic Scale", Range(0 , 1)) = 0

		[NoScaleOffset]_Layer5Mask("Layer5 Mask", 2D) = "black" {}
		_Layer5Color("Layer5 Color", Color) = (1,0,0,1)
		_Layer5Pattern("Layer5 Pattern", 2D) = "black" {}
		_Layer5PatternColor("Layer5 Pattern Color", Color) = (1,1,1,1)
		_Layer5NAOR("Layer5 NAOR", 2D) = "bump" {}
		_Layer5NormalScale("Layer5 Normal Scale", Range(0 , 3)) = 1
		_Layer5AOScale("Layer5 AO Scale", Range(0 , 1)) = 1
		_Layer5RoughnessScale("Layer5 Roughness Scale", Range(0 , 1)) = 1
		_Layer5MetallicScale("Layer5 Metallic Scale", Range(0 , 1)) = 0

		[NoScaleOffset]_Layer6Mask("Layer6 Mask", 2D) = "black" {}
		_Layer6Color("Layer6 Color", Color) = (0,1,0,1)
		_Layer6Pattern("Layer6 Pattern", 2D) = "black" {}
		_Layer6PatternColor("Layer6 Pattern Color", Color) = (1,1,1,1)
		_Layer6NAOR("Layer6 NAOR", 2D) = "bump" {}
		_Layer6NormalScale("Layer6 Normal Scale", Range(0 , 3)) = 1
		_Layer6AOScale("Layer6 AO Scale", Range(0 , 1)) = 1
		_Layer6RoughnessScale("Layer6 Roughness Scale", Range(0 , 1)) = 1
		_Layer6MetallicScale("Layer6 Metallic Scale", Range(0 , 1)) = 0

		[NoScaleOffset]_Layer7Mask("Layer7 Mask", 2D) = "black" {}
		_Layer7Color("Layer7 Color", Color) = (0,0,1,1)
		_Layer7Pattern("Layer7 Pattern", 2D) = "black" {}
		_Layer7PatternColor("Layer7 Pattern Color", Color) = (1,1,1,1)
		_Layer7NAOR("Layer7 NAOR", 2D) = "bump" {}
		_Layer7NormalScale("Layer7 Normal Scale", Range(0 , 3)) = 1
		_Layer7AOScale("Layer7 AO Scale", Range(0 , 1)) = 1
		_Layer7RoughnessScale("Layer7 Roughness Scale", Range(0 , 1)) = 1
		_Layer7MetallicScale("Layer7 Metallic Scale", Range(0 , 1)) = 0

		[NoScaleOffset]_Layer8Mask("Layer8 Mask", 2D) = "black" {}
		_Layer8Color("Layer8 Color", Color) = (0,0,0,1)
		_Layer8Pattern("Layer8 Pattern", 2D) = "black" {}
		_Layer8PatternColor("Layer8 Pattern Color", Color) = (1,1,1,1)
		_Layer8NAOR("Layer8 NAOR", 2D) = "bump" {}
		_Layer8NormalScale("Layer8 Normal Scale", Range(0 , 3)) = 1
		_Layer8AOScale("Layer8 AO Scale", Range(0 , 1)) = 1
		_Layer8RoughnessScale("Layer8 Roughness Scale", Range(0 , 1)) = 1
		_Layer8MetallicScale("Layer8 Metallic Scale", Range(0 , 1)) = 0
		
		//[HideInInspector] _texcoord("", 2D) = "white" {}
	}

	SubShader
	{
		LOD 0

		Tags { "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" "Queue" = "Transparent" "IgnoreProjector" = "True"}
		LOD 300

		HLSLINCLUDE
		#pragma target 3.5

		#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonMaterial.hlsl"

		#pragma shader_feature_local _LAYERNUMBERS_ONE _LAYERNUMBERS_TWO _LAYERNUMBERS_THREE _LAYERNUMBERS_FOUR _LAYERNUMBERS_FIVE _LAYERNUMBERS_SIX _LAYERNUMBERS_SEVEN _LAYERNUMBERS_EIGHT

		CBUFFER_START(UnityPerMaterial)
		half4 _WholeColor;
		half4 _WholePatternColor;
		half4 _WholePattern_ST;
		half4 _WholeNAOR_ST;

		half4 _Layer1Color;
		half4 _Layer1PatternColor;
		half4 _Layer1Pattern_ST;
		half4 _Layer1NAOR_ST;

		half4 _Layer2Color;
		half4 _Layer2PatternColor;
		half4 _Layer2Pattern_ST;
		half4 _Layer2NAOR_ST;

		half4 _Layer3Color;
		half4 _Layer3PatternColor;
		half4 _Layer3Pattern_ST;
		half4 _Layer3NAOR_ST;

		half4 _Layer4Color;
		half4 _Layer4PatternColor;
		half4 _Layer4Pattern_ST;
		half4 _Layer4NAOR_ST;

		half4 _Layer5Color;
		half4 _Layer5PatternColor;
		half4 _Layer5Pattern_ST;
		half4 _Layer5NAOR_ST;

		half4 _Layer6Color;
		half4 _Layer6PatternColor;
		half4 _Layer6Pattern_ST;
		half4 _Layer6NAOR_ST;

		half4 _Layer7Color;
		half4 _Layer7PatternColor;
		half4 _Layer7Pattern_ST;
		half4 _Layer7NAOR_ST;

		half4 _Layer8Color;
		half4 _Layer8PatternColor;
		half4 _Layer8Pattern_ST;
		half4 _Layer8NAOR_ST;

		half _WholeNormalScale;
		half _WholeAOScale;
		half _WholeRoughnessScale;
		half _WholeMetallicScale;

		half _Layer1NormalScale;
		half _Layer1AOScale;
		half _Layer1RoughnessScale;
		half _Layer1MetallicScale;

		half _Layer2NormalScale;
		half _Layer2AOScale;
		half _Layer2RoughnessScale;
		half _Layer2MetallicScale;
		
		half _Layer3NormalScale;
		half _Layer3AOScale;
		half _Layer3RoughnessScale;
		half _Layer3MetallicScale;
		
		half _Layer4NormalScale;
		half _Layer4AOScale;
		half _Layer4RoughnessScale;
		half _Layer4MetallicScale;

		half _Layer5NormalScale;
		half _Layer5AOScale;
		half _Layer5RoughnessScale;
		half _Layer5MetallicScale;

		half _Layer6NormalScale;
		half _Layer6AOScale;
		half _Layer6RoughnessScale;
		half _Layer6MetallicScale;

		half _Layer7NormalScale;
		half _Layer7AOScale;
		half _Layer7RoughnessScale;
		half _Layer7MetallicScale;

		half _Layer8NormalScale;
		half _Layer8AOScale;
		half _Layer8RoughnessScale;
		half _Layer8MetallicScale;
		CBUFFER_END

		TEXTURE2D(_WholePattern);		SAMPLER(sampler_WholePattern);
		TEXTURE2D(_WholeNAOR);

		TEXTURE2D(_Layer1Mask);			
		TEXTURE2D(_Layer1Pattern);		SAMPLER(sampler_Layer1Pattern);
		TEXTURE2D(_Layer1NAOR);

		TEXTURE2D(_Layer2Mask);			
		TEXTURE2D(_Layer2Pattern);		SAMPLER(sampler_Layer2Pattern);
		TEXTURE2D(_Layer2NAOR);

		TEXTURE2D(_Layer3Mask);			
		TEXTURE2D(_Layer3Pattern);		SAMPLER(sampler_Layer3Pattern);
		TEXTURE2D(_Layer3NAOR);

		TEXTURE2D(_Layer4Mask);			
		TEXTURE2D(_Layer4Pattern);		SAMPLER(sampler_Layer4Pattern);
		TEXTURE2D(_Layer4NAOR);

		TEXTURE2D(_Layer5Mask);			
		TEXTURE2D(_Layer5Pattern);		SAMPLER(sampler_Layer5Pattern);
		TEXTURE2D(_Layer5NAOR);

		TEXTURE2D(_Layer6Mask);			
		TEXTURE2D(_Layer6Pattern);		SAMPLER(sampler_Layer6Pattern);
		TEXTURE2D(_Layer6NAOR);

		TEXTURE2D(_Layer7Mask);			
		TEXTURE2D(_Layer7Pattern);		SAMPLER(sampler_Layer7Pattern);
		TEXTURE2D(_Layer7NAOR);

		TEXTURE2D(_Layer8Mask);			
		TEXTURE2D(_Layer8Pattern);		SAMPLER(sampler_Layer8Pattern);
		TEXTURE2D(_Layer8NAOR);

		void NaorDecode(half4 naor, half normalScale, half aoScale, half roughnessScale, out half3 normal, out half smoothness, out half occlusion)
		{
			normal.xy = (naor.xy * 2 - 1) * normalScale;
			normal.z = sqrt(1 - saturate(dot(normal.xy, normal.xy)));

			occlusion = LerpWhiteTo(naor.z, aoScale);

			smoothness = 1 - naor.w * roughnessScale;
		}

		half4 PatternBlend(half4 color, half4 pattern)
		{
			color.rgb = lerp(color.rgb, pattern.rgb, pattern.a);
			color.a = lerp(color.a, 1, pattern.a);

			return color;
		}

		struct Layer
		{
			half4 color;
			half3 normal;
			half3 mso;
		};

		Layer LayerMerge(Layer b, Layer l, half mask)
		{
			b.color  = lerp(b.color, l.color, mask);
			b.normal = lerp(b.normal, BlendNormal(b.normal, l.normal), mask);
			b.mso	 = lerp(b.mso, l.mso, mask);

			return b;
		}

		ENDHLSL


		Pass
		{

			Name "Forward"
			Tags { "LightMode" = "UniversalForward" }

			Blend SrcAlpha OneMinusSrcAlpha , One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Cull Off
			ColorMask RGBA


			HLSLPROGRAM
			// Required to compile gles 2.0 with standard SRP library
			// All shaders must be compiled with HLSLcc and currently only gles is not using HLSLcc by default
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x
			#pragma target 2.0

			// -------------------------------------
			// Material Keywords
			#pragma shader_feature _NORMALMAP
			#pragma shader_feature _ALPHATEST_ON
			#pragma shader_feature _ALPHAPREMULTIPLY_ON
			#pragma shader_feature _EMISSION
			#pragma shader_feature _METALLICSPECGLOSSMAP
			#pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
			#pragma shader_feature _OCCLUSIONMAP

			#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature _ENVIRONMENTREFLECTIONS_OFF
			#pragma shader_feature _SPECULAR_SETUP
			#pragma shader_feature _RECEIVE_SHADOWS_OFF

			// -------------------------------------
			// Universal Pipeline keywords
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE

			// -------------------------------------
			// Unity defined keywords
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile_fog

			//--------------------------------------
			// GPU Instancing
			#pragma multi_compile_instancing

			#define _NORMALMAP 1

			#pragma vertex LayeredVertex
			#pragma fragment LayeredFragment

			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitForwardPass.hlsl"

			Varyings LayeredVertex(Attributes input)
			{
				Varyings output = (Varyings)0;

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
				VertexNormalInputs normalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);
				half3 viewDirWS = GetCameraPositionWS() - vertexInput.positionWS;
				half3 vertexLight = VertexLighting(vertexInput.positionWS, normalInput.normalWS);
				half fogFactor = ComputeFogFactor(vertexInput.positionCS.z);

				output.uv = input.texcoord;

			#ifdef _NORMALMAP
				output.normalWS = half4(normalInput.normalWS, viewDirWS.x);
				output.tangentWS = half4(normalInput.tangentWS, viewDirWS.y);
				output.bitangentWS = half4(normalInput.bitangentWS, viewDirWS.z);
			#else
				output.normalWS = NormalizeNormalPerVertex(normalInput.normalWS);
				output.viewDirWS = viewDirWS;
			#endif

				OUTPUT_LIGHTMAP_UV(input.lightmapUV, unity_LightmapST, output.lightmapUV);
				OUTPUT_SH(output.normalWS.xyz, output.vertexSH);

				output.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

			#if defined(REQUIRES_WORLD_SPACE_POS_INTERPOLATOR)
				output.positionWS = vertexInput.positionWS;
			#endif

			#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				output.shadowCoord = GetShadowCoord(vertexInput);
			#endif

				output.positionCS = vertexInput.positionCS;

				return output;
			}

			half4 LayeredFragment(Varyings input) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				SurfaceData surfaceData;

				Layer base;
				base.color = PatternBlend(_WholeColor, SAMPLE_TEXTURE2D(_WholePattern, sampler_WholePattern, TRANSFORM_TEX(input.uv, _WholePattern)) * _WholePatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_WholeNAOR, sampler_WholePattern, TRANSFORM_TEX(input.uv, _WholeNAOR)), _WholeNormalScale, _WholeAOScale, _WholeRoughnessScale, base.normal, base.mso.y, base.mso.z);
				base.mso.x = _WholeMetallicScale;	
				
				Layer layer;
#if defined(_LAYERNUMBERS_ONE)||defined(_LAYERNUMBERS_TWO)||defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer1Color, SAMPLE_TEXTURE2D(_Layer1Pattern, sampler_Layer1Pattern, TRANSFORM_TEX(input.uv, _Layer1Pattern)) * _Layer1PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer1NAOR, sampler_Layer1Pattern, TRANSFORM_TEX(input.uv, _Layer1NAOR)), _Layer1NormalScale, _Layer1AOScale, _Layer1RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer1MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer1Mask, sampler_Layer1Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_TWO)||defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer2Color, SAMPLE_TEXTURE2D(_Layer2Pattern, sampler_Layer2Pattern, TRANSFORM_TEX(input.uv, _Layer2Pattern)) * _Layer2PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer2NAOR, sampler_Layer2Pattern, TRANSFORM_TEX(input.uv, _Layer2NAOR)), _Layer2NormalScale, _Layer2AOScale, _Layer2RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer2MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer2Mask, sampler_Layer2Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer3Color, SAMPLE_TEXTURE2D(_Layer3Pattern, sampler_Layer3Pattern, TRANSFORM_TEX(input.uv, _Layer3Pattern)) * _Layer3PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer3NAOR, sampler_Layer3Pattern, TRANSFORM_TEX(input.uv, _Layer3NAOR)), _Layer3NormalScale, _Layer3AOScale, _Layer3RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer3MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer3Mask, sampler_Layer3Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer4Color, SAMPLE_TEXTURE2D(_Layer4Pattern, sampler_Layer4Pattern, TRANSFORM_TEX(input.uv, _Layer4Pattern)) * _Layer4PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer4NAOR, sampler_Layer4Pattern, TRANSFORM_TEX(input.uv, _Layer4NAOR)), _Layer4NormalScale, _Layer4AOScale, _Layer4RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer4MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer4Mask, sampler_Layer4Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer5Color, SAMPLE_TEXTURE2D(_Layer5Pattern, sampler_Layer5Pattern, TRANSFORM_TEX(input.uv, _Layer5Pattern)) * _Layer5PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer5NAOR, sampler_Layer5Pattern, TRANSFORM_TEX(input.uv, _Layer5NAOR)), _Layer5NormalScale, _Layer5AOScale, _Layer5RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer5MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer5Mask, sampler_Layer5Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer6Color, SAMPLE_TEXTURE2D(_Layer6Pattern, sampler_Layer6Pattern, TRANSFORM_TEX(input.uv, _Layer6Pattern)) * _Layer6PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer6NAOR, sampler_Layer6Pattern, TRANSFORM_TEX(input.uv, _Layer6NAOR)), _Layer6NormalScale, _Layer6AOScale, _Layer6RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer6MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer6Mask, sampler_Layer6Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer7Color, SAMPLE_TEXTURE2D(_Layer7Pattern, sampler_Layer7Pattern, TRANSFORM_TEX(input.uv, _Layer7Pattern)) * _Layer7PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer7NAOR, sampler_Layer7Pattern, TRANSFORM_TEX(input.uv, _Layer7NAOR)), _Layer7NormalScale, _Layer7AOScale, _Layer7RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer7MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer7Mask, sampler_Layer7Pattern, input.uv).r);
#endif
#if defined(_LAYERNUMBERS_EIGHT)
				layer.color = PatternBlend(_Layer8Color, SAMPLE_TEXTURE2D(_Layer8Pattern, sampler_Layer8Pattern, TRANSFORM_TEX(input.uv, _Layer8Pattern)) * _Layer8PatternColor);
				NaorDecode(SAMPLE_TEXTURE2D(_Layer8NAOR, sampler_Layer8Pattern, TRANSFORM_TEX(input.uv, _Layer8NAOR)), _Layer8NormalScale, _Layer8AOScale, _Layer8RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
				layer.mso.x = _Layer8MetallicScale;

				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer8Mask, sampler_Layer8Pattern, input.uv).r);
#endif
				surfaceData.alpha = base.color.a;
				surfaceData.albedo = base.color.rgb;
				surfaceData.metallic = base.mso.x;
				surfaceData.specular = half3(0.0h, 0.0h, 0.0h);
				surfaceData.smoothness = base.mso.y;
				surfaceData.normalTS = base.normal;
				surfaceData.occlusion = base.mso.z;
				surfaceData.emission = half3(0.0h, 0.0h, 0.0h);

				InputData inputData;
				InitializeInputData(input, surfaceData.normalTS, inputData);

				half4 color = UniversalFragmentPBR(inputData, surfaceData.albedo, surfaceData.metallic, surfaceData.specular, surfaceData.smoothness, surfaceData.occlusion, surfaceData.emission, surfaceData.alpha);

				color.rgb = MixFog(color.rgb, inputData.fogCoord);

				return color;
			}

			ENDHLSL
		}

		Pass
		{
			Name "ShadowCaster"
			Tags{"LightMode" = "ShadowCaster"}

			ZWrite On
			ZTest LEqual
			Cull[_Cull]

			HLSLPROGRAM
			// Required to compile gles 2.0 with standard srp library
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x
			#pragma target 2.0

			// -------------------------------------
			// Material Keywords
			#pragma shader_feature _ALPHATEST_ON

			//--------------------------------------
			// GPU Instancing
			#pragma multi_compile_instancing
			#pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			#pragma vertex ShadowPassVertex
			#pragma fragment ShadowPassFragment

			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/ShadowCasterPass.hlsl"
			ENDHLSL
		}

		Pass
		{
			Name "DepthOnly"
			Tags{"LightMode" = "DepthOnly"}

			ZWrite On
			ColorMask 0
			Cull[_Cull]

			HLSLPROGRAM
			// Required to compile gles 2.0 with standard srp library
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x
			#pragma target 2.0

			#pragma vertex DepthOnlyVertex
			#pragma fragment DepthOnlyFragment

			// -------------------------------------
			// Material Keywords
			#pragma shader_feature _ALPHATEST_ON
			#pragma shader_feature _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			//--------------------------------------
			// GPU Instancing
			#pragma multi_compile_instancing

			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/DepthOnlyPass.hlsl"
			ENDHLSL
		}

		// This pass it not used during regular rendering, only for lightmap baking.
		Pass
		{
			Name "Meta"
			Tags{"LightMode" = "Meta"}

			Cull Off

			HLSLPROGRAM
			// Required to compile gles 2.0 with standard srp library
			#pragma prefer_hlslcc gles
			#pragma exclude_renderers d3d11_9x

			#pragma vertex UniversalVertexMeta
			#pragma fragment UniversalFragmentMeta

			#pragma shader_feature _SPECULAR_SETUP
			#pragma shader_feature _EMISSION
			#pragma shader_feature _METALLICSPECGLOSSMAP
			#pragma shader_feature _ALPHATEST_ON
			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			#pragma shader_feature _SPECGLOSSMAP

			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Shaders/LitMetaPass.hlsl"

			ENDHLSL
		}
	}
	//CustomEditor "ASEMaterialInspector"
	Fallback "Hidden/Universal Render Pipeline/FallbackError"
}
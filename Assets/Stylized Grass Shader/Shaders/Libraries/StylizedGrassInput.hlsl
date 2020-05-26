#ifndef UNIVERSAL_LIT_INPUT_INCLUDED
#define UNIVERSAL_LIT_INPUT_INCLUDED

#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/CommonMaterial.hlsl"
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceInput.hlsl"

CBUFFER_START(UnityPerMaterial)
	float4 _BaseColor;
	float4 _BaseMap_ST;
	float4 _BumpMap_ST;
	float _ColorMapStrength;
	float _ColorMapHeight;
	float4 _HueVariation;
	half _Cutoff;
	half _Smoothness;
	half _Translucency;
	half _SpecularAmount;
	half _OcclusionStrength;
	half _VertexDarkening;
	half _BendPushStrength;
	half _BendMode;
	half _BendFlattenStrength; 
	half _PerspectiveCorrection;

	//Wind
	half _WindAmbientStrength;
	float _WindSpeed;
	half4 _WindDirection;
	half _WindVertexRand;
	half _WindObjectRand;
	float _WindRandStrength;
	half _WindSwinging;
	float _WindGustStrength;
	float _WindGustFreq;
	float _WindGustTint;

	float4 _FadeParams;
CBUFFER_END

#endif // UNIVERSAL_INPUT_SURFACE_PBR_INCLUDED

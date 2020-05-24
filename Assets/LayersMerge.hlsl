void LayersMerge(half3 inColor, out half3 outColor)
{
    				Layer base;
				base.color = PatternBlend(_WholeColor, SAMPLE_TEXTURE2D(_WholePattern, sampler_WholePattern, input.uv));
				NaorDecode(SAMPLE_TEXTURE2D(_WholeNAOR, sampler_WholePattern, input.uv), _WholeNormalScale, _WholeAOScale, _WholeRoughnessScale, base.normal, base.mso.y, base.mso.z);
				base.mso.x = _WholeMetallicScale;	
				
				Layer layer;
//#if defined(_LAYERNUMBERS_ONE)||defined(_LAYERNUMBERS_TWO)||defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer1Color, SAMPLE_TEXTURE2D(_Layer1Pattern, sampler_Layer1Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer1NAOR, sampler_Layer1Pattern, input.uv), _Layer1NormalScale, _Layer1AOScale, _Layer1RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer1MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer1Mask, sampler_Layer1Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_TWO)||defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer2Color, SAMPLE_TEXTURE2D(_Layer2Pattern, sampler_Layer2Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer2NAOR, sampler_Layer2Pattern, input.uv), _Layer2NormalScale, _Layer2AOScale, _Layer2RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer2MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer2Mask, sampler_Layer2Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_THREE)||defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer3Color, SAMPLE_TEXTURE2D(_Layer3Pattern, sampler_Layer3Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer3NAOR, sampler_Layer3Pattern, input.uv), _Layer3NormalScale, _Layer3AOScale, _Layer3RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer3MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer3Mask, sampler_Layer3Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_FOUR)||defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer4Color, SAMPLE_TEXTURE2D(_Layer4Pattern, sampler_Layer4Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer4NAOR, sampler_Layer4Pattern, input.uv), _Layer4NormalScale, _Layer4AOScale, _Layer4RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer4MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer4Mask, sampler_Layer4Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_FIVE)||defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer5Color, SAMPLE_TEXTURE2D(_Layer5Pattern, sampler_Layer5Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer5NAOR, sampler_Layer5Pattern, input.uv), _Layer5NormalScale, _Layer5AOScale, _Layer5RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer5MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer5Mask, sampler_Layer5Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_SIX)||defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer6Color, SAMPLE_TEXTURE2D(_Layer6Pattern, sampler_Layer6Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer6NAOR, sampler_Layer6Pattern, input.uv), _Layer6NormalScale, _Layer6AOScale, _Layer6RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer6MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer6Mask, sampler_Layer6Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_SEVEN)||defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer7Color, SAMPLE_TEXTURE2D(_Layer7Pattern, sampler_Layer7Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer7NAOR, sampler_Layer7Pattern, input.uv), _Layer7NormalScale, _Layer7AOScale, _Layer7RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer7MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer7Mask, sampler_Layer7Pattern, input.uv).r);
//#endif
//#if defined(_LAYERNUMBERS_EIGHT)
//				layer.color = PatternBlend(_Layer8Color, SAMPLE_TEXTURE2D(_Layer8Pattern, sampler_Layer8Pattern, input.uv));
//				NaorDecode(SAMPLE_TEXTURE2D(_Layer8NAOR, sampler_Layer8Pattern, input.uv), _Layer8NormalScale, _Layer8AOScale, _Layer8RoughnessScale, layer.normal, layer.mso.y, layer.mso.z);
//				layer.mso.x = _Layer8MetallicScale;
//
//				base = LayerMerge(base, layer, SAMPLE_TEXTURE2D(_Layer8Mask, sampler_Layer8Pattern, input.uv).r);
//
//#endif
				//surfaceData.alpha = base.color.a;
				surfaceData.albedo = base.color.rbg;
				//surfaceData.metallic = base.mso.x;
				//surfaceData.specular = half3(0.0h, 0.0h, 0.0h);
				//surfaceData.smoothness = base.mso.y;
				//surfaceData.normalTS = base.normal;
				//surfaceData.occlusion = base.mso.z;
				//surfaceData.emission = half3(0.0h, 0.0h, 0.0h);

				surfaceData.alpha = 1;
				//surfaceData.albedo = SAMPLE_TEXTURE2D(_WholePattern, sampler_WholePattern, input.uv);
				surfaceData.metallic = 0;
				surfaceData.specular = half3(0.0h, 0.0h, 0.0h);
				surfaceData.smoothness = 0;
				surfaceData.normalTS = half3(0.0h, 0.0h, 1.0h);
				surfaceData.occlusion = 0;
				surfaceData.emission = half3(0.0h, 0.0h, 0.0h);

				InputData inputData;
				InitializeInputData(input, surfaceData.normalTS, inputData);

				half4 color = UniversalFragmentPBR(inputData, surfaceData.albedo, surfaceData.metallic, surfaceData.specular, surfaceData.smoothness, surfaceData.occlusion, surfaceData.emission, surfaceData.alpha);

				color.rgb = MixFog(color.rgb, inputData.fogCoord);

}
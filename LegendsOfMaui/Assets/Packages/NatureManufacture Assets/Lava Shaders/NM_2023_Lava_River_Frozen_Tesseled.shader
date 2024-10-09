Shader "NatureManufacture/Lava River/Lava Frozen Tesseled"
{
	Properties
	{
		_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 15
		_TessMin( "Tess Min Distance", Float ) = 10
		_TessMax( "Tess Max Distance", Float ) = 25
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.75
		_BaseColor("Base Color", Color) = (1,1,1,1)
		_BaseColorMap("Base Map(RGB) Sm(A)", 2D) = "white" {}
		[Toggle(_BaseUsePlanarUV)] _BaseUsePlanarUV("Base Use Planar UV", Float) = 0
		_BaseTilingOffset("Base Tiling and Offset", Vector) = (1,1,0,0)
		_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
		_BaseNormalScale("Base Normal Scale", Range( 0 , 8)) = 1
		_BaseMaskMap("Base Mask Map MT(R) AO(G) H(B) E(A)", 2D) = "white" {}
		_BaseMetallic("Base Metallic", Range( 0 , 1)) = 1
		_BaseAORemapMin("Base AO Remap Min", Range( 0 , 1)) = 0
		_BaseAORemapMax("Base AO Remap Max", Range( 0 , 1)) = 1
		_BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range( 0 , 1)) = 0
		_BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range( 0 , 1)) = 1
		_HeightMin("Height Min", Float) = 0
		_HeightMax("Height Max", Float) = 1
		_HeightOffset("Height Offset", Float) = 0
		_Height_Transition("Height Blend Transition", Range( 0.001 , 1)) = 0.001
		_LayerMask("Layer Mask (R)", 2D) = "black" {}
		[Toggle(_Invert_Layer_Mask)] _Invert_Layer_Mask("Invert Layer Mask", Float) = 0
		_Tess_Height_Blend_Transition("Tess Height Blend Transition", Range( 0.001 , 1)) = 0.001
		_Base2Color("Base 2 Color", Color) = (1,1,1,1)
		_Base2ColorMap("Base 2 Map(RGB) Sm(A)", 2D) = "white" {}
		[Toggle(_Base2UsePlanarUV)] _Base2UsePlanarUV("Base 2 Use Planar UV", Float) = 0
		_Base2TilingOffset("Base 2 Tiling and Offset", Vector) = (1,1,0,0)
		_Base2NormalMap("Base 2 Normal Map", 2D) = "bump" {}
		_Base2NormalScale("Base 2 Normal Scale", Range( 0 , 8)) = 1
		_Base2MaskMap("Base 2 Mask Map MT(R) AO(G) H(B) E(A)", 2D) = "white" {}
		_Base2Metallic("Base 2 Metallic", Range( 0 , 1)) = 1
		_Base2AORemapMin("Base 2 AO Remap Min", Range( 0 , 1)) = 0
		_Base2AORemapMax("Base 2 AO Remap Max", Range( 0 , 1)) = 0
		_Base2SmoothnessRemapMin("Base 2 Smoothness Remap Min", Range( 0 , 1)) = 0
		_Base2SmoothnessRemapMax("Base 2 Smoothness Remap Max", Range( 0 , 1)) = 1
		_HeightMin2("Height 2 Min", Float) = 0
		_HeightMax2("Height 2 Max", Float) = 1
		_HeightOffset2("Height 2 Offset", Float) = 0
		[HDR]_LavaEmissionColor("Lava Emission Color", Color) = (1,0.1862055,0,0)
		_BaseEmissionMaskIntensivity("Base Emission Mask Intensivity", Range( 0 , 100)) = 0
		_BaseEmissionMaskTreshold("Base Emission Mask Treshold", Range( 0.01 , 100)) = 100
		_Base2EmissionMaskTreshold1("Base 2 Emission Mask Treshold", Range( 0 , 100)) = 0
		_Base2EmissionMaskTreshold("Base 2 Emission Mask Treshold", Range( 0.01 , 100)) = 1
		[HDR]_RimColor("Rim Color", Color) = (1,0,0,0)
		_RimLightPower("Rim Light Power", Float) = 4
		_Noise("Emission Noise", 2D) = "white" {}
		[HDR]_NoiseSpeed("Emission Noise Speed", Vector) = (0.001,0.005,0,0)
		_EmissionNoisePower("Emission Noise Power", Range( 0 , 10)) = 2.71
		_Tess_Height_1_Min("Tess Height 1 Min", Float) = 0
		_Tess_Height_1_Max("Tess Height 1 Max", Float) = 1
		_Tess_Height_1_Offset("Tess Height 1 Offset", Float) = 0
		_Tess_Height_2_Min("Tess Height 2 Min", Float) = 0
		_Tess_Height_2_Max("Tess Height 2 Max", Float) = 1
		_Tess_Height_2_Offset("Tess Height 2 Offset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 4.6
		#pragma shader_feature_local _BaseUsePlanarUV
		#pragma shader_feature_local _Invert_Layer_Mask
		#pragma shader_feature_local _Base2UsePlanarUV
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#endif//ASE Sampling Macros

		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
		};

		UNITY_DECLARE_TEX2D_NOSAMPLER(_BaseMaskMap);
		uniform float4 _BaseTilingOffset;
		SamplerState sampler_Linear_Repeat;
		uniform float _Tess_Height_1_Min;
		uniform float _Tess_Height_1_Offset;
		uniform float _Tess_Height_1_Max;
		uniform float _HeightMin;
		uniform float _HeightOffset;
		uniform float _HeightMax;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_LayerMask);
		uniform float4 _LayerMask_ST;
		SamplerState sampler_LayerMask;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Base2MaskMap);
		uniform float4 _Base2TilingOffset;
		uniform float _HeightMin2;
		uniform float _HeightOffset2;
		uniform float _HeightMax2;
		uniform float _Tess_Height_Blend_Transition;
		uniform float _Tess_Height_2_Min;
		uniform float _Tess_Height_2_Offset;
		uniform float _Tess_Height_2_Max;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BaseNormalMap);
		uniform float _BaseNormalScale;
		uniform float _Height_Transition;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Base2NormalMap);
		uniform float _Base2NormalScale;
		uniform float4 _BaseColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BaseColorMap);
		uniform float _BaseSmoothnessRemapMin;
		uniform float _BaseSmoothnessRemapMax;
		uniform float4 _Base2Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Base2ColorMap);
		uniform float _Base2SmoothnessRemapMin;
		uniform float _Base2SmoothnessRemapMax;
		uniform float _BaseEmissionMaskIntensivity;
		uniform float _BaseEmissionMaskTreshold;
		uniform float _Base2EmissionMaskTreshold1;
		uniform float _Base2EmissionMaskTreshold;
		uniform float4 _LavaEmissionColor;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Noise);
		uniform float2 _NoiseSpeed;
		SamplerState sampler_Noise;
		uniform float _EmissionNoisePower;
		uniform float4 _RimColor;
		uniform float _RimLightPower;
		uniform float _BaseMetallic;
		uniform float _BaseAORemapMin;
		uniform float _BaseAORemapMax;
		uniform float _Base2Metallic;
		uniform float _Base2AORemapMin;
		uniform float _Base2AORemapMax;
		uniform float _TessValue;
		uniform float _TessMin;
		uniform float _TessMax;
		uniform float _TessPhongStrength;

		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			return UnityDistanceBasedTess( v0.vertex, v1.vertex, v2.vertex, _TessMin, _TessMax, _TessValue );
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float4 break29_g37 = _BaseTilingOffset;
			float2 appendResult24_g37 = (float2(break29_g37.x , break29_g37.y));
			float2 appendResult25_g37 = (float2(break29_g37.z , break29_g37.w));
			float2 uv_TexCoord26_g37 = v.texcoord.xy * appendResult24_g37 + appendResult25_g37;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 break16_g37 = ase_worldPos;
			float2 appendResult17_g37 = (float2(break16_g37.x , break16_g37.z));
			#ifdef _BaseUsePlanarUV
				float2 staticSwitch3_g37 = ( appendResult17_g37 * ( 1.0 / break29_g37.x ) );
			#else
				float2 staticSwitch3_g37 = uv_TexCoord26_g37;
			#endif
			float4 break72 = SAMPLE_TEXTURE2D_LOD( _BaseMaskMap, sampler_Linear_Repeat, staticSwitch3_g37, 0.0 );
			float temp_output_310_0 = (( _HeightMin + _HeightOffset ) + (break72.b - 0.0) * (( _HeightMax + _HeightOffset ) - ( _HeightMin + _HeightOffset )) / (1.0 - 0.0));
			float temp_output_107_0_g63 = temp_output_310_0;
			float2 uv_LayerMask = v.texcoord * _LayerMask_ST.xy + _LayerMask_ST.zw;
			float4 tex2DNode337 = SAMPLE_TEXTURE2D_LOD( _LayerMask, sampler_LayerMask, uv_LayerMask, 0.0 );
			#ifdef _Invert_Layer_Mask
				float staticSwitch342 = ( 1.0 - tex2DNode337.r );
			#else
				float staticSwitch342 = tex2DNode337.r;
			#endif
			float4 break29_g66 = _Base2TilingOffset;
			float2 appendResult24_g66 = (float2(break29_g66.x , break29_g66.y));
			float2 appendResult25_g66 = (float2(break29_g66.z , break29_g66.w));
			float2 uv_TexCoord26_g66 = v.texcoord.xy * appendResult24_g66 + appendResult25_g66;
			float3 break16_g66 = ase_worldPos;
			float2 appendResult17_g66 = (float2(break16_g66.x , break16_g66.z));
			#ifdef _Base2UsePlanarUV
				float2 staticSwitch3_g66 = ( appendResult17_g66 * ( 1.0 / break29_g66.x ) );
			#else
				float2 staticSwitch3_g66 = uv_TexCoord26_g66;
			#endif
			float4 break158 = SAMPLE_TEXTURE2D_LOD( _Base2MaskMap, sampler_Linear_Repeat, staticSwitch3_g66, 0.0 );
			float clampResult349 = clamp( v.color.g , 0.0 , 1.0 );
			float temp_output_346_0 = ( ( staticSwitch342 * (( _HeightMin2 + _HeightOffset2 ) + (break158.b - 0.0) * (( _HeightMax2 + _HeightOffset2 ) - ( _HeightMin2 + _HeightOffset2 )) / (1.0 - 0.0)) ) * clampResult349 );
			float temp_output_114_0_g63 = temp_output_346_0;
			float temp_output_116_0_g63 = ( max( temp_output_107_0_g63 , temp_output_114_0_g63 ) - _Tess_Height_Blend_Transition );
			float temp_output_119_0_g63 = max( ( temp_output_107_0_g63 - temp_output_116_0_g63 ) , 0.0 );
			float temp_output_121_0_g63 = max( ( temp_output_114_0_g63 - temp_output_116_0_g63 ) , 0.0 );
			float3 ase_vertexNormal = v.normal.xyz;
			float3 clampResult353 = clamp( ase_vertexNormal , float3( 0,0,0 ) , float3( 1,1,1 ) );
			v.vertex.xyz += ( ( ( ( (( _Tess_Height_1_Min + _Tess_Height_1_Offset ) + (break72.b - 0.0) * (( _Tess_Height_1_Max + _Tess_Height_1_Offset ) - ( _Tess_Height_1_Min + _Tess_Height_1_Offset )) / (1.0 - 0.0)) * temp_output_119_0_g63 ) + ( temp_output_121_0_g63 * ( ( (( _Tess_Height_2_Min + _Tess_Height_2_Offset ) + (break158.b - 0.0) * (( _Tess_Height_2_Max + _Tess_Height_2_Offset ) - ( _Tess_Height_2_Min + _Tess_Height_2_Offset )) / (1.0 - 0.0)) * staticSwitch342 ) * clampResult349 ) ) ) / max( ( temp_output_119_0_g63 + temp_output_121_0_g63 ) , 1E-05 ) ) * clampResult353 );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 break29_g36 = _BaseTilingOffset;
			float2 appendResult24_g36 = (float2(break29_g36.x , break29_g36.y));
			float2 appendResult25_g36 = (float2(break29_g36.z , break29_g36.w));
			float2 uv_TexCoord26_g36 = i.uv_texcoord * appendResult24_g36 + appendResult25_g36;
			float3 ase_worldPos = i.worldPos;
			float3 break16_g36 = ase_worldPos;
			float2 appendResult17_g36 = (float2(break16_g36.x , break16_g36.z));
			#ifdef _BaseUsePlanarUV
				float2 staticSwitch3_g36 = ( appendResult17_g36 * ( 1.0 / break29_g36.x ) );
			#else
				float2 staticSwitch3_g36 = uv_TexCoord26_g36;
			#endif
			float3 tex2DNode13_g36 = UnpackNormal( SAMPLE_TEXTURE2D( _BaseNormalMap, sampler_Linear_Repeat, staticSwitch3_g36 ) );
			float2 appendResult32_g36 = (float2(tex2DNode13_g36.r , tex2DNode13_g36.g));
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float2 appendResult39_g36 = (float2(sign( ase_worldNormal ).y , 1.0));
			float3 break41_g36 = ase_worldNormal;
			float2 appendResult42_g36 = (float2(break41_g36.x , break41_g36.z));
			float2 break44_g36 = ( ( appendResult32_g36 * appendResult39_g36 ) + appendResult42_g36 );
			float3 appendResult45_g36 = (float3(break44_g36.x , ( tex2DNode13_g36.b * break41_g36.y ) , break44_g36.y));
			float3 ase_worldTangent = WorldNormalVector( i, float3( 1, 0, 0 ) );
			float3 ase_worldBitangent = WorldNormalVector( i, float3( 0, 1, 0 ) );
			float3x3 ase_worldToTangent = float3x3( ase_worldTangent, ase_worldBitangent, ase_worldNormal );
			float3 worldToTangentDir46_g36 = mul( ase_worldToTangent, appendResult45_g36);
			float3 normalizeResult48_g36 = normalize( worldToTangentDir46_g36 );
			#ifdef _BaseUsePlanarUV
				float3 staticSwitch31_g36 = normalizeResult48_g36;
			#else
				float3 staticSwitch31_g36 = tex2DNode13_g36;
			#endif
			float3 break31_g54 = staticSwitch31_g36;
			float2 appendResult35_g54 = (float2(break31_g54.x , break31_g54.y));
			float temp_output_38_0_g54 = _BaseNormalScale;
			float lerpResult36_g54 = lerp( 1.0 , break31_g54.z , saturate( temp_output_38_0_g54 ));
			float3 appendResult34_g54 = (float3(( appendResult35_g54 * temp_output_38_0_g54 ) , lerpResult36_g54));
			float3 temp_output_69_0 = appendResult34_g54;
			float4 break29_g37 = _BaseTilingOffset;
			float2 appendResult24_g37 = (float2(break29_g37.x , break29_g37.y));
			float2 appendResult25_g37 = (float2(break29_g37.z , break29_g37.w));
			float2 uv_TexCoord26_g37 = i.uv_texcoord * appendResult24_g37 + appendResult25_g37;
			float3 break16_g37 = ase_worldPos;
			float2 appendResult17_g37 = (float2(break16_g37.x , break16_g37.z));
			#ifdef _BaseUsePlanarUV
				float2 staticSwitch3_g37 = ( appendResult17_g37 * ( 1.0 / break29_g37.x ) );
			#else
				float2 staticSwitch3_g37 = uv_TexCoord26_g37;
			#endif
			float4 break72 = SAMPLE_TEXTURE2D( _BaseMaskMap, sampler_Linear_Repeat, staticSwitch3_g37 );
			float temp_output_310_0 = (( _HeightMin + _HeightOffset ) + (break72.b - 0.0) * (( _HeightMax + _HeightOffset ) - ( _HeightMin + _HeightOffset )) / (1.0 - 0.0));
			float temp_output_107_0_g61 = temp_output_310_0;
			float2 uv_LayerMask = i.uv_texcoord * _LayerMask_ST.xy + _LayerMask_ST.zw;
			float4 tex2DNode337 = SAMPLE_TEXTURE2D( _LayerMask, sampler_LayerMask, uv_LayerMask );
			#ifdef _Invert_Layer_Mask
				float staticSwitch342 = ( 1.0 - tex2DNode337.r );
			#else
				float staticSwitch342 = tex2DNode337.r;
			#endif
			float4 break29_g66 = _Base2TilingOffset;
			float2 appendResult24_g66 = (float2(break29_g66.x , break29_g66.y));
			float2 appendResult25_g66 = (float2(break29_g66.z , break29_g66.w));
			float2 uv_TexCoord26_g66 = i.uv_texcoord * appendResult24_g66 + appendResult25_g66;
			float3 break16_g66 = ase_worldPos;
			float2 appendResult17_g66 = (float2(break16_g66.x , break16_g66.z));
			#ifdef _Base2UsePlanarUV
				float2 staticSwitch3_g66 = ( appendResult17_g66 * ( 1.0 / break29_g66.x ) );
			#else
				float2 staticSwitch3_g66 = uv_TexCoord26_g66;
			#endif
			float4 break158 = SAMPLE_TEXTURE2D( _Base2MaskMap, sampler_Linear_Repeat, staticSwitch3_g66 );
			float clampResult349 = clamp( i.vertexColor.g , 0.0 , 1.0 );
			float temp_output_346_0 = ( ( staticSwitch342 * (( _HeightMin2 + _HeightOffset2 ) + (break158.b - 0.0) * (( _HeightMax2 + _HeightOffset2 ) - ( _HeightMin2 + _HeightOffset2 )) / (1.0 - 0.0)) ) * clampResult349 );
			float temp_output_114_0_g61 = temp_output_346_0;
			float temp_output_116_0_g61 = ( max( temp_output_107_0_g61 , temp_output_114_0_g61 ) - _Height_Transition );
			float temp_output_119_0_g61 = max( ( temp_output_107_0_g61 - temp_output_116_0_g61 ) , 0.0 );
			float temp_output_121_0_g61 = max( ( temp_output_114_0_g61 - temp_output_116_0_g61 ) , 0.0 );
			float4 break29_g67 = _Base2TilingOffset;
			float2 appendResult24_g67 = (float2(break29_g67.x , break29_g67.y));
			float2 appendResult25_g67 = (float2(break29_g67.z , break29_g67.w));
			float2 uv_TexCoord26_g67 = i.uv_texcoord * appendResult24_g67 + appendResult25_g67;
			float3 break16_g67 = ase_worldPos;
			float2 appendResult17_g67 = (float2(break16_g67.x , break16_g67.z));
			#ifdef _Base2UsePlanarUV
				float2 staticSwitch3_g67 = ( appendResult17_g67 * ( 1.0 / break29_g67.x ) );
			#else
				float2 staticSwitch3_g67 = uv_TexCoord26_g67;
			#endif
			float3 tex2DNode13_g67 = UnpackNormal( SAMPLE_TEXTURE2D( _Base2NormalMap, sampler_Linear_Repeat, staticSwitch3_g67 ) );
			float2 appendResult32_g67 = (float2(tex2DNode13_g67.r , tex2DNode13_g67.g));
			float2 appendResult39_g67 = (float2(sign( ase_worldNormal ).y , 1.0));
			float3 break41_g67 = ase_worldNormal;
			float2 appendResult42_g67 = (float2(break41_g67.x , break41_g67.z));
			float2 break44_g67 = ( ( appendResult32_g67 * appendResult39_g67 ) + appendResult42_g67 );
			float3 appendResult45_g67 = (float3(break44_g67.x , ( tex2DNode13_g67.b * break41_g67.y ) , break44_g67.y));
			float3 worldToTangentDir46_g67 = mul( ase_worldToTangent, appendResult45_g67);
			float3 normalizeResult48_g67 = normalize( worldToTangentDir46_g67 );
			#ifdef _Base2UsePlanarUV
				float3 staticSwitch31_g67 = normalizeResult48_g67;
			#else
				float3 staticSwitch31_g67 = tex2DNode13_g67;
			#endif
			float3 break31_g55 = staticSwitch31_g67;
			float2 appendResult35_g55 = (float2(break31_g55.x , break31_g55.y));
			float temp_output_38_0_g55 = _Base2NormalScale;
			float lerpResult36_g55 = lerp( 1.0 , break31_g55.z , saturate( temp_output_38_0_g55 ));
			float3 appendResult34_g55 = (float3(( appendResult35_g55 * temp_output_38_0_g55 ) , lerpResult36_g55));
			o.Normal = ( ( ( temp_output_69_0 * temp_output_119_0_g61 ) + ( temp_output_121_0_g61 * appendResult34_g55 ) ) / max( ( temp_output_119_0_g61 + temp_output_121_0_g61 ) , 1E-05 ) );
			float3 appendResult64 = (float3(_BaseColor.r , _BaseColor.g , _BaseColor.b));
			float4 break29_g35 = _BaseTilingOffset;
			float2 appendResult24_g35 = (float2(break29_g35.x , break29_g35.y));
			float2 appendResult25_g35 = (float2(break29_g35.z , break29_g35.w));
			float2 uv_TexCoord26_g35 = i.uv_texcoord * appendResult24_g35 + appendResult25_g35;
			float3 break16_g35 = ase_worldPos;
			float2 appendResult17_g35 = (float2(break16_g35.x , break16_g35.z));
			#ifdef _BaseUsePlanarUV
				float2 staticSwitch3_g35 = ( appendResult17_g35 * ( 1.0 / break29_g35.x ) );
			#else
				float2 staticSwitch3_g35 = uv_TexCoord26_g35;
			#endif
			float4 break60 = SAMPLE_TEXTURE2D( _BaseColorMap, sampler_Linear_Repeat, staticSwitch3_g35 );
			float3 appendResult61 = (float3(break60.r , break60.g , break60.b));
			float4 appendResult114 = (float4(( appendResult64 * appendResult61 ) , (_BaseSmoothnessRemapMin + (break60.a - 0.0) * (_BaseSmoothnessRemapMax - _BaseSmoothnessRemapMin) / (1.0 - 0.0))));
			float temp_output_107_0_g68 = temp_output_310_0;
			float temp_output_114_0_g68 = temp_output_346_0;
			float temp_output_116_0_g68 = ( max( temp_output_107_0_g68 , temp_output_114_0_g68 ) - _Height_Transition );
			float temp_output_119_0_g68 = max( ( temp_output_107_0_g68 - temp_output_116_0_g68 ) , 0.0 );
			float temp_output_121_0_g68 = max( ( temp_output_114_0_g68 - temp_output_116_0_g68 ) , 0.0 );
			float3 appendResult168 = (float3(_Base2Color.r , _Base2Color.g , _Base2Color.b));
			float4 break29_g64 = _Base2TilingOffset;
			float2 appendResult24_g64 = (float2(break29_g64.x , break29_g64.y));
			float2 appendResult25_g64 = (float2(break29_g64.z , break29_g64.w));
			float2 uv_TexCoord26_g64 = i.uv_texcoord * appendResult24_g64 + appendResult25_g64;
			float3 break16_g64 = ase_worldPos;
			float2 appendResult17_g64 = (float2(break16_g64.x , break16_g64.z));
			#ifdef _Base2UsePlanarUV
				float2 staticSwitch3_g64 = ( appendResult17_g64 * ( 1.0 / break29_g64.x ) );
			#else
				float2 staticSwitch3_g64 = uv_TexCoord26_g64;
			#endif
			float4 break157 = SAMPLE_TEXTURE2D( _Base2ColorMap, sampler_Linear_Repeat, staticSwitch3_g64 );
			float3 appendResult153 = (float3(break157.r , break157.g , break157.b));
			float4 appendResult175 = (float4(( appendResult168 * appendResult153 ) , (_Base2SmoothnessRemapMin + (break157.a - 0.0) * (_Base2SmoothnessRemapMax - _Base2SmoothnessRemapMin) / (1.0 - 0.0))));
			float4 temp_output_322_98 = ( ( ( appendResult114 * temp_output_119_0_g68 ) + ( temp_output_121_0_g68 * appendResult175 ) ) / max( ( temp_output_119_0_g68 + temp_output_121_0_g68 ) , 1E-05 ) );
			o.Albedo = temp_output_322_98.xyz;
			float4 clampResult132 = clamp( i.vertexColor , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
			float4 break309 = clampResult132;
			float lerpResult135 = lerp( 0.0 , break72.a , break309.r);
			float lerpResult136 = lerp( 0.0 , break158.a , break309.r);
			float lerpResult142 = lerp( pow( abs( ( lerpResult135 * _BaseEmissionMaskIntensivity ) ) , _BaseEmissionMaskTreshold ) , pow( abs( ( lerpResult136 * _Base2EmissionMaskTreshold1 ) ) , _Base2EmissionMaskTreshold ) , break309.g);
			float3 appendResult287 = (float3(_LavaEmissionColor.r , _LavaEmissionColor.g , _LavaEmissionColor.b));
			float2 temp_output_258_0 = ( ( _NoiseSpeed * _Time.y ) + i.uv_texcoord );
			float clampResult271 = clamp( ( pow( abs( min( SAMPLE_TEXTURE2D( _Noise, sampler_Noise, temp_output_258_0 ).a , SAMPLE_TEXTURE2D( _Noise, sampler_Noise, ( ( temp_output_258_0 * float2( -1.2,-0.9 ) ) + float2( 0.5,0.5 ) ) ).a ) ) , _EmissionNoisePower ) * 20.0 ) , 0.05 , 1.2 );
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_tanViewDir = mul( ase_worldToTangent, ase_worldViewDir );
			float dotResult273 = dot( temp_output_69_0 , ase_tanViewDir );
			float3 appendResult281 = (float3(_RimColor.r , _RimColor.g , _RimColor.b));
			float3 temp_output_284_0 = ( ( ( lerpResult142 * appendResult287 ) * clampResult271 ) + ( ( ( pow( abs( ( 1.0 - saturate( dotResult273 ) ) ) , 10.0 ) * appendResult281 ) * _RimLightPower ) * lerpResult142 ) );
			float3 clampResult290 = clamp( temp_output_284_0 , float3( 0,0,0 ) , temp_output_284_0 );
			o.Emission = clampResult290;
			float2 appendResult79 = (float2(( break72.r * _BaseMetallic ) , (_BaseAORemapMin + (break72.g - 0.0) * (_BaseAORemapMax - _BaseAORemapMin) / (1.0 - 0.0))));
			float temp_output_107_0_g60 = temp_output_310_0;
			float temp_output_114_0_g60 = temp_output_346_0;
			float temp_output_116_0_g60 = ( max( temp_output_107_0_g60 , temp_output_114_0_g60 ) - _Height_Transition );
			float temp_output_119_0_g60 = max( ( temp_output_107_0_g60 - temp_output_116_0_g60 ) , 0.0 );
			float temp_output_121_0_g60 = max( ( temp_output_114_0_g60 - temp_output_116_0_g60 ) , 0.0 );
			float2 appendResult172 = (float2(( break158.r * _Base2Metallic ) , (_Base2AORemapMin + (break158.g - 0.0) * (_Base2AORemapMax - _Base2AORemapMin) / (1.0 - 0.0))));
			float2 break252 = ( ( ( appendResult79 * temp_output_119_0_g60 ) + ( temp_output_121_0_g60 * appendResult172 ) ) / max( ( temp_output_119_0_g60 + temp_output_121_0_g60 ) , 1E-05 ) );
			o.Metallic = break252;
			o.Smoothness = temp_output_322_98.w;
			o.Occlusion = break252.y;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Standard keepalpha fullforwardshadows dithercrossfade vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 4.6
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.vertexColor = IN.color;
				SurfaceOutputStandard o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputStandard, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}
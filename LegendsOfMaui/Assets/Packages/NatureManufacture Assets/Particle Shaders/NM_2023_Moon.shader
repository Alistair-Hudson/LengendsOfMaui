Shader "NatureManufacture/Particles/Moon"
{
	Properties
	{
		[HDR]_Moon_Color_RGB_Alpha_A("Moon Color (RGB) Alpha(A)", Color) = (1,1,1,1)
		_Moon_Texture_RGB_Alpha_A("Moon Texture (RGB) Alpha (A)", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit alpha:fade keepalpha noshadow nofog 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float4 _Moon_Color_RGB_Alpha_A;
		uniform sampler2D _Moon_Texture_RGB_Alpha_A;
		uniform float4 _Moon_Texture_RGB_Alpha_A_ST;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float3 appendResult309 = (float3(_Moon_Color_RGB_Alpha_A.rgb));
			float2 uv_Moon_Texture_RGB_Alpha_A = i.uv_texcoord * _Moon_Texture_RGB_Alpha_A_ST.xy + _Moon_Texture_RGB_Alpha_A_ST.zw;
			float4 tex2DNode328 = tex2D( _Moon_Texture_RGB_Alpha_A, uv_Moon_Texture_RGB_Alpha_A );
			float3 appendResult312 = (float3(tex2DNode328.rgb));
			o.Emission = ( appendResult309 * appendResult312 );
			o.Alpha = ( _Moon_Color_RGB_Alpha_A.a * tex2DNode328.a );
		}

		ENDCG
	}
}
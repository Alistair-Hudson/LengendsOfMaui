Shader "NatureManufacture/HDRP/Lit/Lava/Lit Lava Full Triplanar Cover"
{
    Properties
    {
        _BaseColor("Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_BaseColorMap("Base Map(RGB) Sm(A)", 2D) = "white" {}
        _BaseTilingOffset("Base Tiling and Offset", Vector) = (1, 1, 0, 0)
        _BaseTriplanarThreshold("Base Triplanar Threshold", Range(1, 8)) = 5
        [Normal][NoScaleOffset]_BaseNormalMap("Base Normal Map", 2D) = "bump" {}
        _BaseNormalScale("Base Normal Scale", Range(0, 8)) = 1
        [NoScaleOffset]_BaseMaskMap("Base Mask Map MT(R) AO(G) H(B) E(A)", 2D) = "white" {}
        _BaseMetallic("Base Metallic", Range(0, 1)) = 1
        _BaseAORemapMin("Base AO Remap Min", Range(0, 1)) = 0
        _BaseAORemapMax("Base AO Remap Max", Range(0, 1)) = 1
        _BaseSmoothnessRemapMin("Base Smoothness Remap Min", Range(0, 1)) = 0
        _BaseSmoothnessRemapMax("Base Smoothness Remap Max", Range(0, 1)) = 1
        [ToggleUI]_USEDYNAMICCOVERTSTATICMASKF("Use Dynamic Cover (T) Static Mask (F)", Float) = 1
        [ToggleUI]_USECoverHeightT("Use Cover Height (T)", Float) = 1
        [NoScaleOffset]_CoverMaskA("Cover Mask (A)", 2D) = "white" {}
        _CoverMaskPower("Cover Mask Power", Range(0, 10)) = 1
        _Cover_Amount("Cover Amount", Range(0, 2)) = 2
        _Cover_Amount_Grow_Speed("Cover Amount Grow Speed", Range(0, 3)) = 3
        _CoverDirection("Cover Direction", Vector) = (0, 1, 0, 0)
        _Cover_Max_Angle("Cover Max Angle", Range(0.001, 90)) = 35
        _Cover_Min_Height("Cover Min Height", Float) = -10000
        _Cover_Min_Height_Blending("Cover Min Height Blending", Range(0, 500)) = 1
        _CoverBaseColor("Cover Base Color", Color) = (1, 1, 1, 0)
        [NoScaleOffset]_CoverBaseColorMap("Cover Base Map(RGB) Sm(A)", 2D) = "white" {}
        _CoverTilingOffset("Cover Tiling Offset", Vector) = (1, 1, 0, 0)
        _CoverTriplanarThreshold("Cover Triplanar Threshold", Range(1, 8)) = 5
        [Normal][NoScaleOffset]_CoverNormalMap("Cover Normal Map", 2D) = "bump" {}
        _CoverNormalScale("Cover Normal Scale", Range(0, 8)) = 1
        _CoverNormalBlendHardness("Cover Normal Blend Hardness", Range(0, 8)) = 1
        _CoverHardness("Cover Hardness", Range(0, 10)) = 5
        _CoverHeightMapMin("Cover Height Map Min", Float) = 0
        _CoverHeightMapMax("Cover Height Map Max", Float) = 1
        _CoverHeightMapOffset("Cover Height Map Offset", Float) = 0
        [NoScaleOffset]_CoverMaskMap("Cover Mask Map MT(R) AO(G) H(B) E(A)", 2D) = "white" {}
        _CoverMetallic("Cover Metallic", Range(0, 1)) = 1
        _CoverAORemapMin("Cover AO Remap Min", Range(0, 1)) = 0
        _CoverAORemapMax("Cover AO Remap Max", Range(0, 1)) = 1
        _CoverSmoothnessRemapMin("Cover Smoothness Remap Min", Range(0, 1)) = 0
        _CoverSmoothnessRemapMax("Cover Smoothness Remap Max", Range(0, 1)) = 1
        _VertexColorBBlendStrenght("Vertex Color (B) Blend Strenght", Range(0, 100)) = 10
        _VertexColorGBlendStrenght("Vertex Color (G) Blend Strenght", Range(0, 100)) = 10
        [ToggleUI]_Use_ShapeHeightBT_Static_MaskF("Use Shape Height (B) (T) Cover Mask (F)", Float) = 0
        _ShapeTilingOffset("Shape Tiling and Offset", Vector) = (1, 1, 0, 0)
        [Normal][NoScaleOffset]_ShapeNormalMap("Shape Normal", 2D) = "bump" {}
        _shapeNormalScale("Shape Normal Base Scale", Float) = 0
        _Shape_Normal_Cover_Scale("Shape Normal Cover Scale", Float) = 0
        [NoScaleOffset]_ShapeCurvAOHLeaksMask("Shape Curv (R) AO (G) H (B) Leaks Mask (A)", 2D) = "white" {}
        _CurvatureBlend("Curvature Power", Range(0, 1)) = 0
        _Shape_AO_Curvature_Reduction("Shape AO Curvature Reduction", Range(0, 1)) = 0
        _ShapeAORemapMin("Base Shape AO Remap Min", Range(0, 1)) = 0
        _ShapeAORemapMax("Base Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeAORemapMin_1("Cover Shape AO Remap Min", Range(0, 1)) = 1
        _ShapeAORemapMax_1("Cover Shape AO Remap Max", Range(0, 1)) = 1
        _ShapeHeightMapMin("Shape Height Map Min", Float) = 0
        _ShapeHeightMapMax("Shape Height Map Max", Float) = 1
        _ShapeHeightMapOffset("Shape Height Map Offset", Float) = 0
        [NoScaleOffset]_LeaksR("Leaks (R)", 2D) = "white" {}
        _BaseLeaksColorMultiply("Base Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        _CoverLeaksColorMultiply("Cover Leaks Color (RGB) Multiply (A)", Color) = (0, 0, 0, 0)
        [ToggleUI]Leaks_UV0_UV2_1("Leaks UV0 (T) UV2 (F)", Float) = 1
        _LeaksTilingOffset("Leaks Tiling and Offset", Vector) = (1, 1, 0, 0)
        _LeaksSmoothnessMultiply("Base Leaks Smoothness Multiply", Range(0, 2)) = 1
        _LeaksSmoothnessMultiply_1("Cover Leaks Smoothness Multiply", Range(0, 2)) = 1
        [ToggleUI]_Wetness_T_Heat_F("Wetness (T) Heat (F)", Float) = 0
        _WetColor("Wet Color Vertex(R)", Color) = (0.7735849, 0.7735849, 0.7735849, 0)
        _WetSmoothness("Wet Smoothness Vertex(R)", Range(0, 1)) = 1
        [HDR]_LavaEmissionColor("Lava Emission Color", Color) = (1, 0.1862055, 0, 0)
        _BaseEmissionMaskIntensivity("Base Emission Mask Intensivity", Range(0, 100)) = 0
        _BaseEmissionMaskTreshold("Base Emission Mask Treshold", Range(0.01, 100)) = 0.01
        _CoverEmissionMaskIntensivity("Cover Emission Mask Intensivity", Range(0, 100)) = 0
        _CoverEmissionMaskTreshold("Cover Emission Mask Treshold", Range(0.01, 100)) = 0.01
        [HDR]_RimColor("Rim Color", Color) = (1, 0, 0, 0)
        _RimLightPower("Rim Light Power", Float) = 4
        [NoScaleOffset]_Noise("Emission Noise", 2D) = "white" {}
        _NoiseTiling("Emission Noise Tiling", Vector) = (1, 1, 0, 0)
        _NoiseSpeed("Emission Noise Speed", Vector) = (0.001, 0.005, 0, 0)
        _EmissionNoisePower("Emission Noise Power", Range(0, 10)) = 2.71
        [ToggleUI]_Dynamic_Flow("Dynamic Flow", Float) = 0
        _Dynamic_Shape_Speed("Dynamic Shape Speed", Range(0, 10)) = 0.1
        _Dynamic_Start_Position_Offset("Dynamic Start Position Offset", Float) = 0
        _Dynamic_Reaction_Offset("Dynamic Reaction Offset", Float) = 0
        _Dynamic_Shape_V_Curve_Power("Dynamic Shape V Curve Power", Range(-8, 8)) = 1.5
        [HideInInspector]_QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector]_QueueControl("_QueueControl", Float) = -1
        [HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
    }
    SubShader
    {
        Tags
        {
            "RenderPipeline"="UniversalPipeline"
            "RenderType"="Opaque"
            "UniversalMaterialType" = "Lit"
            "Queue"="Geometry"
            "DisableBatching"="LODFading"
            "ShaderGraphShader"="true"
            "ShaderGraphTargetId"="UniversalLitSubTarget"
        }
        Pass
        {
            Name "Universal Forward"
            Tags
            {
                "LightMode" = "UniversalForward"
            }
        
        // Render State
        Cull Back
        Blend One Zero
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
        #pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _LIGHT_LAYERS
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile_fragment _ _LIGHT_COOKIES
        #pragma multi_compile _ _FORWARD_PLUS
        #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #define VARYINGS_NEED_SHADOW_COORD
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_FORWARD
        #define _FOG_FRAGMENT 1
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh;
            #endif
             float4 fogFactorAndVertexLight;
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 WorldSpacePosition;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV : INTERP0;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh : INTERP2;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord : INTERP3;
            #endif
             float4 tangentWS : INTERP4;
             float4 texCoord0 : INTERP5;
             float4 texCoord2 : INTERP6;
             float4 color : INTERP7;
             float4 fogFactorAndVertexLight : INTERP8;
             float3 positionWS : INTERP9;
             float3 normalWS : INTERP10;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, 1);
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, 1);
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, 1);
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, 1);
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, 1);
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Lerp_float2(float2 A, float2 B, float2 T, out float2 Out)
        {
            Out = lerp(A, B, T);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float Smoothness;
            float Occlusion;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            UnityTexture2D _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4 = IN.uv0;
            float4 _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4 = IN.uv2;
            float4 _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4;
            Unity_Branch_float4(_Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean, _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4, _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4, _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4);
            float4 _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_93f9134325f7419191384c18129e58ce_R_1_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[0];
            float _Split_93f9134325f7419191384c18129e58ce_G_2_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[1];
            float _Split_93f9134325f7419191384c18129e58ce_B_3_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[2];
            float _Split_93f9134325f7419191384c18129e58ce_A_4_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[3];
            float2 _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_R_1_Float, _Split_93f9134325f7419191384c18129e58ce_G_2_Float);
            float2 _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_B_3_Float, _Split_93f9134325f7419191384c18129e58ce_A_4_Float);
            float2 _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4.xy), _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2, _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2, _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2);
            float4 _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.tex, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.samplerstate, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2) );
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.r;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_G_5_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.g;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_B_6_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.b;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_A_7_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.a;
            float _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float);
            float4 _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float.xxxx), _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4, _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4);
            float4 _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4);
            float4 _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4);
            UnityTexture2D _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4 = _ShapeTilingOffset;
            float _Split_48c02d4affa84aebbb872647b9335551_R_1_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[0];
            float _Split_48c02d4affa84aebbb872647b9335551_G_2_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[1];
            float _Split_48c02d4affa84aebbb872647b9335551_B_3_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[2];
            float _Split_48c02d4affa84aebbb872647b9335551_A_4_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[3];
            float2 _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_R_1_Float, _Split_48c02d4affa84aebbb872647b9335551_G_2_Float);
            float2 _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_B_3_Float, _Split_48c02d4affa84aebbb872647b9335551_A_4_Float);
            float2 _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2, _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2, _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2);
            float4 _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.r;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.g;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.b;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.a;
            float _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float, _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float);
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_R_1_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[0];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_G_2_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[1];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_B_3_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[2];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[3];
            float _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float;
            Unity_Saturate_float(_Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float);
            float _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float, _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float);
            float _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float;
            Unity_Clamp_float(_Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float, 0, 1, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float);
            float4 _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4, (_Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float.xxxx), _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4);
            float _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float);
            float _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float;
            Unity_Subtract_float(_OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float, 0.5, _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float);
            float4 _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, (_Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float.xxxx), _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4);
            float _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float;
            Unity_Subtract_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, 0.5, _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float);
            float4 _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4;
            Unity_Add_float4(_Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4, (_Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float.xxxx), _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4);
            float4 _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4;
            Unity_Saturate_float4(_Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4, _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4);
            float _Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float = _ShapeAORemapMin;
            float _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2 = float2(_Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float, _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float);
            float _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2, _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float);
            float _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4, (_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float.xxxx), _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float);
            float _Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, (_Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float.xxxx), _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4);
            float _Split_473d9bf097327483847264a7cc5c61f9_R_1_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[0];
            float _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[1];
            float _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[2];
            float _Split_473d9bf097327483847264a7cc5c61f9_A_4_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[3];
            float _Split_2ffd394bfe87c786b791f90b404c032d_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2ffd394bfe87c786b791f90b404c032d_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2ffd394bfe87c786b791f90b404c032d_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            float _Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float;
            Unity_Multiply_float_float(_Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float);
            float _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float;
            Unity_Lerp_float(_Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float);
            float _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float;
            Unity_Lerp_float(_Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float, _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float);
            float _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float;
            Unity_Clamp_float(_Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float, 0, 1, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float);
            float4 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4;
            float3 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3;
            float2 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2;
            Unity_Combine_float(_Split_473d9bf097327483847264a7cc5c61f9_R_1_Float, _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float, _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2);
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            float _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float);
            float4 _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float.xxxx), _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4, _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4);
            float4 _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4);
            float4 _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4);
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_R_1_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[0];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_G_2_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[1];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_B_3_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[2];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[3];
            float _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float;
            Unity_Saturate_float(_Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float);
            float _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float, _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float);
            float _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float;
            Unity_Clamp_float(_Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float, 0, 1, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float);
            float4 _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4, (_Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float.xxxx), _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4);
            float _Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[0];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[1];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[2];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_A_4_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[3];
            float _Split_90237729226dca849687b6c56fde4cbe_R_1_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[0];
            float _Split_90237729226dca849687b6c56fde4cbe_G_2_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[1];
            float _Split_90237729226dca849687b6c56fde4cbe_B_3_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[2];
            float _Split_90237729226dca849687b6c56fde4cbe_A_4_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[3];
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_90237729226dca849687b6c56fde4cbe_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            float _Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float;
            Unity_Multiply_float_float(_Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float);
            float _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float;
            Unity_Lerp_float(_Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float);
            float _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float;
            Unity_Lerp_float(_Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float, _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float);
            float _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float;
            Unity_Clamp_float(_Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float, 0, 1, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float);
            float4 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4;
            float3 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3;
            float2 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2;
            Unity_Combine_float(_Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2);
            float _Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float = _ShapeHeightMapMin;
            float _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2 = float2(_Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float, _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float);
            float _Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2;
            Unity_Add_float2(_Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2, (_Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float.xx), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2);
            float _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, float2 (0, 1), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float);
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            UnityTexture2D _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormalMap);
            float4 _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4);
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_R_4_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.r;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_G_5_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.g;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_B_6_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.b;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_A_7_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.a;
            float _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float = _shapeNormalScale;
            float3 _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3);
            float3 _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3, _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3);
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            float _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float = _Shape_Normal_Cover_Scale;
            float3 _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3);
            float3 _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3);
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(4, _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, 0, 2, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, 0, 0.9999, _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, 45, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, 0, 2, _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(1, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, 1, _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, 0, 1, _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, -0.5, _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, 0, 1, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, 0, 1, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            float _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float;
            Unity_Saturate_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float);
            float _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float;
            Unity_Multiply_float_float(_Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float, _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float);
            float _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float;
            Unity_Clamp_float(_Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float, 0, 1, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float);
            UnityTexture2D _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.tex, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.samplerstate, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            float _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float);
            float _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float;
            Unity_Clamp_float(_Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float, 0, 1, _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float);
            float _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            float _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float;
            Unity_Add_float(_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float);
            float _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float;
            Unity_Branch_float(_Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float);
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_R_1_Float = IN.VertexColor[0];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_G_2_Float = IN.VertexColor[1];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float = IN.VertexColor[2];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_A_4_Float = IN.VertexColor[3];
            float _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572;
            float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float, _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float);
            float _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float);
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            float _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float, 0, 1, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float);
            float _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float);
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float, 0, 1, _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            float _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float;
            Unity_Multiply_float_float(_Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float);
            float _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float;
            Unity_Saturate_float(_Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float);
            float _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float);
            float _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float;
            Unity_Branch_float(_Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float);
            float4 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4;
            Unity_Lerp_float4(_Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4);
            float _Split_21e594714fe04537bf95c9e3c3e4428c_R_1_Float = IN.VertexColor[0];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float = IN.VertexColor[1];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_B_3_Float = IN.VertexColor[2];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_A_4_Float = IN.VertexColor[3];
            float _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d;
            float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float, _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float);
            float4 _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxxx), _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4);
            float4 _Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4 = _WetColor;
            float4 _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4);
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[0];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[1];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[2];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_A_4_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[3];
            float _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float = _WetSmoothness;
            float4 _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4 = float4(_Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float, _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float);
            float _Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean = _Dynamic_Flow;
            float _Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float = IN.VertexColor[0];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_G_2_Float = IN.VertexColor[1];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_B_3_Float = IN.VertexColor[2];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_A_4_Float = IN.VertexColor[3];
            float _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float;
            Unity_OneMinus_float(_Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float);
            float _Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float;
            Time_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float);
            float _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float, _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float);
            float _Add_6d46d247bde849839035d4123a598131_Out_2_Float;
            Unity_Add_float(_Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float);
            float _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float;
            Unity_Add_float(_Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float);
            float _Property_f54645916df346fd95d2d7f529255445_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float;
            Unity_Add_float(_Property_f54645916df346fd95d2d7f529255445_Out_0_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float);
            float4 _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4 = IN.uv2;
            float _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[0];
            float _Split_ff478e3a414149d1899086bef1db57c2_G_2_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[1];
            float _Split_ff478e3a414149d1899086bef1db57c2_B_3_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[2];
            float _Split_ff478e3a414149d1899086bef1db57c2_A_4_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[3];
            float _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float;
            Unity_Smoothstep_float(_Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float, _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float, _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float);
            float _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float, _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float);
            float _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float;
            Unity_Clamp_float(_OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float, 0, 1, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float);
            float _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float);
            float _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float;
            Unity_Branch_float(_Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float);
            float4 _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4, (_Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float.xxxx), _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4);
            float4 _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4);
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            float3 _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3);
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            float3 _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxx), _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3);
            float4 Color_aa34ac5fe2674640a3841c0fe0ae2bfa = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            float _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float;
            Unity_Lerp_float(0, _Split_866a663ed067f988862843fe32765ff8_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float);
            float _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float, _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float, _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float);
            float _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float;
            Unity_Absolute_float(_Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float, _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float);
            float _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float;
            Unity_Power_float(_Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float, _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float, _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float);
            float _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float;
            Unity_Lerp_float(0, _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float);
            float _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float, _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float, _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float);
            float _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float;
            Unity_Absolute_float(_Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float, _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float);
            float _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float;
            Unity_Power_float(_Absolute_b525073675d39a899115ebede3255a97_Out_1_Float, _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float);
            float _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float;
            Unity_Lerp_float(_Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float, _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float);
            float4 _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4, _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4);
            UnityTexture2D _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float4 _UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4 = IN.uv0;
            float2 _Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float;
            Time_float(_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float);
            float2 _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2, (_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float.xx), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2);
            float2 _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2;
            Unity_Add_float2((_UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4.xy), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2, _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2);
            float4 _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2) );
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_R_4_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.r;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_G_5_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.g;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_B_6_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.b;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.a;
            float2 _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2);
            float2 _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2, float2(0.5, 0.5), _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2);
            float4 _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2) );
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_R_4_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.r;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_G_5_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.g;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_B_6_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.b;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.a;
            float _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float, _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float, _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float);
            float _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float;
            Unity_Absolute_float(_Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float, _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float);
            float _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float = _EmissionNoisePower;
            float _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float;
            Unity_Power_float(_Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float, _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float, _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float);
            float _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float;
            Unity_Multiply_float_float(_Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float, 20, _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float);
            float _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float;
            Unity_Clamp_float(_Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float, 0.05, 1.2, _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float);
            float4 _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4, (_Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float.xxxx), _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4);
            float4 _Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3);
            float _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3, _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float);
            float _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float;
            Unity_Saturate_float(_DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float, _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float);
            float _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float;
            Unity_OneMinus_float(_Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float, _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float);
            float _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float;
            Unity_Absolute_float(_OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float, _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float);
            float _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float;
            Unity_Power_float(_Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float, 10, _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float);
            float4 _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4, (_Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float.xxxx), _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4);
            float _Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float = _RimLightPower;
            float4 _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4, (_Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4);
            float4 _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4);
            float4 _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4;
            Unity_Add_float4(_Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4, _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4);
            float4 _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4;
            Unity_Clamp_float4(_Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, float4(0, 0, 0, 0), _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4);
            float4 _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, Color_aa34ac5fe2674640a3841c0fe0ae2bfa, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4, _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4);
            float _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float = _BaseMetallic;
            float _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float;
            Unity_Multiply_float_float(_Split_866a663ed067f988862843fe32765ff8_R_1_Float, _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float, _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float);
            float _Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float = _BaseAORemapMin;
            float _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2 = float2(_Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float, _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float);
            float _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_G_2_Float, float2 (0, 1), _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float);
            float _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float;
            Unity_Multiply_float_float(_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float, _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float);
            float2 _Vector2_35e45ffc4faf2f849fb67cebe4bde9df_Out_0_Vector2 = float2(_Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float, _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float);
            float _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float = _CoverMetallic;
            float _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float;
            Unity_Multiply_float_float(_Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float, _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float, _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float);
            float _Property_e52744d22eaee787aba665b5a103092d_Out_0_Float = _CoverAORemapMin;
            float _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2 = float2(_Property_e52744d22eaee787aba665b5a103092d_Out_0_Float, _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float);
            float _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float, float2 (0, 1), _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float);
            float _Property_86575b0779e745fb86b6cd9291d107a5_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_91293abdf5be467a87f03f3e4b2307d6_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_d398aa54d2f841dba785c70ad157d8ce_Out_0_Vector2 = float2(_Property_86575b0779e745fb86b6cd9291d107a5_Out_0_Float, _Property_91293abdf5be467a87f03f3e4b2307d6_Out_0_Float);
            float _Remap_575a856b729f493098f2c156df451f84_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_d398aa54d2f841dba785c70ad157d8ce_Out_0_Vector2, _Remap_575a856b729f493098f2c156df451f84_Out_3_Float);
            float _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float;
            Unity_Multiply_float_float(_Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float, _Remap_575a856b729f493098f2c156df451f84_Out_3_Float, _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float);
            float2 _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2 = float2(_Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float, _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float);
            float2 _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2;
            Unity_Lerp_float2(_Vector2_35e45ffc4faf2f849fb67cebe4bde9df_Out_0_Vector2, _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xx), _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2);
            float2 _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2;
            Unity_Lerp_float2(_Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2, _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xx), _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2);
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float = _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2[0];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float = _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2[1];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float = 0;
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_A_4_Float = 0;
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_R_1_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[0];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_G_2_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[1];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_B_3_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[2];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_A_4_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[3];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_R_1_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[0];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_G_2_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[1];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_B_3_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[2];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_A_4_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[3];
            float _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float;
            Unity_Branch_float(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Split_5a15fb1c2ea6436f9136dad6b1edd181_A_4_Float, _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_A_4_Float, _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float);
            surface.BaseColor = (_Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4.xyz);
            surface.NormalTS = _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            surface.Emission = (_Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4.xyz);
            surface.Metallic = _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float;
            surface.Smoothness = _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float;
            surface.Occlusion = _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.WorldSpacePosition = input.positionWS;
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "GBuffer"
            Tags
            {
                "LightMode" = "UniversalGBuffer"
            }
        
        // Render State
        Cull Back
        Blend One Zero
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 4.5
        #pragma exclude_renderers gles gles3 glcore
        #pragma multi_compile_instancing
        #pragma multi_compile_fog
        #pragma instancing_options renderinglayer
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LIGHTMAP_ON
        #pragma multi_compile _ DYNAMICLIGHTMAP_ON
        #pragma multi_compile _ DIRLIGHTMAP_COMBINED
        #pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
        #pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
        #pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
        #pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
        #pragma multi_compile _ SHADOWS_SHADOWMASK
        #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
        #pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        #pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
        #pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
        #pragma multi_compile_fragment _ DEBUG_DISPLAY
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
        #define VARYINGS_NEED_SHADOW_COORD
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_GBUFFER
        #define _FOG_FRAGMENT 1
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh;
            #endif
             float4 fogFactorAndVertexLight;
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord;
            #endif
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 WorldSpacePosition;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if defined(LIGHTMAP_ON)
             float2 staticLightmapUV : INTERP0;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
             float2 dynamicLightmapUV : INTERP1;
            #endif
            #if !defined(LIGHTMAP_ON)
             float3 sh : INTERP2;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
             float4 shadowCoord : INTERP3;
            #endif
             float4 tangentWS : INTERP4;
             float4 texCoord0 : INTERP5;
             float4 texCoord2 : INTERP6;
             float4 color : INTERP7;
             float4 fogFactorAndVertexLight : INTERP8;
             float3 positionWS : INTERP9;
             float3 normalWS : INTERP10;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.fogFactorAndVertexLight.xyzw = input.fogFactorAndVertexLight;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if defined(LIGHTMAP_ON)
            output.staticLightmapUV = input.staticLightmapUV;
            #endif
            #if defined(DYNAMICLIGHTMAP_ON)
            output.dynamicLightmapUV = input.dynamicLightmapUV;
            #endif
            #if !defined(LIGHTMAP_ON)
            output.sh = input.sh;
            #endif
            #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
            output.shadowCoord = input.shadowCoord;
            #endif
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.fogFactorAndVertexLight = input.fogFactorAndVertexLight.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, 1);
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, 1);
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, 1);
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, 1);
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, 1);
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Lerp_float2(float2 A, float2 B, float2 T, out float2 Out)
        {
            Out = lerp(A, B, T);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 NormalTS;
            float3 Emission;
            float Metallic;
            float Smoothness;
            float Occlusion;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            UnityTexture2D _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4 = IN.uv0;
            float4 _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4 = IN.uv2;
            float4 _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4;
            Unity_Branch_float4(_Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean, _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4, _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4, _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4);
            float4 _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_93f9134325f7419191384c18129e58ce_R_1_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[0];
            float _Split_93f9134325f7419191384c18129e58ce_G_2_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[1];
            float _Split_93f9134325f7419191384c18129e58ce_B_3_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[2];
            float _Split_93f9134325f7419191384c18129e58ce_A_4_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[3];
            float2 _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_R_1_Float, _Split_93f9134325f7419191384c18129e58ce_G_2_Float);
            float2 _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_B_3_Float, _Split_93f9134325f7419191384c18129e58ce_A_4_Float);
            float2 _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4.xy), _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2, _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2, _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2);
            float4 _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.tex, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.samplerstate, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2) );
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.r;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_G_5_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.g;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_B_6_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.b;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_A_7_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.a;
            float _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float);
            float4 _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float.xxxx), _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4, _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4);
            float4 _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4);
            float4 _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4);
            UnityTexture2D _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4 = _ShapeTilingOffset;
            float _Split_48c02d4affa84aebbb872647b9335551_R_1_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[0];
            float _Split_48c02d4affa84aebbb872647b9335551_G_2_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[1];
            float _Split_48c02d4affa84aebbb872647b9335551_B_3_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[2];
            float _Split_48c02d4affa84aebbb872647b9335551_A_4_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[3];
            float2 _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_R_1_Float, _Split_48c02d4affa84aebbb872647b9335551_G_2_Float);
            float2 _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_B_3_Float, _Split_48c02d4affa84aebbb872647b9335551_A_4_Float);
            float2 _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2, _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2, _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2);
            float4 _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.r;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.g;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.b;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.a;
            float _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float, _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float);
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_R_1_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[0];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_G_2_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[1];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_B_3_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[2];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[3];
            float _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float;
            Unity_Saturate_float(_Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float);
            float _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float, _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float);
            float _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float;
            Unity_Clamp_float(_Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float, 0, 1, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float);
            float4 _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4, (_Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float.xxxx), _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4);
            float _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float);
            float _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float;
            Unity_Subtract_float(_OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float, 0.5, _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float);
            float4 _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, (_Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float.xxxx), _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4);
            float _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float;
            Unity_Subtract_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, 0.5, _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float);
            float4 _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4;
            Unity_Add_float4(_Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4, (_Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float.xxxx), _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4);
            float4 _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4;
            Unity_Saturate_float4(_Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4, _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4);
            float _Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float = _ShapeAORemapMin;
            float _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2 = float2(_Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float, _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float);
            float _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2, _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float);
            float _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4, (_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float.xxxx), _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float);
            float _Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, (_Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float.xxxx), _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4);
            float _Split_473d9bf097327483847264a7cc5c61f9_R_1_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[0];
            float _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[1];
            float _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[2];
            float _Split_473d9bf097327483847264a7cc5c61f9_A_4_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[3];
            float _Split_2ffd394bfe87c786b791f90b404c032d_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2ffd394bfe87c786b791f90b404c032d_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2ffd394bfe87c786b791f90b404c032d_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            float _Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float;
            Unity_Multiply_float_float(_Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float);
            float _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float;
            Unity_Lerp_float(_Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float);
            float _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float;
            Unity_Lerp_float(_Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float, _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float);
            float _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float;
            Unity_Clamp_float(_Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float, 0, 1, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float);
            float4 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4;
            float3 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3;
            float2 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2;
            Unity_Combine_float(_Split_473d9bf097327483847264a7cc5c61f9_R_1_Float, _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float, _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2);
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            float _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float);
            float4 _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float.xxxx), _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4, _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4);
            float4 _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4);
            float4 _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4);
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_R_1_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[0];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_G_2_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[1];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_B_3_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[2];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[3];
            float _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float;
            Unity_Saturate_float(_Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float);
            float _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float, _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float);
            float _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float;
            Unity_Clamp_float(_Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float, 0, 1, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float);
            float4 _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4, (_Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float.xxxx), _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4);
            float _Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[0];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[1];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[2];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_A_4_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[3];
            float _Split_90237729226dca849687b6c56fde4cbe_R_1_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[0];
            float _Split_90237729226dca849687b6c56fde4cbe_G_2_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[1];
            float _Split_90237729226dca849687b6c56fde4cbe_B_3_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[2];
            float _Split_90237729226dca849687b6c56fde4cbe_A_4_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[3];
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_90237729226dca849687b6c56fde4cbe_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            float _Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float;
            Unity_Multiply_float_float(_Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float);
            float _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float;
            Unity_Lerp_float(_Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float);
            float _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float;
            Unity_Lerp_float(_Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float, _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float);
            float _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float;
            Unity_Clamp_float(_Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float, 0, 1, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float);
            float4 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4;
            float3 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3;
            float2 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2;
            Unity_Combine_float(_Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2);
            float _Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float = _ShapeHeightMapMin;
            float _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2 = float2(_Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float, _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float);
            float _Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2;
            Unity_Add_float2(_Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2, (_Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float.xx), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2);
            float _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, float2 (0, 1), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float);
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            UnityTexture2D _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormalMap);
            float4 _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4);
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_R_4_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.r;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_G_5_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.g;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_B_6_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.b;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_A_7_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.a;
            float _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float = _shapeNormalScale;
            float3 _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3);
            float3 _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3, _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3);
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            float _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float = _Shape_Normal_Cover_Scale;
            float3 _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3);
            float3 _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3);
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(4, _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, 0, 2, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, 0, 0.9999, _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, 45, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, 0, 2, _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(1, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, 1, _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, 0, 1, _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, -0.5, _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, 0, 1, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, 0, 1, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            float _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float;
            Unity_Saturate_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float);
            float _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float;
            Unity_Multiply_float_float(_Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float, _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float);
            float _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float;
            Unity_Clamp_float(_Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float, 0, 1, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float);
            UnityTexture2D _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.tex, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.samplerstate, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            float _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float);
            float _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float;
            Unity_Clamp_float(_Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float, 0, 1, _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float);
            float _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            float _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float;
            Unity_Add_float(_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float);
            float _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float;
            Unity_Branch_float(_Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float);
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_R_1_Float = IN.VertexColor[0];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_G_2_Float = IN.VertexColor[1];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float = IN.VertexColor[2];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_A_4_Float = IN.VertexColor[3];
            float _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572;
            float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float, _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float);
            float _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float);
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            float _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float, 0, 1, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float);
            float _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float);
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float, 0, 1, _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            float _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float;
            Unity_Multiply_float_float(_Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float);
            float _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float;
            Unity_Saturate_float(_Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float);
            float _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float);
            float _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float;
            Unity_Branch_float(_Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float);
            float4 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4;
            Unity_Lerp_float4(_Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4);
            float _Split_21e594714fe04537bf95c9e3c3e4428c_R_1_Float = IN.VertexColor[0];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float = IN.VertexColor[1];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_B_3_Float = IN.VertexColor[2];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_A_4_Float = IN.VertexColor[3];
            float _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d;
            float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float, _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float);
            float4 _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxxx), _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4);
            float4 _Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4 = _WetColor;
            float4 _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4);
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[0];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[1];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[2];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_A_4_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[3];
            float _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float = _WetSmoothness;
            float4 _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4 = float4(_Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float, _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float);
            float _Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean = _Dynamic_Flow;
            float _Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float = IN.VertexColor[0];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_G_2_Float = IN.VertexColor[1];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_B_3_Float = IN.VertexColor[2];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_A_4_Float = IN.VertexColor[3];
            float _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float;
            Unity_OneMinus_float(_Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float);
            float _Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float;
            Time_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float);
            float _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float, _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float);
            float _Add_6d46d247bde849839035d4123a598131_Out_2_Float;
            Unity_Add_float(_Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float);
            float _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float;
            Unity_Add_float(_Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float);
            float _Property_f54645916df346fd95d2d7f529255445_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float;
            Unity_Add_float(_Property_f54645916df346fd95d2d7f529255445_Out_0_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float);
            float4 _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4 = IN.uv2;
            float _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[0];
            float _Split_ff478e3a414149d1899086bef1db57c2_G_2_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[1];
            float _Split_ff478e3a414149d1899086bef1db57c2_B_3_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[2];
            float _Split_ff478e3a414149d1899086bef1db57c2_A_4_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[3];
            float _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float;
            Unity_Smoothstep_float(_Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float, _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float, _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float);
            float _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float, _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float);
            float _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float;
            Unity_Clamp_float(_OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float, 0, 1, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float);
            float _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float);
            float _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float;
            Unity_Branch_float(_Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float);
            float4 _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4, (_Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float.xxxx), _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4);
            float4 _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4);
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            float3 _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3);
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            float3 _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxx), _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3);
            float4 Color_aa34ac5fe2674640a3841c0fe0ae2bfa = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            float _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float;
            Unity_Lerp_float(0, _Split_866a663ed067f988862843fe32765ff8_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float);
            float _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float, _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float, _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float);
            float _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float;
            Unity_Absolute_float(_Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float, _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float);
            float _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float;
            Unity_Power_float(_Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float, _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float, _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float);
            float _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float;
            Unity_Lerp_float(0, _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float);
            float _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float, _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float, _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float);
            float _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float;
            Unity_Absolute_float(_Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float, _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float);
            float _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float;
            Unity_Power_float(_Absolute_b525073675d39a899115ebede3255a97_Out_1_Float, _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float);
            float _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float;
            Unity_Lerp_float(_Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float, _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float);
            float4 _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4, _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4);
            UnityTexture2D _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float4 _UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4 = IN.uv0;
            float2 _Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float;
            Time_float(_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float);
            float2 _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2, (_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float.xx), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2);
            float2 _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2;
            Unity_Add_float2((_UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4.xy), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2, _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2);
            float4 _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2) );
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_R_4_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.r;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_G_5_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.g;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_B_6_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.b;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.a;
            float2 _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2);
            float2 _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2, float2(0.5, 0.5), _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2);
            float4 _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2) );
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_R_4_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.r;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_G_5_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.g;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_B_6_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.b;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.a;
            float _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float, _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float, _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float);
            float _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float;
            Unity_Absolute_float(_Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float, _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float);
            float _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float = _EmissionNoisePower;
            float _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float;
            Unity_Power_float(_Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float, _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float, _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float);
            float _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float;
            Unity_Multiply_float_float(_Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float, 20, _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float);
            float _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float;
            Unity_Clamp_float(_Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float, 0.05, 1.2, _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float);
            float4 _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4, (_Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float.xxxx), _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4);
            float4 _Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float3 _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3);
            float _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3, _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float);
            float _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float;
            Unity_Saturate_float(_DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float, _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float);
            float _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float;
            Unity_OneMinus_float(_Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float, _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float);
            float _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float;
            Unity_Absolute_float(_OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float, _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float);
            float _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float;
            Unity_Power_float(_Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float, 10, _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float);
            float4 _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4, (_Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float.xxxx), _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4);
            float _Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float = _RimLightPower;
            float4 _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4, (_Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4);
            float4 _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4);
            float4 _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4;
            Unity_Add_float4(_Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4, _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4);
            float4 _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4;
            Unity_Clamp_float4(_Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, float4(0, 0, 0, 0), _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4);
            float4 _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, Color_aa34ac5fe2674640a3841c0fe0ae2bfa, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4, _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4);
            float _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float = _BaseMetallic;
            float _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float;
            Unity_Multiply_float_float(_Split_866a663ed067f988862843fe32765ff8_R_1_Float, _Property_57dab79b7e7fc28c99642ba557430a27_Out_0_Float, _Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float);
            float _Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float = _BaseAORemapMin;
            float _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float = _BaseAORemapMax;
            float2 _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2 = float2(_Property_27a0c97d2207ca89af0ef30bd5d6c062_Out_0_Float, _Property_5a040fb62cd8888895d4f920c4036587_Out_0_Float);
            float _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float;
            Unity_Remap_float(_Split_866a663ed067f988862843fe32765ff8_G_2_Float, float2 (0, 1), _Vector2_6f9956f2c0302f8382a2f5c741da0609_Out_0_Vector2, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float);
            float _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float;
            Unity_Multiply_float_float(_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float, _Remap_de2674403349aa85b1136d42692d26f9_Out_3_Float, _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float);
            float2 _Vector2_35e45ffc4faf2f849fb67cebe4bde9df_Out_0_Vector2 = float2(_Multiply_aa5299d5bb4d2080af3ab6b593e1aa2c_Out_2_Float, _Multiply_16c922f2464c41bf97126bcead57b771_Out_2_Float);
            float _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float = _CoverMetallic;
            float _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float;
            Unity_Multiply_float_float(_Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float, _Property_7cf1f37cb0f052868aefa9c1514a9a20_Out_0_Float, _Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float);
            float _Property_e52744d22eaee787aba665b5a103092d_Out_0_Float = _CoverAORemapMin;
            float _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float = _CoverAORemapMax;
            float2 _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2 = float2(_Property_e52744d22eaee787aba665b5a103092d_Out_0_Float, _Property_f5216b23a41a0b888854c3e04c30f9fb_Out_0_Float);
            float _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float, float2 (0, 1), _Vector2_2d4e0b2bd57a668bb5e1d3f75180a968_Out_0_Vector2, _Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float);
            float _Property_86575b0779e745fb86b6cd9291d107a5_Out_0_Float = _ShapeAORemapMin_1;
            float _Property_91293abdf5be467a87f03f3e4b2307d6_Out_0_Float = _ShapeAORemapMax_1;
            float2 _Vector2_d398aa54d2f841dba785c70ad157d8ce_Out_0_Vector2 = float2(_Property_86575b0779e745fb86b6cd9291d107a5_Out_0_Float, _Property_91293abdf5be467a87f03f3e4b2307d6_Out_0_Float);
            float _Remap_575a856b729f493098f2c156df451f84_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_d398aa54d2f841dba785c70ad157d8ce_Out_0_Vector2, _Remap_575a856b729f493098f2c156df451f84_Out_3_Float);
            float _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float;
            Unity_Multiply_float_float(_Remap_d545ba99e5a8678cbf5b23383fafd8fb_Out_3_Float, _Remap_575a856b729f493098f2c156df451f84_Out_3_Float, _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float);
            float2 _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2 = float2(_Multiply_daff314f0b716c86b0dec03fe9225b8b_Out_2_Float, _Multiply_519b1a1581334b53bbd5da2ccfdd01a0_Out_2_Float);
            float2 _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2;
            Unity_Lerp_float2(_Vector2_35e45ffc4faf2f849fb67cebe4bde9df_Out_0_Vector2, _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xx), _Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2);
            float2 _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2;
            Unity_Lerp_float2(_Lerp_5d687668f4856180be26ec62834c6113_Out_3_Vector2, _Vector2_02007a1a174f2c8e8534dbee33a4b4cb_Out_0_Vector2, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xx), _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2);
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float = _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2[0];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float = _Lerp_663309414fc9048e81a0d762eb5db77d_Out_3_Vector2[1];
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_B_3_Float = 0;
            float _Split_22fc6cf606e48f8fa771c4e8cab49553_A_4_Float = 0;
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_R_1_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[0];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_G_2_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[1];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_B_3_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[2];
            float _Split_5a15fb1c2ea6436f9136dad6b1edd181_A_4_Float = _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4[3];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_R_1_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[0];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_G_2_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[1];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_B_3_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[2];
            float _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_A_4_Float = _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4[3];
            float _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float;
            Unity_Branch_float(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Split_5a15fb1c2ea6436f9136dad6b1edd181_A_4_Float, _Split_a7e4bd6e1ce6a78e8e86a8499037a07c_A_4_Float, _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float);
            surface.BaseColor = (_Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4.xyz);
            surface.NormalTS = _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            surface.Emission = (_Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4.xyz);
            surface.Metallic = _Split_22fc6cf606e48f8fa771c4e8cab49553_R_1_Float;
            surface.Smoothness = _Branch_8f0ef4022ead4f959cf0089b407b3757_Out_3_Float;
            surface.Occlusion = _Split_22fc6cf606e48f8fa771c4e8cab49553_G_2_Float;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.WorldSpacePosition = input.positionWS;
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ShadowCaster"
            Tags
            {
                "LightMode" = "ShadowCaster"
            }
        
        // Render State
        Cull Back
        ZTest LEqual
        ZWrite On
        ColorMask 0
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define VARYINGS_NEED_NORMAL_WS
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_SHADOWCASTER
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float3 normalWS : INTERP0;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthOnly"
            Tags
            {
                "LightMode" = "DepthOnly"
            }
        
        // Render State
        Cull Back
        ZTest LEqual
        ZWrite On
        ColorMask R
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "DepthNormals"
            Tags
            {
                "LightMode" = "DepthNormals"
            }
        
        // Render State
        Cull Back
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma multi_compile_instancing
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma multi_compile _ LOD_FADE_CROSSFADE
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHNORMALS
        #define USE_UNITY_CROSSFADE 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 TangentSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpacePosition;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 color : INTERP2;
             float3 positionWS : INTERP3;
             float3 normalWS : INTERP4;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, 1);
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, 1);
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, 1);
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, 1);
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, 1);
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 NormalTS;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            UnityTexture2D _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormalMap);
            float4 _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4 = _ShapeTilingOffset;
            float _Split_48c02d4affa84aebbb872647b9335551_R_1_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[0];
            float _Split_48c02d4affa84aebbb872647b9335551_G_2_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[1];
            float _Split_48c02d4affa84aebbb872647b9335551_B_3_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[2];
            float _Split_48c02d4affa84aebbb872647b9335551_A_4_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[3];
            float2 _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_R_1_Float, _Split_48c02d4affa84aebbb872647b9335551_G_2_Float);
            float2 _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_B_3_Float, _Split_48c02d4affa84aebbb872647b9335551_A_4_Float);
            float2 _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2, _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2, _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2);
            float4 _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4);
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_R_4_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.r;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_G_5_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.g;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_B_6_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.b;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_A_7_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.a;
            float _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float = _shapeNormalScale;
            float3 _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3);
            float3 _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3, _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3);
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            float _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float = _Shape_Normal_Cover_Scale;
            float3 _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3);
            float3 _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3);
            float _Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            UnityTexture2D _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.r;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.g;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.b;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.a;
            float _Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float = _ShapeHeightMapMin;
            float _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2 = float2(_Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float, _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float);
            float _Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2;
            Unity_Add_float2(_Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2, (_Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float.xx), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2);
            float _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, float2 (0, 1), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float);
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            float3 _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3);
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(4, _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, 0, 2, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, 0, 0.9999, _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, 45, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, 0, 2, _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(1, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, 1, _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, 0, 1, _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, -0.5, _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, 0, 1, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, 0, 1, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            float _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float;
            Unity_Saturate_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float);
            float _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float;
            Unity_Multiply_float_float(_Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float, _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float);
            float _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float;
            Unity_Clamp_float(_Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float, 0, 1, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float);
            UnityTexture2D _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.tex, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.samplerstate, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            float _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float);
            float _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float;
            Unity_Clamp_float(_Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float, 0, 1, _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float);
            float _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            float _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float;
            Unity_Add_float(_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float);
            float _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float;
            Unity_Branch_float(_Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float);
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_R_1_Float = IN.VertexColor[0];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_G_2_Float = IN.VertexColor[1];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float = IN.VertexColor[2];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_A_4_Float = IN.VertexColor[3];
            float _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572;
            float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float, _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float);
            float _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float);
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            float _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float, 0, 1, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float);
            float _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float);
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float, 0, 1, _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            float _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float;
            Unity_Multiply_float_float(_Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float);
            float _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float;
            Unity_Saturate_float(_Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float);
            float _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float);
            float _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float;
            Unity_Branch_float(_Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float);
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            float _Split_21e594714fe04537bf95c9e3c3e4428c_R_1_Float = IN.VertexColor[0];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float = IN.VertexColor[1];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_B_3_Float = IN.VertexColor[2];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_A_4_Float = IN.VertexColor[3];
            float _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d;
            float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float, _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float);
            float3 _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxx), _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3);
            surface.NormalTS = _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
            output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpacePosition = input.positionWS;
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "Meta"
            Tags
            {
                "LightMode" = "Meta"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        #pragma shader_feature _ EDITOR_VISUALIZATION
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD1
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD1
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_META
        #define _FOG_FRAGMENT 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv1 : TEXCOORD1;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord1;
             float4 texCoord2;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpaceViewDirection;
             float3 TangentSpaceViewDirection;
             float3 WorldSpacePosition;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 texCoord1 : INTERP2;
             float4 texCoord2 : INTERP3;
             float4 color : INTERP4;
             float3 positionWS : INTERP5;
             float3 normalWS : INTERP6;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord1.xyzw = input.texCoord1;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord1 = input.texCoord1.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, 1);
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, 1);
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, 1);
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, 1);
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, 1);
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        void Unity_Minimum_float(float A, float B, out float Out)
        {
            Out = min(A, B);
        };
        
        void Unity_DotProduct_float3(float3 A, float3 B, out float Out)
        {
            Out = dot(A, B);
        }
        
        void Unity_Clamp_float4(float4 In, float4 Min, float4 Max, out float4 Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
            float3 Emission;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            UnityTexture2D _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4 = IN.uv0;
            float4 _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4 = IN.uv2;
            float4 _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4;
            Unity_Branch_float4(_Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean, _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4, _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4, _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4);
            float4 _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_93f9134325f7419191384c18129e58ce_R_1_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[0];
            float _Split_93f9134325f7419191384c18129e58ce_G_2_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[1];
            float _Split_93f9134325f7419191384c18129e58ce_B_3_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[2];
            float _Split_93f9134325f7419191384c18129e58ce_A_4_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[3];
            float2 _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_R_1_Float, _Split_93f9134325f7419191384c18129e58ce_G_2_Float);
            float2 _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_B_3_Float, _Split_93f9134325f7419191384c18129e58ce_A_4_Float);
            float2 _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4.xy), _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2, _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2, _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2);
            float4 _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.tex, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.samplerstate, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2) );
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.r;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_G_5_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.g;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_B_6_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.b;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_A_7_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.a;
            float _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float);
            float4 _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float.xxxx), _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4, _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4);
            float4 _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4);
            float4 _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4);
            UnityTexture2D _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4 = _ShapeTilingOffset;
            float _Split_48c02d4affa84aebbb872647b9335551_R_1_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[0];
            float _Split_48c02d4affa84aebbb872647b9335551_G_2_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[1];
            float _Split_48c02d4affa84aebbb872647b9335551_B_3_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[2];
            float _Split_48c02d4affa84aebbb872647b9335551_A_4_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[3];
            float2 _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_R_1_Float, _Split_48c02d4affa84aebbb872647b9335551_G_2_Float);
            float2 _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_B_3_Float, _Split_48c02d4affa84aebbb872647b9335551_A_4_Float);
            float2 _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2, _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2, _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2);
            float4 _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.r;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.g;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.b;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.a;
            float _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float, _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float);
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_R_1_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[0];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_G_2_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[1];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_B_3_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[2];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[3];
            float _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float;
            Unity_Saturate_float(_Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float);
            float _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float, _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float);
            float _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float;
            Unity_Clamp_float(_Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float, 0, 1, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float);
            float4 _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4, (_Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float.xxxx), _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4);
            float _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float);
            float _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float;
            Unity_Subtract_float(_OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float, 0.5, _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float);
            float4 _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, (_Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float.xxxx), _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4);
            float _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float;
            Unity_Subtract_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, 0.5, _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float);
            float4 _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4;
            Unity_Add_float4(_Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4, (_Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float.xxxx), _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4);
            float4 _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4;
            Unity_Saturate_float4(_Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4, _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4);
            float _Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float = _ShapeAORemapMin;
            float _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2 = float2(_Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float, _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float);
            float _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2, _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float);
            float _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4, (_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float.xxxx), _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float);
            float _Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, (_Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float.xxxx), _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4);
            float _Split_473d9bf097327483847264a7cc5c61f9_R_1_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[0];
            float _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[1];
            float _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[2];
            float _Split_473d9bf097327483847264a7cc5c61f9_A_4_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[3];
            float _Split_2ffd394bfe87c786b791f90b404c032d_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2ffd394bfe87c786b791f90b404c032d_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2ffd394bfe87c786b791f90b404c032d_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            float _Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float;
            Unity_Multiply_float_float(_Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float);
            float _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float;
            Unity_Lerp_float(_Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float);
            float _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float;
            Unity_Lerp_float(_Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float, _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float);
            float _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float;
            Unity_Clamp_float(_Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float, 0, 1, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float);
            float4 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4;
            float3 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3;
            float2 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2;
            Unity_Combine_float(_Split_473d9bf097327483847264a7cc5c61f9_R_1_Float, _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float, _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2);
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            float _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float);
            float4 _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float.xxxx), _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4, _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4);
            float4 _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4);
            float4 _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4);
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_R_1_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[0];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_G_2_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[1];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_B_3_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[2];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[3];
            float _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float;
            Unity_Saturate_float(_Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float);
            float _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float, _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float);
            float _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float;
            Unity_Clamp_float(_Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float, 0, 1, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float);
            float4 _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4, (_Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float.xxxx), _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4);
            float _Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[0];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[1];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[2];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_A_4_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[3];
            float _Split_90237729226dca849687b6c56fde4cbe_R_1_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[0];
            float _Split_90237729226dca849687b6c56fde4cbe_G_2_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[1];
            float _Split_90237729226dca849687b6c56fde4cbe_B_3_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[2];
            float _Split_90237729226dca849687b6c56fde4cbe_A_4_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[3];
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_90237729226dca849687b6c56fde4cbe_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            float _Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float;
            Unity_Multiply_float_float(_Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float);
            float _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float;
            Unity_Lerp_float(_Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float);
            float _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float;
            Unity_Lerp_float(_Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float, _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float);
            float _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float;
            Unity_Clamp_float(_Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float, 0, 1, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float);
            float4 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4;
            float3 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3;
            float2 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2;
            Unity_Combine_float(_Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2);
            float _Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float = _ShapeHeightMapMin;
            float _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2 = float2(_Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float, _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float);
            float _Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2;
            Unity_Add_float2(_Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2, (_Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float.xx), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2);
            float _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, float2 (0, 1), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float);
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            UnityTexture2D _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormalMap);
            float4 _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4);
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_R_4_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.r;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_G_5_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.g;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_B_6_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.b;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_A_7_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.a;
            float _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float = _shapeNormalScale;
            float3 _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3);
            float3 _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3, _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3);
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            float _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float = _Shape_Normal_Cover_Scale;
            float3 _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3);
            float3 _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3);
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(4, _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, 0, 2, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, 0, 0.9999, _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, 45, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, 0, 2, _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(1, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, 1, _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, 0, 1, _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, -0.5, _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, 0, 1, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, 0, 1, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            float _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float;
            Unity_Saturate_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float);
            float _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float;
            Unity_Multiply_float_float(_Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float, _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float);
            float _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float;
            Unity_Clamp_float(_Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float, 0, 1, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float);
            UnityTexture2D _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.tex, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.samplerstate, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            float _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float);
            float _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float;
            Unity_Clamp_float(_Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float, 0, 1, _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float);
            float _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            float _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float;
            Unity_Add_float(_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float);
            float _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float;
            Unity_Branch_float(_Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float);
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_R_1_Float = IN.VertexColor[0];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_G_2_Float = IN.VertexColor[1];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float = IN.VertexColor[2];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_A_4_Float = IN.VertexColor[3];
            float _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572;
            float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float, _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float);
            float _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float);
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            float _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float, 0, 1, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float);
            float _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float);
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float, 0, 1, _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            float _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float;
            Unity_Multiply_float_float(_Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float);
            float _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float;
            Unity_Saturate_float(_Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float);
            float _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float);
            float _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float;
            Unity_Branch_float(_Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float);
            float4 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4;
            Unity_Lerp_float4(_Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4);
            float _Split_21e594714fe04537bf95c9e3c3e4428c_R_1_Float = IN.VertexColor[0];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float = IN.VertexColor[1];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_B_3_Float = IN.VertexColor[2];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_A_4_Float = IN.VertexColor[3];
            float _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d;
            float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float, _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float);
            float4 _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxxx), _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4);
            float4 _Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4 = _WetColor;
            float4 _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4);
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[0];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[1];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[2];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_A_4_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[3];
            float _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float = _WetSmoothness;
            float4 _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4 = float4(_Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float, _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float);
            float _Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean = _Dynamic_Flow;
            float _Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float = IN.VertexColor[0];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_G_2_Float = IN.VertexColor[1];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_B_3_Float = IN.VertexColor[2];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_A_4_Float = IN.VertexColor[3];
            float _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float;
            Unity_OneMinus_float(_Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float);
            float _Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float;
            Time_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float);
            float _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float, _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float);
            float _Add_6d46d247bde849839035d4123a598131_Out_2_Float;
            Unity_Add_float(_Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float);
            float _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float;
            Unity_Add_float(_Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float);
            float _Property_f54645916df346fd95d2d7f529255445_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float;
            Unity_Add_float(_Property_f54645916df346fd95d2d7f529255445_Out_0_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float);
            float4 _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4 = IN.uv2;
            float _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[0];
            float _Split_ff478e3a414149d1899086bef1db57c2_G_2_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[1];
            float _Split_ff478e3a414149d1899086bef1db57c2_B_3_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[2];
            float _Split_ff478e3a414149d1899086bef1db57c2_A_4_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[3];
            float _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float;
            Unity_Smoothstep_float(_Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float, _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float, _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float);
            float _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float, _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float);
            float _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float;
            Unity_Clamp_float(_OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float, 0, 1, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float);
            float _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float);
            float _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float;
            Unity_Branch_float(_Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float);
            float4 _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4, (_Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float.xxxx), _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4);
            float4 _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4);
            float4 Color_aa34ac5fe2674640a3841c0fe0ae2bfa = IsGammaSpace() ? LinearToSRGB(float4(0, 0, 0, 0)) : float4(0, 0, 0, 0);
            UnityTexture2D _Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4;
            float4 _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_080b6cb46abb00848263c964726eac36_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XZ_2_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_YZ_3_Vector4, _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XY_4_Vector4);
            float _Split_866a663ed067f988862843fe32765ff8_R_1_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[0];
            float _Split_866a663ed067f988862843fe32765ff8_G_2_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[1];
            float _Split_866a663ed067f988862843fe32765ff8_B_3_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[2];
            float _Split_866a663ed067f988862843fe32765ff8_A_4_Float = _TriplanarNM_26fef41c0b7e9a8489d2a70057ea5f5c_XYZ_1_Vector4[3];
            float _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float;
            Unity_Lerp_float(0, _Split_866a663ed067f988862843fe32765ff8_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float);
            float _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float = _BaseEmissionMaskIntensivity;
            float _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_5f90f3a8c0875b8dba6104925781fa20_Out_3_Float, _Property_3b34fa45052d748fb915b1e3fb7e9d8a_Out_0_Float, _Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float);
            float _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float;
            Unity_Absolute_float(_Multiply_12a2eb54cc86eb86a1638a18ab005d46_Out_2_Float, _Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float);
            float _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float = _BaseEmissionMaskTreshold;
            float _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float;
            Unity_Power_float(_Absolute_290a4d2bb2eea28689f7121b807ef95f_Out_1_Float, _Property_9c300a7423586c8db9e3b4b0d8a663e1_Out_0_Float, _Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float);
            float _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float;
            Unity_Lerp_float(0, _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float, _Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float);
            float _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float = _CoverEmissionMaskIntensivity;
            float _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float;
            Unity_Multiply_float_float(_Lerp_31e6810538a8b18ba21e2f8be0697d1c_Out_3_Float, _Property_b14b960de7b30882a67b30cf91355226_Out_0_Float, _Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float);
            float _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float;
            Unity_Absolute_float(_Multiply_688d5e023afdea8f88054040203609ac_Out_2_Float, _Absolute_b525073675d39a899115ebede3255a97_Out_1_Float);
            float _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float = _CoverEmissionMaskTreshold;
            float _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float;
            Unity_Power_float(_Absolute_b525073675d39a899115ebede3255a97_Out_1_Float, _Property_ab3a811e9cd94d8ba5d9c4359fa616b5_Out_0_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float);
            float _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float;
            Unity_Lerp_float(_Power_8e48bef60ea87e83ba184619ac54a7b8_Out_2_Float, _Power_fd909f27e3507185bcb862a17c2e116e_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float, _Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float);
            float4 _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_LavaEmissionColor) : _LavaEmissionColor;
            float4 _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Property_ddc70cd9f8a51285bec87e3a36e8a8c3_Out_0_Vector4, _Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4);
            UnityTexture2D _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_Noise);
            float4 _UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4 = IN.uv0;
            float2 _Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2 = _NoiseSpeed;
            float _TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float;
            Time_float(_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float);
            float2 _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Property_a80727d492d01d8089c04cd94ec07c46_Out_0_Vector2, (_TimeCustomFunction_707ade95061f4aa9b249112eb6b7f7d8_Out_0_Float.xx), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2);
            float2 _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2;
            Unity_Add_float2((_UV_c369740901256187ad88daf07715b2e3_Out_0_Vector4.xy), _Multiply_cd5bcd2048f2678fa02ede593ab4d2d8_Out_2_Vector2, _Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2);
            float4 _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2) );
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_R_4_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.r;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_G_5_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.g;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_B_6_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.b;
            float _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float = _SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_RGBA_0_Vector4.a;
            float2 _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2;
            Unity_Multiply_float2_float2(_Add_b3d98d1686821286bcf68b586df7cd89_Out_2_Vector2, float2(-1.2, -0.9), _Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2);
            float2 _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2;
            Unity_Add_float2(_Multiply_a30bca4a6e1d3b88a9301fe12222f3b6_Out_2_Vector2, float2(0.5, 0.5), _Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2);
            float4 _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.tex, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.samplerstate, _Property_06db73e8e11f9c8abfa43644a01a3ab2_Out_0_Texture2D.GetTransformedUV(_Add_eb332196877c1184b5369d9fc279b6d0_Out_2_Vector2) );
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_R_4_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.r;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_G_5_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.g;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_B_6_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.b;
            float _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float = _SampleTexture2D_3b378278284027879b56ab578e5b4b49_RGBA_0_Vector4.a;
            float _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float;
            Unity_Minimum_float(_SampleTexture2D_4e4d5b60d429698cbaafa05a35fd477a_A_7_Float, _SampleTexture2D_3b378278284027879b56ab578e5b4b49_A_7_Float, _Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float);
            float _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float;
            Unity_Absolute_float(_Minimum_ec82f646990c26839c6bdf24f2e92c00_Out_2_Float, _Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float);
            float _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float = _EmissionNoisePower;
            float _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float;
            Unity_Power_float(_Absolute_0699c0a655fdd18492f069fc4d20cb1b_Out_1_Float, _Property_e2f7253a3db7bc819f636af5d07eda55_Out_0_Float, _Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float);
            float _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float;
            Unity_Multiply_float_float(_Power_8acd39c3c215ca8abc1d4d3247833956_Out_2_Float, 20, _Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float);
            float _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float;
            Unity_Clamp_float(_Multiply_3886dd0ba60b7c87921a03f59cfe51fe_Out_2_Float, 0.05, 1.2, _Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float);
            float4 _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_9276911ebedfb887bd2587e8ae0a15ec_Out_2_Vector4, (_Clamp_cf682975d22a6584ad2fd459c809e51a_Out_3_Float.xxxx), _Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4);
            float4 _Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4 = IsGammaSpace() ? LinearToSRGB(_RimColor) : _RimColor;
            float _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float = _CoverNormalScale;
            float3 _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_0709d20641a7668b85ded82df467d4f4_Out_0_Float, _NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3);
            float3 _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_d90a27c667bbb48e9e15ec520c3e2ff3_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3);
            float3 _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxx), _Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3);
            float3 _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3;
            Unity_Lerp_float3(_Lerp_1ef9d67a29ba1b85a5434194628b76ad_Out_3_Vector3, _NormalBlend_5c055d13a30846b3953dbcfd9268aa0d_Out_2_Vector3, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxx), _Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3);
            float3 _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3;
            Unity_Normalize_float3(IN.TangentSpaceViewDirection, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3);
            float _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float;
            Unity_DotProduct_float3(_Lerp_d3331c4a8776428d8036f9315c776616_Out_3_Vector3, _Normalize_5840852513c50882be7896a398055011_Out_1_Vector3, _DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float);
            float _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float;
            Unity_Saturate_float(_DotProduct_966558055b7b598fa86eab1d0d6796f0_Out_2_Float, _Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float);
            float _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float;
            Unity_OneMinus_float(_Saturate_c4e5476beb9bf98095702b7be9a00f1a_Out_1_Float, _OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float);
            float _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float;
            Unity_Absolute_float(_OneMinus_6dbdfed5d3bac2888a672122a579e163_Out_1_Float, _Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float);
            float _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float;
            Unity_Power_float(_Absolute_eb669922f5466c80a1b7ea3a88320584_Out_1_Float, 10, _Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float);
            float4 _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_d018b0ca7c84a98db84dbe29259c44d1_Out_0_Vector4, (_Power_0f033f56feb0de89a9152324c9659e0a_Out_2_Float.xxxx), _Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4);
            float _Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float = _RimLightPower;
            float4 _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Multiply_aeb0f66f15292a8a9982fed9d4b46c1c_Out_2_Vector4, (_Property_e945f5cb8d55a88cb8d62dc7c139dedc_Out_0_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4);
            float4 _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4;
            Unity_Multiply_float4_float4((_Lerp_50ddcbc51efdb18bb0b22212b544441f_Out_3_Float.xxxx), _Multiply_d8a64c2d6fa9b985abde4f3a2776e06f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4);
            float4 _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4;
            Unity_Add_float4(_Multiply_2a2d03c9c581b68a98e435e4b39c072f_Out_2_Vector4, _Multiply_d28e615eb2b2628088d21d3a421d28c6_Out_2_Vector4, _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4);
            float4 _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4;
            Unity_Clamp_float4(_Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, float4(0, 0, 0, 0), _Add_3dd3e5e6370db98db08de7e3cc8c6fa8_Out_2_Vector4, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4);
            float4 _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, Color_aa34ac5fe2674640a3841c0fe0ae2bfa, _Clamp_cb735681159425838b158a92c7e830b0_Out_3_Vector4, _Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4);
            surface.BaseColor = (_Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4.xyz);
            surface.Emission = (_Branch_ea9b3aec558f43559802a60b7b0dd5fb_Out_3_Vector4.xyz);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpaceViewDirection = GetWorldSpaceNormalizeViewDir(input.positionWS);
            float3x3 tangentSpaceTransform = float3x3(output.WorldSpaceTangent, output.WorldSpaceBiTangent, output.WorldSpaceNormal);
            output.TangentSpaceViewDirection = mul(tangentSpaceTransform, output.WorldSpaceViewDirection);
            output.WorldSpacePosition = input.positionWS;
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "SceneSelectionPass"
            Tags
            {
                "LightMode" = "SceneSelectionPass"
            }
        
        // Render State
        Cull Off
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENESELECTIONPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            Name "ScenePickingPass"
            Tags
            {
                "LightMode" = "Picking"
            }
        
        // Render State
        Cull Back
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_DEPTHONLY
        #define SCENEPICKINGPASS 1
        #define ALPHA_CLIP_THRESHOLD 1
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
        
        
        
        
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
        Pass
        {
            // Name: <None>
            Tags
            {
                "LightMode" = "Universal2D"
            }
        
        // Render State
        Cull Back
        Blend One Zero
        ZTest LEqual
        ZWrite On
        
        // Debug
        // <None>
        
        // --------------------------------------------------
        // Pass
        
        HLSLPROGRAM
        
        // Pragmas
        #pragma target 2.0
        #pragma vertex vert
        #pragma fragment frag
        
        // Keywords
        // PassKeywords: <None>
        // GraphKeywords: <None>
        
        // Defines
        
        #define _NORMALMAP 1
        #define _NORMAL_DROPOFF_TS 1
        #define ATTRIBUTES_NEED_NORMAL
        #define ATTRIBUTES_NEED_TANGENT
        #define ATTRIBUTES_NEED_TEXCOORD0
        #define ATTRIBUTES_NEED_TEXCOORD2
        #define ATTRIBUTES_NEED_COLOR
        #define VARYINGS_NEED_POSITION_WS
        #define VARYINGS_NEED_NORMAL_WS
        #define VARYINGS_NEED_TANGENT_WS
        #define VARYINGS_NEED_TEXCOORD0
        #define VARYINGS_NEED_TEXCOORD2
        #define VARYINGS_NEED_COLOR
        #define FEATURES_GRAPH_VERTEX
        /* WARNING: $splice Could not find named fragment 'PassInstancing' */
        #define SHADERPASS SHADERPASS_2D
        
        
        // custom interpolator pre-include
        /* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */
        
        // Includes
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
        #include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
        #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
        
        // --------------------------------------------------
        // Structs and Packing
        
        // custom interpolators pre packing
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */
        
        struct Attributes
        {
             float3 positionOS : POSITION;
             float3 normalOS : NORMAL;
             float4 tangentOS : TANGENT;
             float4 uv0 : TEXCOORD0;
             float4 uv2 : TEXCOORD2;
             float4 color : COLOR;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : INSTANCEID_SEMANTIC;
            #endif
        };
        struct Varyings
        {
             float4 positionCS : SV_POSITION;
             float3 positionWS;
             float3 normalWS;
             float4 tangentWS;
             float4 texCoord0;
             float4 texCoord2;
             float4 color;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        struct SurfaceDescriptionInputs
        {
             float3 WorldSpaceNormal;
             float3 WorldSpaceTangent;
             float3 WorldSpaceBiTangent;
             float3 WorldSpacePosition;
             float3 AbsoluteWorldSpacePosition;
             float4 uv0;
             float4 uv2;
             float4 VertexColor;
        };
        struct VertexDescriptionInputs
        {
             float3 ObjectSpaceNormal;
             float3 ObjectSpaceTangent;
             float3 ObjectSpacePosition;
        };
        struct PackedVaryings
        {
             float4 positionCS : SV_POSITION;
             float4 tangentWS : INTERP0;
             float4 texCoord0 : INTERP1;
             float4 texCoord2 : INTERP2;
             float4 color : INTERP3;
             float3 positionWS : INTERP4;
             float3 normalWS : INTERP5;
            #if UNITY_ANY_INSTANCING_ENABLED
             uint instanceID : CUSTOM_INSTANCE_ID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
             uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
             uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
             FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
            #endif
        };
        
        PackedVaryings PackVaryings (Varyings input)
        {
            PackedVaryings output;
            ZERO_INITIALIZE(PackedVaryings, output);
            output.positionCS = input.positionCS;
            output.tangentWS.xyzw = input.tangentWS;
            output.texCoord0.xyzw = input.texCoord0;
            output.texCoord2.xyzw = input.texCoord2;
            output.color.xyzw = input.color;
            output.positionWS.xyz = input.positionWS;
            output.normalWS.xyz = input.normalWS;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        Varyings UnpackVaryings (PackedVaryings input)
        {
            Varyings output;
            output.positionCS = input.positionCS;
            output.tangentWS = input.tangentWS.xyzw;
            output.texCoord0 = input.texCoord0.xyzw;
            output.texCoord2 = input.texCoord2.xyzw;
            output.color = input.color.xyzw;
            output.positionWS = input.positionWS.xyz;
            output.normalWS = input.normalWS.xyz;
            #if UNITY_ANY_INSTANCING_ENABLED
            output.instanceID = input.instanceID;
            #endif
            #if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
            output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
            #endif
            #if (defined(UNITY_STEREO_INSTANCING_ENABLED))
            output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
            #endif
            #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
            output.cullFace = input.cullFace;
            #endif
            return output;
        }
        
        
        // --------------------------------------------------
        // Graph
        
        // Graph Properties
        CBUFFER_START(UnityPerMaterial)
        float Leaks_UV0_UV2_1;
        float _ShapeHeightMapMin;
        float _ShapeHeightMapMax;
        float _ShapeHeightMapOffset;
        float _Use_ShapeHeightBT_Static_MaskF;
        float _USECoverHeightT;
        float _VertexColorBBlendStrenght;
        float _VertexColorGBlendStrenght;
        float4 _WetColor;
        float _WetSmoothness;
        float _Wetness_T_Heat_F;
        float _LeaksSmoothnessMultiply_1;
        float4 _CoverLeaksColorMultiply;
        float4 _LeaksTilingOffset;
        float4 _ShapeTilingOffset;
        float4 _BaseLeaksColorMultiply;
        float4 _LeaksR_TexelSize;
        float _Shape_AO_Curvature_Reduction;
        float _CurvatureBlend;
        float _LeaksSmoothnessMultiply;
        float _Dynamic_Shape_V_Curve_Power;
        float _Shape_Normal_Cover_Scale;
        float _Dynamic_Start_Position_Offset;
        float _Dynamic_Shape_Speed;
        float _ShapeAORemapMin_1;
        float _ShapeAORemapMax_1;
        float _Dynamic_Flow;
        float4 _BaseColor;
        float4 _BaseColorMap_TexelSize;
        float4 _BaseTilingOffset;
        float _BaseTriplanarThreshold;
        float4 _BaseNormalMap_TexelSize;
        float _BaseNormalScale;
        float4 _BaseMaskMap_TexelSize;
        float _BaseMetallic;
        float _BaseAORemapMin;
        float _BaseAORemapMax;
        float _BaseSmoothnessRemapMin;
        float _BaseSmoothnessRemapMax;
        float4 _CoverMaskA_TexelSize;
        float _CoverMaskPower;
        float _Cover_Amount;
        float _Cover_Amount_Grow_Speed;
        float3 _CoverDirection;
        float _Cover_Max_Angle;
        float _Cover_Min_Height;
        float _Cover_Min_Height_Blending;
        float4 _CoverBaseColor;
        float4 _CoverBaseColorMap_TexelSize;
        float4 _CoverTilingOffset;
        float _CoverTriplanarThreshold;
        float4 _CoverNormalMap_TexelSize;
        float _CoverNormalScale;
        float _CoverNormalBlendHardness;
        float _CoverHardness;
        float _CoverHeightMapMin;
        float _CoverHeightMapMax;
        float _CoverHeightMapOffset;
        float4 _CoverMaskMap_TexelSize;
        float _CoverMetallic;
        float _CoverAORemapMin;
        float _CoverAORemapMax;
        float _CoverSmoothnessRemapMin;
        float _CoverSmoothnessRemapMax;
        float4 _ShapeNormalMap_TexelSize;
        float _shapeNormalScale;
        float4 _ShapeCurvAOHLeaksMask_TexelSize;
        float _ShapeAORemapMin;
        float _ShapeAORemapMax;
        float4 _LavaEmissionColor;
        float _BaseEmissionMaskIntensivity;
        float _BaseEmissionMaskTreshold;
        float _CoverEmissionMaskIntensivity;
        float _CoverEmissionMaskTreshold;
        float4 _RimColor;
        float _RimLightPower;
        float4 _Noise_TexelSize;
        float2 _NoiseTiling;
        float2 _NoiseSpeed;
        float _EmissionNoisePower;
        float _Dynamic_Reaction_Offset;
        float _USEDYNAMICCOVERTSTATICMASKF;
        CBUFFER_END
        
        
        // Object and Global properties
        SAMPLER(SamplerState_Linear_Repeat);
        SAMPLER(SamplerState_Linear_Repeat_Aniso8);
        TEXTURE2D(_LeaksR);
        SAMPLER(sampler_LeaksR);
        TEXTURE2D(_BaseColorMap);
        SAMPLER(sampler_BaseColorMap);
        TEXTURE2D(_BaseNormalMap);
        SAMPLER(sampler_BaseNormalMap);
        TEXTURE2D(_BaseMaskMap);
        SAMPLER(sampler_BaseMaskMap);
        TEXTURE2D(_CoverMaskA);
        SAMPLER(sampler_CoverMaskA);
        TEXTURE2D(_CoverBaseColorMap);
        SAMPLER(sampler_CoverBaseColorMap);
        TEXTURE2D(_CoverNormalMap);
        SAMPLER(sampler_CoverNormalMap);
        TEXTURE2D(_CoverMaskMap);
        SAMPLER(sampler_CoverMaskMap);
        TEXTURE2D(_ShapeNormalMap);
        SAMPLER(sampler_ShapeNormalMap);
        TEXTURE2D(_ShapeCurvAOHLeaksMask);
        SAMPLER(sampler_ShapeCurvAOHLeaksMask);
        TEXTURE2D(_Noise);
        SAMPLER(sampler_Noise);
        
        // Graph Includes
        #include "Assets/NatureManufacture Assets/Lava Shaders/NM_Lava_VSPro_Indirect.cginc"
        
        // -- Property used by ScenePickingPass
        #ifdef SCENEPICKINGPASS
        float4 _SelectionID;
        #endif
        
        // -- Properties used by SceneSelectionPass
        #ifdef SCENESELECTIONPASS
        int _ObjectId;
        int _PassValue;
        #endif
        
        // Graph Functions
        
        void AddPragma_float(float3 A, out float3 Out){
        #pragma instancing_options renderinglayer procedural:setupVSPro
        Out = A;
        }
        
        struct Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float
        {
        };
        
        void SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(float3 Vector3_314C8600, Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float IN, out float3 ObjectSpacePosition_1)
        {
        float3 _Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3 = Vector3_314C8600;
        float3 _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3;
        InjectSetup_float(_Property_5ec158abd968858c9d31ab40df5e9e6f_Out_0_Vector3, _InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3);
        float3 _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        AddPragma_float(_InjectSetupCustomFunction_dec9b26544b4a788b8ecb4117dc3d24a_Out_1_Vector3, _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3);
        ObjectSpacePosition_1 = _AddPragmaCustomFunction_b2a053178906d0848480a1f463521a1b_Out_1_Vector3;
        }
        
        void Unity_Divide_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A / B;
        }
        
        void Unity_Combine_float(float R, float G, float B, float A, out float4 RGBA, out float3 RGB, out float2 RG)
        {
            RGBA = float4(R, G, B, A);
            RGB = float3(R, G, B);
            RG = float2(R, G);
        }
        
        void Unity_Multiply_float4_float4(float4 A, float4 B, out float4 Out)
        {
        Out = A * B;
        }
        
        void Unity_Sign_float3(float3 In, out float3 Out)
        {
            Out = sign(In);
        }
        
        void Unity_Multiply_float2_float2(float2 A, float2 B, out float2 Out)
        {
        Out = A * B;
        }
        
        void Unity_Absolute_float3(float3 In, out float3 Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float3(float3 A, float3 B, out float3 Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Multiply_float3_float3(float3 A, float3 B, out float3 Out)
        {
        Out = A * B;
        }
        
        void Unity_Multiply_float_float(float A, float B, out float Out)
        {
        Out = A * B;
        }
        
        void Unity_Add_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float(float A, float B, out float Out)
        {
            Out = A + B;
        }
        
        struct Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float
        {
        float3 WorldSpaceNormal;
        float3 AbsoluteWorldSpacePosition;
        };
        
        void SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3);
        float _Split_742547a7039de986a646d04c157ae549_R_1_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[0];
        float _Split_742547a7039de986a646d04c157ae549_G_2_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[1];
        float _Split_742547a7039de986a646d04c157ae549_B_3_Float = _Sign_b826e0ff2d95ec8cb2b2cbbd7ea2eab6_Out_1_Vector3[2];
        float _Split_742547a7039de986a646d04c157ae549_A_4_Float = 0;
        float2 _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_G_2_Float, 1);
        float2 _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_40a8919e571ec18499de72022c155b38_Out_0_Vector2, _Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_5fa32af59cdca88389832336b2268bd5_Out_2_Vector2) );
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float4 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float;
        Unity_Multiply_float_float(_Split_742547a7039de986a646d04c157ae549_B_3_Float, -1, _Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float);
        float2 _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2 = float2(_Multiply_014402ded5a3988a8c18ba07636ea5a7_Out_2_Float, 1);
        float2 _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_caa25d55d456a58982bdfc39b1b43f3f_Out_0_Vector2, _Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a67201b6e1a0a28c98cd9d06e8b09543_Out_2_Vector2) );
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float4 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2 = float2(_Split_742547a7039de986a646d04c157ae549_R_1_Float, 1);
        float2 _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_54dfd40df2fc78809955dd272f2cf0c3_Out_0_Vector2, _Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_addbd5fcede95f80bbb806c94e49ef63_Out_2_Vector2) );
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float4 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4;
        Unity_Multiply_float4_float4(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4);
        float4 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4;
        Unity_Add_float4(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector4, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4);
        float4 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4;
        Unity_Add_float4(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector4, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector4, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float4 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        Unity_Divide_float4(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector4, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4);
        XYZ_1 = _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector4;
        XZ_2 = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4;
        YZ_3 = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4;
        XY_4 = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4;
        }
        
        void Unity_Branch_float4(float Predicate, float4 True, float4 False, out float4 Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_TilingAndOffset_float(float2 UV, float2 Tiling, float2 Offset, out float2 Out)
        {
            Out = UV * Tiling + Offset;
        }
        
        void Unity_OneMinus_float(float In, out float Out)
        {
            Out = 1 - In;
        }
        
        void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Saturate_float(float In, out float Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Clamp_float(float In, float Min, float Max, out float Out)
        {
            Out = clamp(In, Min, Max);
        }
        
        void Unity_Subtract_float(float A, float B, out float Out)
        {
            Out = A - B;
        }
        
        void Unity_Subtract_float4(float4 A, float4 B, out float4 Out)
        {
            Out = A - B;
        }
        
        void Unity_Saturate_float4(float4 In, out float4 Out)
        {
            Out = saturate(In);
        }
        
        void Unity_Remap_float(float In, float2 InMinMax, float2 OutMinMax, out float Out)
        {
            Out = OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
        }
        
        void Unity_Blend_Multiply_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
        {
            Out = Base * Blend;
            Out = lerp(Base, Out, Opacity);
        }
        
        void Unity_Lerp_float(float A, float B, float T, out float Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Add_float2(float2 A, float2 B, out float2 Out)
        {
            Out = A + B;
        }
        
        void Unity_Add_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A + B;
        }
        
        void Unity_Divide_float3(float3 A, float3 B, out float3 Out)
        {
            Out = A / B;
        }
        
        void Unity_Normalize_float3(float3 In, out float3 Out)
        {
            Out = normalize(In);
        }
        
        struct Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float
        {
        float3 WorldSpaceNormal;
        float3 WorldSpaceTangent;
        float3 WorldSpaceBiTangent;
        float3 WorldSpacePosition;
        };
        
        void SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(UnityTexture2D Texture2D_80A3D28F, float Vector1_41461AC9, float Vector1_E4D1C13A, Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float IN, out float4 XYZ_1, out float4 XZ_2, out float4 YZ_3, out float4 XY_4)
        {
        UnityTexture2D _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D = Texture2D_80A3D28F;
        float _Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float = IN.WorldSpacePosition[0];
        float _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float = IN.WorldSpacePosition[1];
        float _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float = IN.WorldSpacePosition[2];
        float _Split_89ed63cb625cb3878c183d0b71c03400_A_4_Float = 0;
        float4 _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4;
        float3 _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3;
        float2 _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, 0, 0, _Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, _Combine_cf2d04ff119ad88493f6460431765cbb_RGB_5_Vector3, _Combine_cf2d04ff119ad88493f6460431765cbb_RG_6_Vector2);
        float _Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float = Vector1_41461AC9;
        float4 _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_cf2d04ff119ad88493f6460431765cbb_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4);
        float3 _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3;
        Unity_Sign_float3(IN.WorldSpaceNormal, _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3);
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[0];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[1];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float = _Sign_3a6ebf59931cf08cb0482e0144ddac24_Out_1_Vector3[2];
        float _Split_6299d4ddcc4c74828aea40a46fdb896e_A_4_Float = 0;
        float2 _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_G_2_Float, 1);
        float2 _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_14cec4902d0a00829e4555071a1b8ad1_Out_2_Vector4.xy), _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2);
        float4 _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_a87753ad90594382bf3a3a95abbadbc8_Out_2_Vector2) );
        _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4);
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.r;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.g;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.b;
        float _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_A_7_Float = _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_RGBA_0_Vector4.a;
        float2 _Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2 = float2(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_R_4_Float, _SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_G_5_Float);
        float2 _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_ad6bd100e273d78fa409a30a77bfa2cc_Out_0_Vector2, _Vector2_b76cb1842101e58b9e636d49b075c612_Out_0_Vector2, _Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2);
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float = IN.WorldSpaceNormal[0];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float = IN.WorldSpaceNormal[1];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float = IN.WorldSpaceNormal[2];
        float _Split_5ed44bf2eca0868f81eb18100f49d1fa_A_4_Float = 0;
        float2 _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float);
        float2 _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2;
        Unity_Add_float2(_Multiply_31e8db88ee20c985a9850d1a58f3282b_Out_2_Vector2, _Vector2_70e5837843f28b8b9d64cada3697bd5a_Out_0_Vector2, _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2);
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[0];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float = _Add_1145b2f896593d80aa864a34e6702562_Out_2_Vector2[1];
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_B_3_Float = 0;
        float _Split_2bc77ca2d17bd78cb2383770ce50b179_A_4_Float = 0;
        float _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_35ddc0da4b30e48b83ca2d39af2aba2c_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float);
        float3 _Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3 = float3(_Split_2bc77ca2d17bd78cb2383770ce50b179_R_1_Float, _Multiply_e4fe778b81456d819c52bb414cd95968_Out_2_Float, _Split_2bc77ca2d17bd78cb2383770ce50b179_G_2_Float);
        float3 _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3;
        Unity_Absolute_float3(IN.WorldSpaceNormal, _Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3);
        float _Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float = Vector1_E4D1C13A;
        float3 _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3;
        Unity_Power_float3(_Absolute_644b798714827680b39bf5d34f70385f_Out_1_Vector3, (_Property_adc4c59482221c8aad681c6558728ac9_Out_0_Float.xxx), _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3);
        float3 _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Power_ee478822a04529849ae8df1636c29fe2_Out_2_Vector3, _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3);
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[0];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[1];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float = _Multiply_b386a937554d73828e437d126d69608b_Out_2_Vector3[2];
        float _Split_ae83014fcbd9f7879a0b91fa66dc9718_A_4_Float = 0;
        float3 _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float.xxx), _Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3);
        float4 _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4;
        float3 _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3;
        float2 _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_R_1_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, _Combine_192c2c4a69be588b90ca005a32e22552_RGB_5_Vector3, _Combine_192c2c4a69be588b90ca005a32e22552_RG_6_Vector2);
        float4 _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_192c2c4a69be588b90ca005a32e22552_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4);
        float _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float;
        Unity_Multiply_float_float(_Split_6299d4ddcc4c74828aea40a46fdb896e_B_3_Float, -1, _Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float);
        float2 _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2 = float2(_Multiply_de711f4a4614bd89a463b53374cf4036_Out_2_Float, 1);
        float2 _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_138240d0d4846e87b0febabec0d6891b_Out_2_Vector4.xy), _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2);
        float4 _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_2af6058cc6ccb88caefd2799bb5941e8_Out_2_Vector2) );
        _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4);
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.r;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.g;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.b;
        float _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_A_7_Float = _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_RGBA_0_Vector4.a;
        float2 _Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2 = float2(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_R_4_Float, _SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_G_5_Float);
        float2 _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_fe9aedd4528c7486ada4abdca0b0944e_Out_0_Vector2, _Vector2_4ed33f0c73b2698fa6f3c1b77fe76808_Out_0_Vector2, _Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2);
        float2 _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2;
        Unity_Add_float2(_Multiply_02b9b4665ad9918d8721bcaddc82f06f_Out_2_Vector2, _Vector2_a74a85274da15181abb63cc5e8df0de1_Out_0_Vector2, _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2);
        float _Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[0];
        float _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float = _Add_b227c84042055e8faa1a9fdc69529707_Out_2_Vector2[1];
        float _Split_2cfb9eacd8762483941459cdf28bda97_B_3_Float = 0;
        float _Split_2cfb9eacd8762483941459cdf28bda97_A_4_Float = 0;
        float _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_ba083a478bc22280af2e2cc93ffd5027_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3 = float3(_Split_2cfb9eacd8762483941459cdf28bda97_R_1_Float, _Split_2cfb9eacd8762483941459cdf28bda97_G_2_Float, _Multiply_1d65ce08ce672087879125f2e13c4004_Out_2_Float);
        float3 _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float.xxx), _Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3);
        float4 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4;
        float3 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3;
        float2 _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2;
        Unity_Combine_float(_Split_89ed63cb625cb3878c183d0b71c03400_B_3_Float, _Split_89ed63cb625cb3878c183d0b71c03400_G_2_Float, 0, 0, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGB_5_Vector3, _Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RG_6_Vector2);
        float4 _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4;
        Unity_Multiply_float4_float4(_Combine_1e9ffdba42d6918fb7a4b185f1585d2a_RGBA_4_Vector4, (_Property_47988ec10c0c18879d461e00bed806e7_Out_0_Float.xxxx), _Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4);
        float2 _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2 = float2(_Split_6299d4ddcc4c74828aea40a46fdb896e_R_1_Float, 1);
        float2 _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2;
        Unity_Multiply_float2_float2((_Multiply_2c0864423b014f8b8af8523f68cbb63c_Out_2_Vector4.xy), _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2);
        float4 _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_3e01b4d2fc68d48ba3acbba9d5881e59_Out_0_Texture2D.GetTransformedUV(_Multiply_862402885a49f18cb87278ab53bc6744_Out_2_Vector2) );
        _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4);
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.r;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.g;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.b;
        float _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_A_7_Float = _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_RGBA_0_Vector4.a;
        float _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float;
        Unity_Multiply_float_float(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_B_6_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_R_1_Float, _Multiply_4649b768be76d784a3284bacde795359_Out_2_Float);
        float2 _Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2 = float2(_SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_R_4_Float, _SampleTexture2D_30c5fd692044ae87b9c4029fa46973fa_G_5_Float);
        float2 _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2;
        Unity_Multiply_float2_float2(_Vector2_819fcd5eb484438eacad1987576d7d67_Out_0_Vector2, _Vector2_a1e23e0f921b6484818f009a2b12a5ba_Out_0_Vector2, _Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2);
        float2 _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2 = float2(_Split_5ed44bf2eca0868f81eb18100f49d1fa_B_3_Float, _Split_5ed44bf2eca0868f81eb18100f49d1fa_G_2_Float);
        float2 _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2;
        Unity_Add_float2(_Multiply_58530ebb3c6d798b93686a76247bf505_Out_2_Vector2, _Vector2_e293c112b2f49e88a5fe46dfb1fbeb40_Out_0_Vector2, _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2);
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[0];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float = _Add_cf00fb232c6e2b8e973ab2f84453f55e_Out_2_Vector2[1];
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_B_3_Float = 0;
        float _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_A_4_Float = 0;
        float3 _Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3 = float3(_Multiply_4649b768be76d784a3284bacde795359_Out_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_G_2_Float, _Split_3ea3e61d32bdd78f82c686b75ff3fd9b_R_1_Float);
        float3 _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3;
        Unity_Multiply_float3_float3(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, (_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float.xxx), _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3);
        float3 _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3;
        Unity_Add_float3(_Multiply_7bb4009c92b108849ac6ca92bc1442f2_Out_2_Vector3, _Multiply_77818c22e359fc8cbb7dd20216a8db72_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3);
        float3 _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3;
        Unity_Add_float3(_Multiply_2e1040ca9c98d085ace76ee93f094039_Out_2_Vector3, _Add_769d9ee909c9238dbbf72d2800a2f268_Out_2_Vector3, _Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3);
        float _Add_e59af300bba2498db32eac1412123447_Out_2_Float;
        Unity_Add_float(_Split_ae83014fcbd9f7879a0b91fa66dc9718_R_1_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_G_2_Float, _Add_e59af300bba2498db32eac1412123447_Out_2_Float);
        float _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float;
        Unity_Add_float(_Add_e59af300bba2498db32eac1412123447_Out_2_Float, _Split_ae83014fcbd9f7879a0b91fa66dc9718_B_3_Float, _Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float);
        float3 _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3;
        Unity_Divide_float3(_Add_14295f72880e4b87a1baf1ced943ac40_Out_2_Vector3, (_Add_e855069f047fae8ea9027d56acb61e56_Out_2_Float.xxx), _Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3);
        float3 _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3;
        {
        float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
        _Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3 = TransformWorldToTangentDir(_Divide_91ae4b94f1d9b78e99d0472293b8098c_Out_2_Vector3.xyz, tangentTransform, true);
        }
        float3 _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3;
        Unity_Normalize_float3(_Transform_73eecc0c3689d184a34c8d0f28a58adf_Out_1_Vector3, _Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3);
        XYZ_1 = (float4(_Normalize_15ef346824db0a8797631ed8b998e673_Out_1_Vector3, 1.0));
        XZ_2 = (float4(_Vector3_08f62c5c01619e849f1a7d85a44531ac_Out_0_Vector3, 1.0));
        YZ_3 = (float4(_Vector3_ba6cfb4671e8c58f9b41ea1dc23102ca_Out_0_Vector3, 1.0));
        XY_4 = (float4(_Vector3_13a08d5940172a84a78ee3d9b8766833_Out_0_Vector3, 1.0));
        }
        
        void Unity_NormalStrength_float(float3 In, float Strength, out float3 Out)
        {
            Out = float3(In.rg * Strength, lerp(1, In.b, saturate(Strength)));
        }
        
        void Unity_NormalBlend_float(float3 A, float3 B, out float3 Out)
        {
            Out = SafeNormalize(float3(A.rg + B.rg, A.b * B.b));
        }
        
        void Unity_Divide_float(float A, float B, out float Out)
        {
            Out = A / B;
        }
        
        void Unity_Absolute_float(float In, out float Out)
        {
            Out = abs(In);
        }
        
        void Unity_Power_float(float A, float B, out float Out)
        {
            Out = pow(A, B);
        }
        
        void Unity_Lerp_float3(float3 A, float3 B, float3 T, out float3 Out)
        {
            Out = lerp(A, B, T);
        }
        
        void Unity_Branch_float(float Predicate, float True, float False, out float Out)
        {
            Out = Predicate ? True : False;
        }
        
        void Unity_Comparison_Greater_float(float A, float B, out float Out)
        {
            Out = A > B ? 1 : 0;
        }
        
        struct Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float
        {
        };
        
        void SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(float _Vertex_Color, float _Vertex_Color_B_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_B_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        struct Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float
        {
        };
        
        void SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(float _Vertex_Color, float _Vertex_Color_G_Blend_Strenght, float _Shape_Heightmap, float _Use_Shape_Height_B_T_Cover_Mask_F, float _Cover_Heightmap, float _Use_Cover_Height_T, float2 _Shape_Before_Remap, float2 _Cover_Before_Remap, Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float IN, out float OutVector1_1)
        {
        float _Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float = _Vertex_Color;
        float _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean;
        Unity_Comparison_Greater_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, 0.99, _Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean);
        float _Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean = _Use_Shape_Height_B_T_Cover_Mask_F;
        float _Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float = _Shape_Heightmap;
        float2 _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2 = _Shape_Before_Remap;
        float _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[0];
        float _Split_cde172ab161d44cb81ea7874aec65560_G_2_Float = _Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2[1];
        float _Split_cde172ab161d44cb81ea7874aec65560_B_3_Float = 0;
        float _Split_cde172ab161d44cb81ea7874aec65560_A_4_Float = 0;
        float _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float;
        Unity_Subtract_float(_Split_cde172ab161d44cb81ea7874aec65560_G_2_Float, _Split_cde172ab161d44cb81ea7874aec65560_R_1_Float, _Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float);
        float _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float;
        Unity_OneMinus_float(_Property_b3ca7054ef0043de85912fc45d997ea2_Out_0_Float, _OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float);
        float _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float;
        Unity_Clamp_float(_OneMinus_85e3550f37814cd3ab5ea5dde7f63a73_Out_1_Float, 0, 1, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float);
        float _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_e1e98a956721410caddfb467ae0eca8b_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float);
        float _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float;
        Unity_Absolute_float(_Multiply_41691d316de74fef8a4ab5f63ed5474e_Out_2_Float, _Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float);
        float2 _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2;
        Unity_Add_float2(_Property_e748f6c127e0479a9a01040378a4129b_Out_0_Vector2, (_Absolute_4120403f15fc42ba8151be019a386fe8_Out_1_Float.xx), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2);
        float _Remap_21f3372608424df090026adc73778a39_Out_3_Float;
        Unity_Remap_float(_Property_9634fd87d3374fdaa60181281a01f9b5_Out_0_Float, float2 (0, 1), _Add_48d37f8b8a464788860db14f0da8a66e_Out_2_Vector2, _Remap_21f3372608424df090026adc73778a39_Out_3_Float);
        float _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float;
        Unity_Clamp_float(_Remap_21f3372608424df090026adc73778a39_Out_3_Float, 0, 1, _Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float);
        float _Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean = _Use_Cover_Height_T;
        float _Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float = _Cover_Heightmap;
        float2 _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2 = _Cover_Before_Remap;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[0];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float = _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2[1];
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_B_3_Float = 0;
        float _Split_bad56a0d03154ccc8cbfb53ea0e381d4_A_4_Float = 0;
        float _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float;
        Unity_Subtract_float(_Split_bad56a0d03154ccc8cbfb53ea0e381d4_G_2_Float, _Split_bad56a0d03154ccc8cbfb53ea0e381d4_R_1_Float, _Subtract_2a7908018c384526a00494520503a83d_Out_2_Float);
        float _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float;
        Unity_Multiply_float_float(_Subtract_2a7908018c384526a00494520503a83d_Out_2_Float, _Clamp_ac4097026e6248dbb7a95fe910cc776e_Out_3_Float, _Multiply_417d72157b5f4930aed43775db746964_Out_2_Float);
        float _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float;
        Unity_Absolute_float(_Multiply_417d72157b5f4930aed43775db746964_Out_2_Float, _Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float);
        float2 _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2;
        Unity_Add_float2((_Absolute_3274a9896dc742fe99a03edb664b8c8d_Out_1_Float.xx), _Property_555a7734da754b989d8f80ef0bc86bea_Out_0_Vector2, _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2);
        float _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float;
        Unity_Remap_float(_Property_b0e4a5720c374e2eb6f203a1bd075243_Out_0_Float, float2 (0, 1), _Add_3d7e111e917c44e8a6800ce926fac67d_Out_2_Vector2, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float);
        float _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float;
        Unity_Branch_float(_Property_457e05a76c034ada998b3ff30a7781c3_Out_0_Boolean, _Remap_931f83440e6c4c1588456788f84cbd9a_Out_3_Float, 1, _Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float);
        float _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float;
        Unity_Clamp_float(_Branch_a840aba5bca34588a2665f9794c96c38_Out_3_Float, 0, 1, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float);
        float _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float;
        Unity_Multiply_float_float(_Clamp_8ea719b357b44537b42b2d05c22046f6_Out_3_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float);
        float _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float;
        Unity_Branch_float(_Property_cfe724908035497c918d6d3f8dafe439_Out_0_Boolean, _Multiply_c045ae9912ac409b9734c687968d47f6_Out_2_Float, _Clamp_b1fe959daf444bf99c57756b8be77768_Out_3_Float, _Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float);
        float _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float;
        Unity_Saturate_float(_Branch_5198cfc0a080466e93cf89aea61886e6_Out_3_Float, _Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float);
        float _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float;
        Unity_Absolute_float(_Saturate_ceafe30b0bae4f45a2f2ec500925b553_Out_1_Float, _Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float);
        float _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float = _Vertex_Color_G_Blend_Strenght;
        float _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float;
        Unity_Power_float(_Absolute_274083e3f9f645bfb86074d91f3b7c62_Out_1_Float, _Property_c68e0b8a84a549a582d4723036344b0e_Out_0_Float, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float);
        float _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float;
        Unity_Branch_float(_Comparison_5be6aeaa514b4921b5eb68269b58b028_Out_2_Boolean, 0, _Power_c9d62a3092174d9cb5674d87bcb7b5c5_Out_2_Float, _Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float);
        float _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        Unity_Clamp_float(_Branch_2425ee869bde4930bb8f36a5273bdc33_Out_3_Float, 0, 1, _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float);
        OutVector1_1 = _Clamp_9a5c5cfe52824e248ea0a8e38c593d84_Out_3_Float;
        }
        
        void Time_float(out float Out){
            Out = _Time.y;
        }
        
        void Unity_Smoothstep_float(float Edge1, float Edge2, float In, out float Out)
        {
            Out = smoothstep(Edge1, Edge2, In);
        }
        
        // Custom interpolators pre vertex
        /* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */
        
        // Graph Vertex
        struct VertexDescription
        {
            float3 Position;
            float3 Normal;
            float3 Tangent;
        };
        
        VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
        {
            VertexDescription description = (VertexDescription)0;
            Bindings_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88;
            float3 _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            SG_NMLavaVSProIndirect_25f0d25648f9d4f45a0add4ada64b857_float(IN.ObjectSpacePosition, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88, _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3);
            description.Position = _NMLavaVSProIndirect_448d69b79cef5187a0e10128bbc84f88_ObjectSpacePosition_1_Vector3;
            description.Normal = IN.ObjectSpaceNormal;
            description.Tangent = IN.ObjectSpaceTangent;
            return description;
        }
        
        // Custom interpolators, pre surface
        #ifdef FEATURES_GRAPH_VERTEX
        Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
        {
        return output;
        }
        #define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
        #endif
        
        // Graph Pixel
        struct SurfaceDescription
        {
            float3 BaseColor;
        };
        
        SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
        {
            SurfaceDescription surface = (SurfaceDescription)0;
            float _Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean = _Wetness_T_Heat_F;
            UnityTexture2D _Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseColorMap);
            float4 _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4 = _BaseTilingOffset;
            float4 _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_d4a357b2daff5587ae46468726a33797_Out_0_Vector4, _Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4);
            float _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float = _BaseTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4;
            float4 _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_d92b1410e1d6bc81a86076b09e35f302_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XZ_2_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_YZ_3_Vector4, _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XY_4_Vector4);
            float4 _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4 = _BaseColor;
            float4 _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4, _Property_17f0f1bec4ec6485881127275660d4f1_Out_0_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4);
            UnityTexture2D _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_LeaksR);
            float _Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean = Leaks_UV0_UV2_1;
            float4 _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4 = IN.uv0;
            float4 _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4 = IN.uv2;
            float4 _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4;
            Unity_Branch_float4(_Property_02cd2ffd1c2948499ae7925b846edf24_Out_0_Boolean, _UV_99c00abf36904ef3a7c02624ac0540bb_Out_0_Vector4, _UV_fc8ff3a888e34583adcda8342c5bacac_Out_0_Vector4, _Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4);
            float4 _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4 = _LeaksTilingOffset;
            float _Split_93f9134325f7419191384c18129e58ce_R_1_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[0];
            float _Split_93f9134325f7419191384c18129e58ce_G_2_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[1];
            float _Split_93f9134325f7419191384c18129e58ce_B_3_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[2];
            float _Split_93f9134325f7419191384c18129e58ce_A_4_Float = _Property_a064fb07e27b4280bd387bd4fd350996_Out_0_Vector4[3];
            float2 _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_R_1_Float, _Split_93f9134325f7419191384c18129e58ce_G_2_Float);
            float2 _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2 = float2(_Split_93f9134325f7419191384c18129e58ce_B_3_Float, _Split_93f9134325f7419191384c18129e58ce_A_4_Float);
            float2 _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2;
            Unity_TilingAndOffset_float((_Branch_fcd55500710147daaf6d5ee16608849f_Out_3_Vector4.xy), _Vector2_42bc0b1bddca4d4a9846cc19ddb00a89_Out_0_Vector2, _Vector2_50bcb3326edb4d2ebc248b97beee5e2a_Out_0_Vector2, _TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2);
            float4 _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.tex, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.samplerstate, _Property_858a0e3939834c3a8747a7d571aeae16_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_cb1b2771255c49aea127494280873481_Out_3_Vector2) );
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.r;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_G_5_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.g;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_B_6_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.b;
            float _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_A_7_Float = _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_RGBA_0_Vector4.a;
            float _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float);
            float4 _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4 = _BaseLeaksColorMultiply;
            float4 _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_5fbd807bb3604fb1abbdb6e1f9d01fdc_Out_1_Float.xxxx), _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4, _Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4);
            float4 _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_b522094baf5b465782294ba2e5050ecd_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4);
            float4 _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_85caa314d2c141c5bc95e9fbc4865db2_Out_3_Vector4, _Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4);
            UnityTexture2D _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeCurvAOHLeaksMask);
            float4 _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4 = _ShapeTilingOffset;
            float _Split_48c02d4affa84aebbb872647b9335551_R_1_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[0];
            float _Split_48c02d4affa84aebbb872647b9335551_G_2_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[1];
            float _Split_48c02d4affa84aebbb872647b9335551_B_3_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[2];
            float _Split_48c02d4affa84aebbb872647b9335551_A_4_Float = _Property_6952ac8510b3476d9bb4c67529cb17f4_Out_0_Vector4[3];
            float2 _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_R_1_Float, _Split_48c02d4affa84aebbb872647b9335551_G_2_Float);
            float2 _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2 = float2(_Split_48c02d4affa84aebbb872647b9335551_B_3_Float, _Split_48c02d4affa84aebbb872647b9335551_A_4_Float);
            float2 _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2;
            Unity_TilingAndOffset_float(IN.uv0.xy, _Vector2_bd8f0d7ffe434468b51374fe3ebea76c_Out_0_Vector2, _Vector2_4d7dd49978cf4af5a7f1cd33365622f8_Out_0_Vector2, _TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2);
            float4 _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_e79cb539c39d3c89a07c32a617c20743_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.r;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.g;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.b;
            float _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float = _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_RGBA_0_Vector4.a;
            float _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_A_7_Float, _OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float);
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_R_1_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[0];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_G_2_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[1];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_B_3_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[2];
            float _Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float = _Property_73c5deefb3d040a688d251ed49bbd635_Out_0_Vector4[3];
            float _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float;
            Unity_Saturate_float(_Split_2ce2fde5193746e195fc02b98ace3bfd_A_4_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float);
            float _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_7873ac8263954ef390ccdc7ea9627592_Out_1_Float, _Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float);
            float _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float;
            Unity_Clamp_float(_Multiply_a9dc1cc9392141e1955f9e5525a6c17d_Out_2_Float, 0, 1, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float);
            float4 _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_6434c1e27d77608fb8dcec94697eb8d3_Out_2_Vector4, _Multiply_348898fc7225491b9eb7056b323bb170_Out_2_Vector4, (_Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float.xxxx), _Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4);
            float _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, _OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float);
            float _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float;
            Unity_Subtract_float(_OneMinus_7359fa0adf20438b85a56ec86466e811_Out_1_Float, 0.5, _Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float);
            float4 _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4;
            Unity_Subtract_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, (_Subtract_8b965513bbc94de29aab5cd625b620cc_Out_2_Float.xxxx), _Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4);
            float _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float;
            Unity_Subtract_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_R_4_Float, 0.5, _Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float);
            float4 _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4;
            Unity_Add_float4(_Subtract_ea5e7a3a573d4327a95371749f8a3518_Out_2_Vector4, (_Subtract_eb816ad9732042f19f4c265d149eb128_Out_2_Float.xxxx), _Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4);
            float4 _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4;
            Unity_Saturate_float4(_Add_3590ad9c28ee43ea94b3cc347159b2d6_Out_2_Vector4, _Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4);
            float _Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float = _ShapeAORemapMin;
            float _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float = _ShapeAORemapMax;
            float2 _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2 = float2(_Property_63f8c3031bbcaf85ae1238855b136361_Out_0_Float, _Property_fea51294c1d0368ab6745cb5f9a3288f_Out_0_Float);
            float _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_G_5_Float, float2 (0, 1), _Vector2_57e674d0c259cb8e9896f1a7755f6eaf_Out_0_Vector2, _Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float);
            float _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float = _Shape_AO_Curvature_Reduction;
            float4 _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4;
            Unity_Blend_Multiply_float4(_Saturate_fcec248126464fa7a92b6c2d9808d73e_Out_1_Vector4, (_Remap_7393028af14ea9889d2fce555d02c2ff_Out_3_Float.xxxx), _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, _Property_dfde71e9fd2f43dcbad6dfb9f20a331c_Out_0_Float);
            float _Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float = _CurvatureBlend;
            float4 _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_a1c68b1265f346b8a8071c9e5bf91583_Out_3_Vector4, _Blend_949fe9decdb2475b84817b1c9077b21c_Out_2_Vector4, (_Property_56e154b1030c42c4a11110e7be926cb5_Out_0_Float.xxxx), _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4);
            float _Split_473d9bf097327483847264a7cc5c61f9_R_1_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[0];
            float _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[1];
            float _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[2];
            float _Split_473d9bf097327483847264a7cc5c61f9_A_4_Float = _Lerp_0cd7e843b9ff4bcd89913e56de25afcc_Out_3_Vector4[3];
            float _Split_2ffd394bfe87c786b791f90b404c032d_R_1_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[0];
            float _Split_2ffd394bfe87c786b791f90b404c032d_G_2_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[1];
            float _Split_2ffd394bfe87c786b791f90b404c032d_B_3_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[2];
            float _Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float = _TriplanarNM_2b9b27a1a1bba68194edddb5fe422579_XYZ_1_Vector4[3];
            float _Property_a1b1d767544de781a39d6415872f7285_Out_0_Float = _BaseSmoothnessRemapMin;
            float _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float = _BaseSmoothnessRemapMax;
            float2 _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2 = float2(_Property_a1b1d767544de781a39d6415872f7285_Out_0_Float, _Property_a0fd73b9dac07285b1d70b54ca659a15_Out_0_Float);
            float _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float;
            Unity_Remap_float(_Split_2ffd394bfe87c786b791f90b404c032d_A_4_Float, float2 (0, 1), _Vector2_fc66e35bdc72f589a802edd7bfb7555b_Out_0_Vector2, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float);
            float _Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float = _LeaksSmoothnessMultiply;
            float _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float;
            Unity_Multiply_float_float(_Property_8b98c2d1afeb45ada124a15f3a439613_Out_0_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float);
            float _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float;
            Unity_Lerp_float(_Multiply_e6ab06e5b3dc4d72acc5f95906fa8fea_Out_2_Float, _Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float);
            float _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float;
            Unity_Lerp_float(_Remap_0c05c4433df8c8898decaf8c2ca17cb2_Out_3_Float, _Lerp_233af76a16a149b9b2d0d2021910b486_Out_3_Float, _Clamp_564cfd17bab24ecbada9ba02353cea5a_Out_3_Float, _Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float);
            float _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float;
            Unity_Clamp_float(_Lerp_b5bf5e8a15a4442faa86013a7e71d872_Out_3_Float, 0, 1, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float);
            float4 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4;
            float3 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3;
            float2 _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2;
            Unity_Combine_float(_Split_473d9bf097327483847264a7cc5c61f9_R_1_Float, _Split_473d9bf097327483847264a7cc5c61f9_G_2_Float, _Split_473d9bf097327483847264a7cc5c61f9_B_3_Float, _Clamp_04871ceebecc45cbabb61609911dc33a_Out_3_Float, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGB_5_Vector3, _Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RG_6_Vector2);
            UnityTexture2D _Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverBaseColorMap);
            float4 _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4 = _CoverTilingOffset;
            float4 _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4;
            Unity_Divide_float4(float4(1, 1, 0, 0), _Property_9bedb34aba10fa89a5f5b18919971491_Out_0_Vector4, _Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4);
            float _Property_bf361924f27f848994241bda91fc2005_Out_0_Float = _CoverTriplanarThreshold;
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4;
            float4 _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_0b7ec0ec463cd88c8269ef0d2c98eb85_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XZ_2_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_YZ_3_Vector4, _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XY_4_Vector4);
            float4 _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4 = _CoverBaseColor;
            float4 _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4;
            Unity_Multiply_float4_float4(_TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4, _Property_19547f2fe562798683b730e775cbfb39_Out_0_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4);
            float _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float;
            Unity_OneMinus_float(_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float);
            float4 _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4 = _CoverLeaksColorMultiply;
            float4 _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4;
            Unity_Multiply_float4_float4((_OneMinus_180fcf476a364671a3ce18af792f63a5_Out_1_Float.xxxx), _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4, _Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4);
            float4 _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_bc25a77c8d9548f09599accb2d4e6c38_Out_2_Vector4, float4(1, 1, 1, 1), (_SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float.xxxx), _Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4);
            float4 _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Lerp_064a03645df245e1bd232b425f9407d6_Out_3_Vector4, _Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4);
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_R_1_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[0];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_G_2_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[1];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_B_3_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[2];
            float _Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float = _Property_d423c5fc83a14091a9284a53cca55cac_Out_0_Vector4[3];
            float _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float;
            Unity_Saturate_float(_Split_e4eb10e5b1154eb69326c0086fcb61a2_A_4_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float);
            float _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_813e77d16b28456e9a205bb01b56971c_Out_1_Float, _Saturate_6f9f65258b4a492e9925f38b1c9fbc02_Out_1_Float, _Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float);
            float _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float;
            Unity_Clamp_float(_Multiply_afbd192f3cc5425a8a905ddd5c8fd0d4_Out_2_Float, 0, 1, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float);
            float4 _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4;
            Unity_Lerp_float4(_Multiply_0652b80f60f8ed84beea389318719c9a_Out_2_Vector4, _Multiply_2c82f38f10364420b50408d729ba6538_Out_2_Vector4, (_Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float.xxxx), _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4);
            float _Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[0];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[1];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[2];
            float _Split_0d31d5c6a74be68484498325bbfacd3c_A_4_Float = _Lerp_75dc54d0065e49f8a4289a5ab233ef03_Out_3_Vector4[3];
            float _Split_90237729226dca849687b6c56fde4cbe_R_1_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[0];
            float _Split_90237729226dca849687b6c56fde4cbe_G_2_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[1];
            float _Split_90237729226dca849687b6c56fde4cbe_B_3_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[2];
            float _Split_90237729226dca849687b6c56fde4cbe_A_4_Float = _TriplanarNM_d7a0c444e17f6482b4a142cfc8438793_XYZ_1_Vector4[3];
            float _Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float = _CoverSmoothnessRemapMin;
            float _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float = _CoverSmoothnessRemapMax;
            float2 _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2 = float2(_Property_007771e9e06cc78b9844d01f8129c541_Out_0_Float, _Property_ce1117115fad1e85bdf2bbb84bd185cb_Out_0_Float);
            float _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float;
            Unity_Remap_float(_Split_90237729226dca849687b6c56fde4cbe_A_4_Float, float2 (0, 1), _Vector2_6ed3170e6a5acd8a8f702cd7a2af7737_Out_0_Vector2, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float);
            float _Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float = _LeaksSmoothnessMultiply_1;
            float _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float;
            Unity_Multiply_float_float(_Property_dcd86f32c63e4ff38c889d54a75e3d8b_Out_0_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float);
            float _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float;
            Unity_Lerp_float(_Multiply_4c00161749294ee7abf092cb65459592_Out_2_Float, _Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _SampleTexture2D_7590f2ac9fda4d6f828bd32e28a6849f_R_4_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float);
            float _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float;
            Unity_Lerp_float(_Remap_690ea2a75496a283a66513f691c4f9db_Out_3_Float, _Lerp_a9643bc126984e1bae90413a6364c8e8_Out_3_Float, _Clamp_921a878e1578462395efe37e27da97d3_Out_3_Float, _Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float);
            float _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float;
            Unity_Clamp_float(_Lerp_43b71c61720b4588bbd6f0cb2ec65d59_Out_3_Float, 0, 1, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float);
            float4 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4;
            float3 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3;
            float2 _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2;
            Unity_Combine_float(_Split_0d31d5c6a74be68484498325bbfacd3c_R_1_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_G_2_Float, _Split_0d31d5c6a74be68484498325bbfacd3c_B_3_Float, _Clamp_f267dde10ce142b2886a0626cf9611ce_Out_3_Float, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGB_5_Vector3, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RG_6_Vector2);
            float _Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean = _USEDYNAMICCOVERTSTATICMASKF;
            float _Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float = _ShapeHeightMapMin;
            float _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float = _ShapeHeightMapMax;
            float2 _Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2 = float2(_Property_0855abf529c14f1e9e7873afcc6c7a26_Out_0_Float, _Property_0a442fc259a7429795dff92a1b290c77_Out_0_Float);
            float _Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float = _ShapeHeightMapOffset;
            float2 _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2;
            Unity_Add_float2(_Vector2_6d07eb9bf67c40dd9c8eea7911023e76_Out_0_Vector2, (_Property_c1c453a7f2894b028a7310c520a3bd30_Out_0_Float.xx), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2);
            float _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float;
            Unity_Remap_float(_SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, float2 (0, 1), _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float);
            float3 _Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3 = _CoverDirection;
            UnityTexture2D _Property_72c615246e955087b85288c29905f048_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_BaseNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4;
            float4 _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_72c615246e955087b85288c29905f048_Out_0_Texture2D, (_Divide_c703c79d4bf76e8c9848ea2ecd29211f_Out_2_Vector4).x, _Property_b168be530d5b4082a2816fc835b55e19_Out_0_Float, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XZ_2_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_YZ_3_Vector4, _TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XY_4_Vector4);
            float _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float = _BaseNormalScale;
            float3 _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_8dd9a87de3576e81ba1da2f170dd9cc0_XYZ_1_Vector4.xyz), _Property_7edd97bda70eb38a8c4253094700be37_Out_0_Float, _NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3);
            UnityTexture2D _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_ShapeNormalMap);
            float4 _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.tex, UnityBuildSamplerStateStruct(SamplerState_Linear_Repeat_Aniso8).samplerstate, _Property_ef7ac8b2d661d48a9009bae688f8d457_Out_0_Texture2D.GetTransformedUV(_TilingAndOffset_b9b433168ed441b6b1ba7d0e74be4af5_Out_3_Vector2) );
            _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.rgb = UnpackNormal(_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4);
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_R_4_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.r;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_G_5_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.g;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_B_6_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.b;
            float _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_A_7_Float = _SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.a;
            float _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float = _shapeNormalScale;
            float3 _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_46a5c9662672738bbf5dc8008562ce52_Out_0_Float, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3);
            float3 _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_8bafa3d69de37c818a39fccf03db9518_Out_2_Vector3, _NormalStrength_eea488fe7a9cd68b9d8207615fa95559_Out_2_Vector3, _NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3);
            UnityTexture2D _Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverNormalMap);
            Bindings_TriplanarNMn_059da9746584140498cd018db3c76047_float _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceTangent = IN.WorldSpaceTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpaceBiTangent = IN.WorldSpaceBiTangent;
            _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58.WorldSpacePosition = IN.WorldSpacePosition;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4;
            float4 _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4;
            SG_TriplanarNMn_059da9746584140498cd018db3c76047_float(_Property_1dcbde2a42b87e81bb254fd87a4816a5_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XZ_2_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_YZ_3_Vector4, _TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XY_4_Vector4);
            float _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float = _CoverNormalBlendHardness;
            float3 _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3;
            Unity_NormalStrength_float((_TriplanarNMn_9715eb52188d2a8c8e850d5b45cafa58_XYZ_1_Vector4.xyz), _Property_9176e0d3ea9ff88a9b888a200800b92d_Out_0_Float, _NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3);
            float _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float = _Shape_Normal_Cover_Scale;
            float3 _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3;
            Unity_NormalStrength_float((_SampleTexture2D_f16092ab50339b8e85429f61ced5224a_RGBA_0_Vector4.xyz), _Property_a1c57c59f71e474f854bc5d6f34bd4ba_Out_0_Float, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3);
            float3 _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3;
            Unity_NormalBlend_float(_NormalStrength_51679ed1e0a0ef8aa01b53b035a4da51_Out_2_Vector3, _NormalStrength_bc787669b38448c283f092a865b123db_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3);
            float3 _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, IN.WorldSpaceNormal, _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3);
            float _Split_e74c8f300b486e86a5700118b60b7885_R_1_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[0];
            float _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[1];
            float _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float = _Multiply_ea6008eef104198ca40a18608c76d5a4_Out_2_Vector3[2];
            float _Split_e74c8f300b486e86a5700118b60b7885_A_4_Float = 0;
            float _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float;
            Unity_Add_float(_Split_e74c8f300b486e86a5700118b60b7885_R_1_Float, _Split_e74c8f300b486e86a5700118b60b7885_G_2_Float, _Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float);
            float _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float;
            Unity_Add_float(_Add_57be4f2ffc62ef89a9b736e6f1a99790_Out_2_Float, _Split_e74c8f300b486e86a5700118b60b7885_B_3_Float, _Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float);
            float _Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float = _Cover_Amount;
            float _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float = _Cover_Amount_Grow_Speed;
            float _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float;
            Unity_Subtract_float(4, _Property_398a4ebc3d0302828e04c782fb4f49be_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float);
            float _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float;
            Unity_Divide_float(_Property_ca7cc2d889a56683904c7546a72cedbf_Out_0_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float);
            float _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float;
            Unity_Absolute_float(_Divide_58b01578ab8c8b858bb5e3a720366e16_Out_2_Float, _Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float);
            float _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float;
            Unity_Power_float(_Absolute_a4d057707c029a85947bcf9de8128ee5_Out_1_Float, _Subtract_9340fe9ac4518a8aa343888dc6143619_Out_2_Float, _Power_681b2745dbae62839624b98240ca04f7_Out_2_Float);
            float _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float;
            Unity_Clamp_float(_Power_681b2745dbae62839624b98240ca04f7_Out_2_Float, 0, 2, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float);
            float _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float;
            Unity_Multiply_float_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float);
            float _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float;
            Unity_Saturate_float(_Multiply_7632a3e8aed6d38e88c7f4b8e72f85dc_Out_2_Float, _Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float);
            float _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float;
            Unity_Clamp_float(_Add_abe82f22f31b958eaf9f12f8db5f150d_Out_2_Float, 0, 0.9999, _Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float);
            float _Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float = _Cover_Max_Angle;
            float _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float;
            Unity_Divide_float(_Property_2df9fd6ca8ecaa828f0edb7582ef5616_Out_0_Float, 45, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float);
            float _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float;
            Unity_OneMinus_float(_Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float);
            float _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float;
            Unity_Subtract_float(_Clamp_3b62dfdf4a729d8a9b33398bfdcff203_Out_3_Float, _OneMinus_2d91255cf28d138db7f5edc0eed1ea86_Out_1_Float, _Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float);
            float _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float;
            Unity_Clamp_float(_Subtract_2ae31a316a35bf8882b8de8d71b44b9f_Out_2_Float, 0, 2, _Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float);
            float _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float;
            Unity_Divide_float(1, _Divide_1e9d5df33719338ca266a822ae3e1c73_Out_2_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float);
            float _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_a3af3696fa69dc8cb04a65e84a3c6c98_Out_3_Float, _Divide_467a4be5b52daa80b2d4bf46d2f429c9_Out_2_Float, _Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float);
            float _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float;
            Unity_Absolute_float(_Multiply_749d76436ed5e58abec68ae130db866b_Out_2_Float, _Absolute_043a189b52847189ad0575955b41f403_Out_1_Float);
            float _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float = _CoverHardness;
            float _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float;
            Unity_Power_float(_Absolute_043a189b52847189ad0575955b41f403_Out_1_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float);
            float _Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float = _Cover_Min_Height;
            float _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float;
            Unity_OneMinus_float(_Property_ecc3c7fdca2e938aa029cd0ff4fb9db6_Out_0_Float, _OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float);
            float _Split_815418660959f184b10470e678ebae30_R_1_Float = IN.AbsoluteWorldSpacePosition[0];
            float _Split_815418660959f184b10470e678ebae30_G_2_Float = IN.AbsoluteWorldSpacePosition[1];
            float _Split_815418660959f184b10470e678ebae30_B_3_Float = IN.AbsoluteWorldSpacePosition[2];
            float _Split_815418660959f184b10470e678ebae30_A_4_Float = 0;
            float _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float;
            Unity_Add_float(_OneMinus_6fb68ea250dfc28b97bc87b4872d90b2_Out_1_Float, _Split_815418660959f184b10470e678ebae30_G_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float);
            float _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, 1, _Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float);
            float _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float;
            Unity_Clamp_float(_Add_9e2bffcd3cb38a83b04f8e67c5c96a06_Out_2_Float, 0, 1, _Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float);
            float _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float = _Cover_Min_Height_Blending;
            float _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float;
            Unity_Add_float(_Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Property_6ec32fc8c4434e8b84cf41dd6b52dd34_Out_0_Float, _Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float);
            float _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float;
            Unity_Divide_float(_Add_e57f70c02382b28397642f05af76cfb0_Out_2_Float, _Add_9c527d082534a687b4f0de2b26f2d04d_Out_2_Float, _Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float);
            float _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float;
            Unity_OneMinus_float(_Divide_94bc0a8d86daee888d2cd450fbf0d53e_Out_2_Float, _OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float);
            float _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float;
            Unity_Add_float(_OneMinus_5447f70dbea44185b79c1ac1bb5ea4fa_Out_1_Float, -0.5, _Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float);
            float _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float;
            Unity_Clamp_float(_Add_de674a5c5a1a348688c87f45d79cf9a1_Out_2_Float, 0, 1, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float);
            float _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float;
            Unity_Add_float(_Clamp_0d06020cc00e3887b95a3ebd8edd196f_Out_3_Float, _Clamp_3244d6500fdd2c8a92b20a9929d61642_Out_3_Float, _Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float);
            float _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float;
            Unity_Clamp_float(_Add_ea368e3c8a99368d917c930eb07b8e9f_Out_2_Float, 0, 1, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float);
            float _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float;
            Unity_Multiply_float_float(_Power_39a2971fc28ddc8e9f6d1423e692613d_Out_2_Float, _Clamp_ce483c505aaa1f83b698a43bb22bf259_Out_3_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float);
            float _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float;
            Unity_Multiply_float_float(_Saturate_0541c8e45c0d1e84acab0ae3a59218fa_Out_1_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float);
            float3 _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3;
            Unity_Lerp_float3(_NormalBlend_f41f788bcb61bb818487c7862d46b379_Out_2_Vector3, _NormalBlend_2395a7caa31a4238a263a19476a064e6_Out_2_Vector3, (_Multiply_5336a32115eb29849650688fd99ee185_Out_2_Float.xxx), _Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3);
            float3 _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3;
            {
                float3x3 tangentTransform = float3x3(IN.WorldSpaceTangent, IN.WorldSpaceBiTangent, IN.WorldSpaceNormal);
                _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3 = TransformTangentToWorldDir(_Lerp_f5ea06dcb1a8c58bac1ae497649cf333_Out_3_Vector3.xyz, tangentTransform, true).xyz;
            }
            float3 _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3;
            Unity_Multiply_float3_float3(_Property_509761afcb3aad8f9a29405c122dbf08_Out_0_Vector3, _Transform_9ae402175cd2148a9da0916d2d189ef9_Out_1_Vector3, _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3);
            float _Split_b821124768adb688becbc5d63b26adb4_R_1_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[0];
            float _Split_b821124768adb688becbc5d63b26adb4_G_2_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[1];
            float _Split_b821124768adb688becbc5d63b26adb4_B_3_Float = _Multiply_d902e15376a26b8eac35506e85f63b36_Out_2_Vector3[2];
            float _Split_b821124768adb688becbc5d63b26adb4_A_4_Float = 0;
            float _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float;
            Unity_Add_float(_Split_b821124768adb688becbc5d63b26adb4_R_1_Float, _Split_b821124768adb688becbc5d63b26adb4_G_2_Float, _Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float);
            float _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float;
            Unity_Add_float(_Add_fd43b427bfe3748cb0ced35df3b22159_Out_2_Float, _Split_b821124768adb688becbc5d63b26adb4_B_3_Float, _Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float);
            float _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float;
            Unity_Multiply_float_float(_Add_508b788633abc0829f0843d1b1f942c2_Out_2_Float, _Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float);
            float _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7340c193c2d92c81ba9dd931235ba17f_Out_3_Float, _Property_d4f4330ee4eced8d88fb074732401835_Out_0_Float, _Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float);
            float _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_90d91831d95dfc83b55e42e5746bd269_Out_2_Float, _Multiply_d1b58293be2e9982898e4a432bd61149_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float);
            float _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_ad921fb726e47688a4d134f6fb3c2273_Out_2_Float, _Multiply_b907f38702eabd80a6c67777243459de_Out_2_Float, _Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float);
            float _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float;
            Unity_Saturate_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float);
            float _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float;
            Unity_Multiply_float_float(_Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Saturate_09031c146fd64420b22b5013f49ed5a7_Out_1_Float, _Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float);
            float _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float;
            Unity_Clamp_float(_Multiply_d358bdd863964ee08a337a0cb9f05d33_Out_2_Float, 0, 1, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float);
            UnityTexture2D _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskA);
            float4 _UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4 = IN.uv0;
            float4 _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4 = SAMPLE_TEXTURE2D(_Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.tex, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.samplerstate, _Property_b987aa33bdf9a4849cc2e46d4e2b7c20_Out_0_Texture2D.GetTransformedUV((_UV_13d53a8c036ded8490c69d17b7a3bb72_Out_0_Vector4.xy)) );
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_R_4_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.r;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_G_5_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.g;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_B_6_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.b;
            float _SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float = _SampleTexture2D_b8be215db546638398ea07060feb5224_RGBA_0_Vector4.a;
            float _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float = _CoverMaskPower;
            float _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float;
            Unity_Multiply_float_float(_SampleTexture2D_b8be215db546638398ea07060feb5224_A_7_Float, _Property_b3ce556358f99f80ae9037fb175f4c5f_Out_0_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float);
            float _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Clamp_283ed1d9abfd4da4b32217a903518598_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float);
            float _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float;
            Unity_Clamp_float(_Branch_e21e05e4fd614bae9eb2ee3fffe4c95a_Out_3_Float, 0, 1, _Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float);
            float _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean = _USECoverHeightT;
            UnityTexture2D _Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D = UnityBuildTexture2DStructNoScale(_CoverMaskMap);
            Bindings_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float _TriplanarNM_9b6d5da081e434808a5840cbd915bb28;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.WorldSpaceNormal = IN.WorldSpaceNormal;
            _TriplanarNM_9b6d5da081e434808a5840cbd915bb28.AbsoluteWorldSpacePosition = IN.AbsoluteWorldSpacePosition;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4;
            float4 _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4;
            SG_TriplanarNM_bc609ed95f52591469ab35dbfe0efcea_float(_Property_a0e97293ba0dfb83a0d87d28ef311bc7_Out_0_Texture2D, (_Divide_ddaec3b56c9fc58ca3314b828c03b1c8_Out_2_Vector4).x, _Property_bf361924f27f848994241bda91fc2005_Out_0_Float, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XZ_2_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_YZ_3_Vector4, _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XY_4_Vector4);
            float _Split_b20618c84cffd183aae7f27c2d0772cb_R_1_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[0];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_G_2_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[1];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[2];
            float _Split_b20618c84cffd183aae7f27c2d0772cb_A_4_Float = _TriplanarNM_9b6d5da081e434808a5840cbd915bb28_XYZ_1_Vector4[3];
            float _Property_987a8037965fff81a4930627358fc6e3_Out_0_Float = _CoverHeightMapMin;
            float _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float = _CoverHeightMapMax;
            float2 _Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2 = float2(_Property_987a8037965fff81a4930627358fc6e3_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float);
            float _Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float = _CoverHeightMapOffset;
            float2 _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2;
            Unity_Add_float2(_Vector2_d18b9686bb8af48c85d99d319830c000_Out_0_Vector2, (_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float.xx), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2);
            float _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float;
            Unity_Remap_float(_Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, float2 (0, 1), _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float);
            float _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float;
            Unity_Add_float(_Property_856fd4da5f3d1b8c9bdd6966daada2b2_Out_0_Float, _Property_89aeacdce0000086a98e45df79358a56_Out_0_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float);
            float _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float;
            Unity_Branch_float(_Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Remap_f85aa52613b0108d876fab409ea80b8c_Out_3_Float, _Add_4bc8eea63072a88682ecd8ffdeb9f28a_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float);
            float _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_81bdd2734ef6c68fbc23ffe7409191b9_Out_2_Float, _Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float);
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_R_1_Float = IN.VertexColor[0];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_G_2_Float = IN.VertexColor[1];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float = IN.VertexColor[2];
            float _Split_d1d01683f76b4a9d8bcf0404d031d965_A_4_Float = IN.VertexColor[3];
            float _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float = _VertexColorBBlendStrenght;
            float _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            Bindings_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572;
            float _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float;
            SG_ShapeHeighblendCoverSlope_402e05c6ee95e8d4e8b9cc10847ff3d3_float(_Split_d1d01683f76b4a9d8bcf0404d031d965_B_3_Float, _Property_dea73697d90d4578ac3db15dac9737c5_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_23eca7c1892542418b9b1e33f0143542_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_a47aad95610c42f9bfcec7509240603a_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float);
            float _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float;
            Unity_Multiply_float_float(_Multiply_65b9c8cf3a459284a298aa84443140a2_Out_2_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float);
            float _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float;
            Unity_Saturate_float(_Multiply_0fbdb4993ee444759f0b1fb0bbd49f46_Out_2_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float);
            float _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_f14eab8cf97f4e1bba7d34cb5e48a079_Out_3_Float, _Saturate_a340e45e54317a81ae145a84c72daa75_Out_1_Float, _Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float);
            float _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float;
            Unity_Clamp_float(_Multiply_d8ca79d07c3bbe85b09000ed0e769324_Out_2_Float, 0, 1, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float);
            float _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float;
            Unity_Branch_float(_Property_27d72799226040bd97356342aa2020d5_Out_0_Boolean, _Remap_2e54fe0c9aff4754bc4ca0fad2e2eb49_Out_3_Float, _Multiply_ea35dd8ed2523f8b9a4c52fc52ecff0e_Out_2_Float, _Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float);
            float _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float;
            Unity_Clamp_float(_Branch_b180202dcda24369b62f8a8ad7fae01f_Out_3_Float, 0, 1, _Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float);
            float _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float;
            Unity_Multiply_float_float(_Branch_f4dc5bca7e33443db0a4afcb001b4547_Out_3_Float, _ShapeHeighblendCoverSlope_5dc60a9e612d4c51b533fab0d7d86572_OutVector1_1_Float, _Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float);
            float _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float;
            Unity_Saturate_float(_Multiply_b7ee2aea342147718f50977ea1da8213_Out_2_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float);
            float _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float;
            Unity_Multiply_float_float(_Clamp_7c0c867aaa1f5b8683768528b130a408_Out_3_Float, _Saturate_d37e892dc728415cbf82c9cafb9b4b8e_Out_1_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float);
            float _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float;
            Unity_Branch_float(_Property_4e2c6086c381838aa9cd7f681418eff8_Out_0_Boolean, _Clamp_3b9ac563e1104cbb8c78b5c04608829c_Out_3_Float, _Multiply_10e18dd3a19147f68f5fce2c08239654_Out_2_Float, _Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float);
            float4 _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4;
            Unity_Lerp_float4(_Combine_3fd4ebb76276a586a98cd7ec6a0634c2_RGBA_4_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_Branch_a3cd725ae4257683a36e55a112aa9583_Out_3_Float.xxxx), _Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4);
            float _Split_21e594714fe04537bf95c9e3c3e4428c_R_1_Float = IN.VertexColor[0];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float = IN.VertexColor[1];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_B_3_Float = IN.VertexColor[2];
            float _Split_21e594714fe04537bf95c9e3c3e4428c_A_4_Float = IN.VertexColor[3];
            float _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float = _VertexColorGBlendStrenght;
            float _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean = _Use_ShapeHeightBT_Static_MaskF;
            float _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean = _USECoverHeightT;
            Bindings_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d;
            float _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float;
            SG_ShapeHeighblend_ed2a9d9dc811e49479d1d520b068f436_float(_Split_21e594714fe04537bf95c9e3c3e4428c_G_2_Float, _Property_df380f7c5a1442c59f9d0080827e5965_Out_0_Float, _SampleTexture2D_4cbcdc8fa34a788b8ac71314ed311ea7_B_6_Float, _Property_eb939369356a448eb4a1200eddc18b4c_Out_0_Boolean, _Split_b20618c84cffd183aae7f27c2d0772cb_B_3_Float, _Property_8ef6b57b98b74e12a7ca8e76df436ae7_Out_0_Boolean, _Add_eb451de9c68540728a80136244fa61a5_Out_2_Vector2, _Add_935266d0fc26dc87a5909ea1bd8aa423_Out_2_Vector2, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d, _ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float);
            float4 _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_7b425abcb4dfd0859d63f71a714fbb7d_Out_3_Vector4, _Combine_e08fc3fe64b11f8b92d3a5452fa1bc7e_RGBA_4_Vector4, (_ShapeHeighblend_5d36a2bbc2c543dab7a9ba4a31ebd28d_OutVector1_1_Float.xxxx), _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4);
            float4 _Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4 = _WetColor;
            float4 _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4;
            Unity_Multiply_float4_float4(_Property_65142be0135b4ddcb5d93046d6df1f12_Out_0_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4);
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[0];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[1];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[2];
            float _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_A_4_Float = _Multiply_16a3867402814e3e811bca0f5acc302e_Out_2_Vector4[3];
            float _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float = _WetSmoothness;
            float4 _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4 = float4(_Split_bada81f9a61c4a3ea285dfcc2fd42fbb_R_1_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_G_2_Float, _Split_bada81f9a61c4a3ea285dfcc2fd42fbb_B_3_Float, _Property_e48a97a1c7d84abaac7432a923e6bb7c_Out_0_Float);
            float _Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean = _Dynamic_Flow;
            float _Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float = IN.VertexColor[0];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_G_2_Float = IN.VertexColor[1];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_B_3_Float = IN.VertexColor[2];
            float _Split_2d3577de3d626c8683c82ad2f5337a65_A_4_Float = IN.VertexColor[3];
            float _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float;
            Unity_OneMinus_float(_Split_2d3577de3d626c8683c82ad2f5337a65_R_1_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float);
            float _Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float = _Dynamic_Reaction_Offset;
            float _Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float = _Dynamic_Start_Position_Offset;
            float _TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float;
            Time_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float);
            float _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float = _Dynamic_Shape_Speed;
            float _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float;
            Unity_Multiply_float_float(_TimeCustomFunction_15395172775c485a896d4ae5991231b1_Out_0_Float, _Property_7b32a2837591443f971e622ff5b4e313_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float);
            float _Add_6d46d247bde849839035d4123a598131_Out_2_Float;
            Unity_Add_float(_Property_9ac5c2937e6549f1a4331252d9078443_Out_0_Float, _Multiply_3f83430e091544d1aa8ead3299b0f00e_Out_2_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float);
            float _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float;
            Unity_Add_float(_Property_772a1f0d6e19448f91f2705599aae4e5_Out_0_Float, _Add_6d46d247bde849839035d4123a598131_Out_2_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float);
            float _Property_f54645916df346fd95d2d7f529255445_Out_0_Float = _Dynamic_Shape_V_Curve_Power;
            float _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float;
            Unity_Add_float(_Property_f54645916df346fd95d2d7f529255445_Out_0_Float, _Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float);
            float4 _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4 = IN.uv2;
            float _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[0];
            float _Split_ff478e3a414149d1899086bef1db57c2_G_2_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[1];
            float _Split_ff478e3a414149d1899086bef1db57c2_B_3_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[2];
            float _Split_ff478e3a414149d1899086bef1db57c2_A_4_Float = _UV_6ee63e6bfab04c6e94a883856ab67212_Out_0_Vector4[3];
            float _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float;
            Unity_Smoothstep_float(_Add_81a6690036d14d87b167a7d659be6774_Out_2_Float, _Add_51fa5e200d5f47deab34a6ba727cfae2_Out_2_Float, _Split_ff478e3a414149d1899086bef1db57c2_R_1_Float, _Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float);
            float _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float;
            Unity_OneMinus_float(_Smoothstep_512fbdca2d404f65856450f9f49f8bcc_Out_3_Float, _OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float);
            float _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float;
            Unity_Clamp_float(_OneMinus_f68da018f5104a3dbb9cd3cc9cf8d608_Out_1_Float, 0, 1, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float);
            float _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float;
            Unity_Multiply_float_float(_OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Clamp_97b52eee21064c07871f05261491917d_Out_3_Float, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float);
            float _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float;
            Unity_Branch_float(_Property_943f28eda9944cfaa89e16674fcabcfe_Out_0_Boolean, _Multiply_1f6aebee897747529a7fd2d9bcffaf5b_Out_2_Float, _OneMinus_cbb4fdd4c780ac8daac94d1520a49c56_Out_1_Float, _Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float);
            float4 _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4;
            Unity_Lerp_float4(_Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Vector4_d80d3f8fbad64d44aa6785733dfbdd9f_Out_0_Vector4, (_Branch_bbc759c58faa4f4f8a521e839b3c2d4a_Out_3_Float.xxxx), _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4);
            float4 _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4;
            Unity_Branch_float4(_Property_93d37bb33d9f4b7795fc4d0dd365d00d_Out_0_Boolean, _Lerp_9897bc9bef9547588129a5a0d22e78b9_Out_3_Vector4, _Lerp_50ebf0150173df88a8448396922a8f74_Out_3_Vector4, _Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4);
            surface.BaseColor = (_Branch_b575ebb5a8e4407a97bbb714bcb5f7d8_Out_3_Vector4.xyz);
            return surface;
        }
        
        // --------------------------------------------------
        // Build Graph Inputs
        #ifdef HAVE_VFX_MODIFICATION
        #define VFX_SRP_ATTRIBUTES Attributes
        #define VFX_SRP_VARYINGS Varyings
        #define VFX_SRP_SURFACE_INPUTS SurfaceDescriptionInputs
        #endif
        VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
        {
            VertexDescriptionInputs output;
            ZERO_INITIALIZE(VertexDescriptionInputs, output);
        
            output.ObjectSpaceNormal =                          input.normalOS;
            output.ObjectSpaceTangent =                         input.tangentOS.xyz;
            output.ObjectSpacePosition =                        input.positionOS;
        
            return output;
        }
        SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
        {
            SurfaceDescriptionInputs output;
            ZERO_INITIALIZE(SurfaceDescriptionInputs, output);
        
        #ifdef HAVE_VFX_MODIFICATION
        #if VFX_USE_GRAPH_VALUES
            uint instanceActiveIndex = asuint(UNITY_ACCESS_INSTANCED_PROP(PerInstance, _InstanceActiveIndex));
            /* WARNING: $splice Could not find named fragment 'VFXLoadGraphValues' */
        #endif
            /* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */
        
        #endif
        
            
        
            // must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
            float3 unnormalizedNormalWS = input.normalWS;
            const float renormFactor = 1.0 / length(unnormalizedNormalWS);
        
            // use bitangent on the fly like in hdrp
            // IMPORTANT! If we ever support Flip on double sided materials ensure bitangent and tangent are NOT flipped.
            float crossSign = (input.tangentWS.w > 0.0 ? 1.0 : -1.0)* GetOddNegativeScale();
            float3 bitang = crossSign * cross(input.normalWS.xyz, input.tangentWS.xyz);
        
            output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
        
            // to pr               eserve mikktspace compliance we use same scale renormFactor as was used on the normal.
            // This                is explained in section 2.2 in "surface gradient based bump mapping framework"
            output.WorldSpaceTangent = renormFactor * input.tangentWS.xyz;
            output.WorldSpaceBiTangent = renormFactor * bitang;
        
            output.WorldSpacePosition = input.positionWS;
            output.AbsoluteWorldSpacePosition = GetAbsolutePositionWS(input.positionWS);
        
            #if UNITY_UV_STARTS_AT_TOP
            #else
            #endif
        
        
            output.uv0 = input.texCoord0;
            output.uv2 = input.texCoord2;
            output.VertexColor = input.color;
        #if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
        #else
        #define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        #endif
        #undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
        
                return output;
        }
        
        // --------------------------------------------------
        // Main
        
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
        #include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"
        
        // --------------------------------------------------
        // Visual Effect Vertex Invocations
        #ifdef HAVE_VFX_MODIFICATION
        #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
        #endif
        
        ENDHLSL
        }
    }
    CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
    CustomEditorForRenderPipeline "UnityEditor.ShaderGraphLitGUI" "UnityEngine.Rendering.Universal.UniversalRenderPipelineAsset"
    FallBack "Hidden/Shader Graph/FallbackError"
}
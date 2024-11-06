using System;
using Unity.Mathematics;
using UnityEngine;

namespace NatureManufacture.RAM
{
    public class SeaPhysicsCalculations
    {
        private const float UnityPI = 3.14159265359f;
        private float4 _gerstnerDirection1;
        private float4 _gerstnerDirection4;
        private float4 _gerstnerDirection5;
        private float4 _gerstner1;
        private float4 _gerstner2;
        private float _globalTiling;
        private float4 _macroWaveTiling;
        private float _macroWaveTessScale;
        private float4 _polarWaveDepthStartXFlattenPointY;
        private float _polarWaveSilentAreaAngleHardness;
        private float _polarWaveSilentAreaAngle;
        private float _polarWaveSwashSize;
        private float4 _seaFoamSlopeInfluence;
        private float4 _seaWaveDepthFlattenStartXEndY;
        private float _seaWaveNoiseMultiply;
        private float _seaWaveNoisePower;
        private float4 _seaWaveNoiseTiling;
        private float _seaWaveSwashSize;
        private float _seaWavesChaos;
        private float4 _slowWaterMixSpeed;
        private float _slowWaterTessScale;
        private float4 _slowWaterTiling;
        private float4 _slowWaterSpeed;
        private float _slowNormalScale;
        private float4 _smallWaveNoiseTiling;
        private float _smallWaveNoiseMultiply;
        private float _smallWaveNoisePower;
        private float _smallWaveShoreHeightMultiply;
        private float4 _smallWaveShoreDepthStartXFlattenPointY;
        private float _smallWaveSilentAreaAngleHardness;
        private float _smallWaveSilentAreaAngle;
        private float _smallWaveSwashSize;
        private float _smallWavesChaos;
        private float _timeOffset;
        private float _waterFlowUVRefresSpeed;
        private bool _uvvdirection1Udirection0On = false;
        private Texture2D _slowWaterNormal;
        private Texture2D _slowWaterTesselation;
        private Texture2D _wavesNoise;

        private float time = 0;
        private float oldTime;


        public void GetShaderTime()
        {
            time = oldTime;
            //Debug.Log($"time: {time} Time.timeSinceLevelLoad: {Time.timeSinceLevelLoad} shader time: {Shader.GetGlobalVector("_Time").y}");
            oldTime = Time.timeSinceLevelLoad;
            // time = 0;
        }

        public void GetMaterialData(Material seaMaterial)
        {
            _gerstnerDirection1 = seaMaterial.GetVector("_GerstnerDirection_1");
            _gerstnerDirection4 = seaMaterial.GetVector("_GerstnerDirection_4");
            _gerstnerDirection5 = seaMaterial.GetVector("_GerstnerDirection_5");
            _gerstner1 = seaMaterial.GetVector("_Gerstner_1");
            _gerstner2 = seaMaterial.GetVector("_Gerstner_2");
            _globalTiling = seaMaterial.GetFloat("_GlobalTiling");
            _macroWaveTiling = seaMaterial.GetVector("_MacroWaveTiling");
            _macroWaveTessScale = seaMaterial.GetFloat("MacroWaveTessScale");
            _polarWaveDepthStartXFlattenPointY = seaMaterial.GetVector("_Polar_Wave_Depth_Start_X_Flatten_Point_Y");
            _polarWaveSilentAreaAngleHardness = seaMaterial.GetFloat("_Polar_Wave_Silent_Area_Angle_Hardness");
            _polarWaveSilentAreaAngle = seaMaterial.GetFloat("_Polar_Wave_Silent_Area_Angle");
            _polarWaveSwashSize = seaMaterial.GetFloat("_Polar_Wave_Swash_Size");
            _seaFoamSlopeInfluence = seaMaterial.GetVector("_Sea_Foam_Slope_Influence");
            _seaWaveDepthFlattenStartXEndY = seaMaterial.GetVector("_Sea_Wave_Depth_Flatten_Start_X_End_Y");
            _seaWaveNoiseMultiply = seaMaterial.GetFloat("_Sea_Wave_Noise_Multiply");
            _seaWaveNoisePower = seaMaterial.GetFloat("_Sea_Wave_Noise_Power");
            _seaWaveNoiseTiling = seaMaterial.GetVector("_Sea_Wave_Noise_Tiling");
            _seaWaveSwashSize = seaMaterial.GetFloat("_Sea_Wave_Swash_Size");
            _seaWavesChaos = seaMaterial.GetFloat("_Sea_Waves_Chaos");
            _slowWaterMixSpeed = seaMaterial.GetVector("_SlowWaterMixSpeed");
            _slowWaterTessScale = seaMaterial.GetFloat("_SlowWaterTessScale");
            _slowWaterTiling = seaMaterial.GetVector("_SlowWaterTiling");
            _slowWaterSpeed = seaMaterial.GetVector("_SlowWaterSpeed");
            _slowNormalScale = seaMaterial.GetFloat("_SlowNormalScale");
            _smallWaveNoiseTiling = seaMaterial.GetVector("_Small_Wave_Noise_Tiling");
            _smallWaveNoiseMultiply = seaMaterial.GetFloat("_Small_Wave_Noise_Multiply");
            _smallWaveNoisePower = seaMaterial.GetFloat("_Small_Wave_Noise_Power");
            _smallWaveShoreHeightMultiply = seaMaterial.GetFloat("_Small_Wave_Shore_Height_Multiply");
            _smallWaveShoreDepthStartXFlattenPointY = seaMaterial.GetVector("_Small_Wave_Shore_Depth_Start_X_Flatten_Point_Y");
            _smallWaveSilentAreaAngleHardness = seaMaterial.GetFloat("_Small_Wave_Silent_Area_Angle_Hardness");
            _smallWaveSilentAreaAngle = seaMaterial.GetFloat("_Small_Wave_Silent_Area_Angle");
            _smallWaveSwashSize = seaMaterial.GetFloat("_Small_Wave_Swash_Size");
            _smallWavesChaos = seaMaterial.GetFloat("_Small_Waves_Chaos");
            _timeOffset = seaMaterial.GetFloat("_Time_Offset");
            _waterFlowUVRefresSpeed = seaMaterial.GetFloat("_WaterFlowUVRefresSpeed");
            _uvvdirection1Udirection0On = seaMaterial.GetFloat("_UVVDirection1UDirection0") == 1;

            _slowWaterNormal = (Texture2D)seaMaterial.GetTexture("_SlowWaterNormal");
            _slowWaterTesselation = (Texture2D)seaMaterial.GetTexture("_SlowWaterTesselation");
            _wavesNoise = (Texture2D)seaMaterial.GetTexture("_Waves_Noise");
        }

        private static float3 UnpackScaleNormal(float4 packedNormal, float bumpScale)
        {
            packedNormal.x *= packedNormal.w;

            var unpackedNormal = new float3(0, 0, 0)
            {
                xy = (packedNormal.xy * 2 - 1)
            };

            unpackedNormal.xy *= bumpScale;

            unpackedNormal.z = math.sqrt(1.0f - math.saturate(math.dot(unpackedNormal.xy, unpackedNormal.xy)));
            return unpackedNormal;
        }

        private static float4 SAMPLE_TEXTURE2D_LOD(Texture2D texture, float2 uv)
        {
            Color color = texture.GetPixelBilinear(uv.x, uv.y);

            return new float4(color.r, color.g, color.b, color.a);
        }

        public SeaPhysics.PositionNormal VertexDataFuncV2Normal(float3 vertex, float4 tangent, float3 normal, float4 texcoord, float4 texcoord3, float3 aseWorldPos, float3 aseWorldNormal)
        {
            var appendResult861 = new float2(texcoord3.x, texcoord3.y);

            float cos864 = math.cos((_gerstnerDirection5.z * _seaWavesChaos + 180.0f) * 0.01745f);
            float sin864 = math.sin((_gerstnerDirection5.z * _seaWavesChaos + 180.0f) * 0.01745f);
            float2 rotator864 = math.mul(appendResult861, new float2x2(cos864, -sin864, sin864, cos864));

            float2 ifLocalVar77G51 = math.length(rotator864) == 0.0f ? new float2(0.001f, 0) : rotator864;


            float2 normalizeResult79G51 = math.normalize(ifLocalVar77G51);

            float tempOutput8160 = (texcoord3.w - _seaWaveDepthFlattenStartXEndY.y) /
                                   (_seaWaveDepthFlattenStartXEndY.x - _seaWaveDepthFlattenStartXEndY.y);
            float clampResult823 = math.clamp(tempOutput8160, 0.0f, 1.0f);
            float clampResult833 =
                math.clamp(
                    _gerstnerDirection5.y + (clampResult823 - 0.0f) * (math.max(clampResult823 * _gerstnerDirection5.x, _gerstnerDirection5.y) - _gerstnerDirection5.y) /
                    (1.0f - 0.0f), 0.0f, 1.0f);


            float clampResult44G155 = math.clamp(math.abs(aseWorldNormal.y), 0.0f, 1.0f);
            float2 tempOutput8010 = _seaWaveNoiseTiling.xy / new float2(1, 1);
            float2 clampResult800 = math.clamp(tempOutput8010, new float2(0.001f, 0.001f), new float2(500, 500));
            float2 tempOutput530G155 = ((1.0f - clampResult44G155) * new float2(1, 1) + new float2(1, 1) / clampResult800 * new float2(1.8f, 1.8f)) * tempOutput8010 * texcoord3.xy;
            var appendResult57G155 = new float2(tempOutput530G155.y, tempOutput530G155.x);

            float2 staticSwitch59G155 = _uvvdirection1Udirection0On ? tempOutput530G155 : appendResult57G155;

            float tempOutput680G155 = time * 0.07f;
            float tempOutput710G155 = math.frac(tempOutput680G155);
            float2 tempOutput600G155 = staticSwitch59G155 * tempOutput710G155;
            float globalTiling70 = _globalTiling;
            float2 tempOutput830G155 = 1.0f / globalTiling70 * (tempOutput8010 * texcoord.xy);
            float2 tempOutput800G155 = staticSwitch59G155 * math.frac(tempOutput680G155 + -0.5f);
            float clampResult90G155 = math.clamp(math.abs(math.sin(UnityPI * 1.5f + tempOutput710G155 * UnityPI)), 0.0f, 1.0f);
            float lerpResult791 = math.lerp(SAMPLE_TEXTURE2D_LOD(_wavesNoise, tempOutput600G155 + tempOutput830G155).x, SAMPLE_TEXTURE2D_LOD(_wavesNoise, tempOutput830G155 + tempOutput800G155).x,
                clampResult90G155);

            float clampResult807 = math.clamp(math.pow(math.abs(lerpResult791), _seaWaveNoisePower) * _seaWaveNoiseMultiply, 0.0f, 1.0f);
            float clampResult827 = math.clamp(1.0f - (0.05f + (clampResult807 - 0.0f) * (0.97f - 0.05f) / (1.0f - 0.0f)), 0.0f, 1.0f);
            float tempOutput8320 = clampResult833 * clampResult827;
            float2 polarWaveDepthStartXFlattenPointY732 = _polarWaveDepthStartXFlattenPointY.xy;
            float clampResult884 = math.clamp(texcoord3.w - polarWaveDepthStartXFlattenPointY732.y, 0.0f, 1.0f);
            float clampResult886 = math.clamp(1.0f + (texcoord3.w - polarWaveDepthStartXFlattenPointY732.y) * (0.0f - 1.0f) / (polarWaveDepthStartXFlattenPointY732.x - polarWaveDepthStartXFlattenPointY732.y), 0.0f,
                1.0f);
            float clampResult890 = math.clamp(_gerstnerDirection1.y + (clampResult884 - 0.0f) * (_gerstnerDirection1.x * clampResult886 - _gerstnerDirection1.y) / (1.0f - 0.0f), 0.0f, 1.0f);
            var appendResult1009 = new float2(texcoord3.x, texcoord3.y);
            float2 normalizeResult1014 = math.normalize(appendResult1009 * new float2(1, -1));
            var appendResult1011 = new float2(texcoord.z, texcoord.w);
            float2 normalizeResult1015 = math.normalize(appendResult1011);
            float dotResult1016 = math.dot(normalizeResult1014, normalizeResult1015);
            float clampResult1022 = math.clamp((dotResult1016 - -1.0f) / (1.0f - -1.0f) + (_polarWaveSilentAreaAngle + -180.0f) / 180.0f, 0.0f, 1.0f);
            float clampResult1024 = math.clamp(1.0f - clampResult1022, 0.0f, 1.0f);
            float clampResult1028 = math.clamp(math.pow(math.abs(clampResult1024), _polarWaveSilentAreaAngleHardness), 0.0f, 1.0f);
            float clampResult44G156 = math.clamp(math.abs(aseWorldNormal.y), 0.0f, 1.0f);
            float2 tempOutput7790 = _smallWaveNoiseTiling.xy / new float2(1, 1);
            float2 clampResult780 = math.clamp(tempOutput7790, new float2(0.001f, 0.001f), new float2(500, 500));
            float2 tempOutput530G156 = ((1.0f - clampResult44G156) * new float2(1, 1) + new float2(1, 1) / clampResult780 * new float2(2, 2)) * tempOutput7790 * texcoord3.xy;
            var appendResult57G156 = new float2(tempOutput530G156.y, tempOutput530G156.x);


            float2 staticSwitch59G156 = _uvvdirection1Udirection0On ? tempOutput530G156 : appendResult57G156;

            float tempOutput680G156 = time * 0.05f;
            float tempOutput710G156 = math.frac(tempOutput680G156);
            float2 tempOutput600G156 = staticSwitch59G156 * tempOutput710G156;
            float2 tempOutput830G156 = 1.0f / globalTiling70 * (tempOutput7790 * texcoord.xy);
            float2 tempOutput800G156 = staticSwitch59G156 * math.frac(tempOutput680G156 + -0.5f);
            float clampResult90G156 = math.clamp(math.abs(math.sin(UnityPI * 1.5f + tempOutput710G156 * UnityPI)), 0.0f, 1.0f);
            float lerpResult772 = math.lerp(SAMPLE_TEXTURE2D_LOD(_wavesNoise, tempOutput600G156 + tempOutput830G156).x, SAMPLE_TEXTURE2D_LOD(_wavesNoise, tempOutput830G156 + tempOutput800G156).x,
                clampResult90G156);

            float clampResult787 = math.clamp(math.pow(math.abs(lerpResult772), _smallWaveNoisePower) * _smallWaveNoiseMultiply, 0.0f, 1.0f);
            float tempOutput7880 = (clampResult787 - 0.0f) * (0.97f - 0.0f) / (1.0f - 0.0f);
            float clampResult897 = math.clamp(1.0f - tempOutput7880, 0.0f, 1.0f);
            float tempOutput8950 = clampResult890 * (clampResult1028 * 1.0f) * clampResult897;
            float clampResult824 =
                math.clamp(
                    _gerstnerDirection4.y + (clampResult823 - 0.0f) * (math.max(clampResult823 * _gerstnerDirection4.x, _gerstnerDirection4.y) - _gerstnerDirection4.y) /
                    (1.0f - 0.0f), 0.0f, 1.0f);
            float tempOutput8250 = clampResult824 * clampResult827;
            float2 smallWaveShoreDepthStartXFlattenPointY733 = _smallWaveShoreDepthStartXFlattenPointY.xy;
            float clampResult968 = math.clamp(texcoord3.w - smallWaveShoreDepthStartXFlattenPointY733.y, 0.0f, 1.0f);
            float clampResult950 = math.clamp(
                1.0f + (texcoord3.w - smallWaveShoreDepthStartXFlattenPointY733.y) * (0.0f - 1.0f) / (smallWaveShoreDepthStartXFlattenPointY733.x - smallWaveShoreDepthStartXFlattenPointY733.y),
                0.0f, 1.0f);
            float clampResult983 =
                math.clamp(
                    _gerstner1.y + (clampResult968 - 0.0f) * (_gerstner1.x + _smallWaveShoreHeightMultiply * _gerstner1.x * clampResult950 - _gerstner1.y) /
                    (1.0f - 0.0f), 0.0f, 1.0f);
            float clampResult985 = math.clamp(1.0f - tempOutput7880, 0.0f, 1.0f);
            float clampResult1007 = math.clamp(tempOutput8160, 0.0f, 1.0f);
            float tempOutput10080 = 1.0f - clampResult1007;
            float tempOutput9330 = _gerstner1.z * _smallWavesChaos;
            float cos1034 = math.cos(tempOutput9330 * 0.01745f);
            float sin1034 = math.sin(tempOutput9330 * 0.01745f);
            float2 rotator1034 = math.mul(normalizeResult1014, new float2x2(cos1034, -sin1034, sin1034, cos1034));
            float2 normalizeResult1038 = math.normalize(rotator1034);
            float dotResult1040 = math.dot(normalizeResult1038, normalizeResult1015);
            float tempOutput10450 = (_smallWaveSilentAreaAngle + -180.0f) / 180.0f;
            float clampResult1051 = math.clamp(tempOutput10080 * ((dotResult1040 - -1.0f) / (1.0f - -1.0f) + tempOutput10450), 0.0f, 1.0f);
            float clampResult1055 = math.clamp(1.0f - clampResult1051, 0.0f, 1.0f);
            float clampResult1062 = math.clamp(math.pow(math.abs(clampResult1055), _smallWaveSilentAreaAngleHardness), 0.0f, 1.0f);
            float tempOutput9930 = clampResult983 * clampResult985 * clampResult1062;
            float clampResult984 =
                math.clamp(
                    _gerstner2.y + (clampResult968 - 0.0f) * (_smallWaveShoreHeightMultiply * _gerstner2.x * clampResult950 + _gerstner2.x - _gerstner2.y) /
                    (1.0f - 0.0f), 0.0f, 1.0f);
            float tempOutput9290 = _gerstner2.z * _smallWavesChaos;
            float cos1036 = math.cos(tempOutput9290 * 0.01745f);
            float sin1036 = math.sin(tempOutput9290 * 0.01745f);
            float2 rotator1036 = math.mul(normalizeResult1014, new float2x2(cos1036, -sin1036, sin1036, cos1036));
            float2 normalizeResult1039 = math.normalize(rotator1036);
            float dotResult1041 = math.dot(normalizeResult1039, normalizeResult1015);
            float clampResult1052 = math.clamp(tempOutput10080 * ((dotResult1041 - -1.0f) / (1.0f - -1.0f) + tempOutput10450), 0.0f, 1.0f);
            float clampResult1056 = math.clamp(1.0f - clampResult1052, 0.0f, 1.0f);
            float clampResult1063 = math.clamp(math.pow(math.abs(clampResult1056), _smallWaveSilentAreaAngleHardness), 0.0f, 1.0f);
            float tempOutput9940 = clampResult984 * clampResult985 * clampResult1063;
            float clampResult894 = math.clamp(tempOutput8950 + (tempOutput8250 + tempOutput8320 + (tempOutput9930 + tempOutput9940)), 0.01f, 999.0f);
            float clampResult858 = math.clamp(tempOutput8320, 0.0f, tempOutput8320 / clampResult894);
            float clampResult859 = math.clamp(clampResult858, 0.01f, 1.0f);
            float tempOutput610G51 = UnityPI * 2.0f / _gerstnerDirection5.w;
            float tempOutput820G51 = clampResult859 / tempOutput610G51;

            var appendResult71G51 = new float3(aseWorldPos.x, aseWorldPos.z, 0.0f);
            float dotResult72G51 = math.dot(new float3(normalizeResult79G51, 0.0f), appendResult71G51);
            float timeOffset843 = _timeOffset;
            float tempOutput8410 = time + timeOffset843;
            float tempOutput810G51 = tempOutput610G51 * (dotResult72G51 - math.sqrt(9.8f / tempOutput610G51) * tempOutput8410);
            float tempOutput850G51 = math.cos(tempOutput810G51);
            float tempOutput860G51 = math.sin(tempOutput810G51);
            float clampResult856 = math.clamp(tempOutput8320, 0.0f, 1.0f);
            float tempOutput8490 = texcoord3.z * _seaWaveSwashSize;
            float tempOutput890G51 = clampResult856 * tempOutput8490;
            float tempOutput900G51 = tempOutput820G51 * tempOutput850G51 + tempOutput860G51 * tempOutput890G51;
            var appendResult94G51 = new float3(normalizeResult79G51.x * tempOutput900G51, tempOutput820G51 * tempOutput860G51, normalizeResult79G51.y * tempOutput900G51);
            float cos862 = math.cos((_gerstnerDirection4.z * _seaWavesChaos + 180.0f) * 0.01745f);
            float sin862 = math.sin((_gerstnerDirection4.z * _seaWavesChaos + 180.0f) * 0.01745f);
            float2 rotator862 = math.mul(appendResult861, new float2x2(cos862, -sin862, sin862, cos862));
            float2 ifLocalVar77G69 = math.length(rotator862) == 0.0f ? new float2(0.001f, 0) : rotator862;

            float2 normalizeResult79G69 = math.normalize(ifLocalVar77G69);
            float clampResult845 = math.clamp(tempOutput8250, 0.0f, tempOutput8250 / clampResult894);
            float clampResult847 = math.clamp(clampResult845, 0.01f, 1.0f);
            float tempOutput610G69 = UnityPI * 2.0f / _gerstnerDirection4.w;
            float tempOutput820G69 = clampResult847 / tempOutput610G69;
            var appendResult71G69 = new float3(aseWorldPos.x, aseWorldPos.z, 0.0f);
            float dotResult72G69 = math.dot(new float3(normalizeResult79G69, 0.0f), appendResult71G69);
            float tempOutput810G69 = tempOutput610G69 * (dotResult72G69 - math.sqrt(9.8f / tempOutput610G69) * tempOutput8410);
            float tempOutput850G69 = math.cos(tempOutput810G69);
            float tempOutput860G69 = math.sin(tempOutput810G69);
            float clampResult852 = math.clamp(tempOutput8250, 0.0f, 1.0f);
            float tempOutput890G69 = clampResult852 * tempOutput8490;
            float tempOutput900G69 = tempOutput820G69 * tempOutput850G69 + tempOutput860G69 * tempOutput890G69;
            var appendResult94G69 = new float3(normalizeResult79G69.x * tempOutput900G69, tempOutput820G69 * tempOutput860G69, normalizeResult79G69.y * tempOutput900G69);
            var appendResult908 = new float2(texcoord.z, texcoord.w);
            float2 ifLocalVar77G70 = math.length(appendResult908) == 0.0f ? new float2(0.001f, 0) : appendResult908;
            float2 normalizeResult79G70 = math.normalize(ifLocalVar77G70);
            float clampResult899 = math.clamp(tempOutput8950, 0.0f, tempOutput8950 / clampResult894);
            float clampResult901 = math.clamp(clampResult899, 0.01f, 1.0f);
            float tempOutput610G70 = UnityPI * 2.0f / _gerstnerDirection1.w;
            float tempOutput820G70 = clampResult901 / tempOutput610G70;
            float tempOutput1260G70 = math.length(ifLocalVar77G70);
            float tempOutput810G70 = tempOutput610G70 * (-1.0f * tempOutput1260G70 - math.sqrt(9.8f / tempOutput610G70) * (time + timeOffset843));
            float tempOutput850G70 = math.cos(tempOutput810G70);
            float tempOutput860G70 = math.sin(tempOutput810G70);
            float tempOutput9090 = clampResult897 * (_polarWaveSwashSize * texcoord3.z * clampResult1028);
            float clampResult910 = math.clamp(tempOutput9090, 0.0f, tempOutput9090 / clampResult894);
            float clampResult913 = math.clamp(1.0f + (texcoord3.w - polarWaveDepthStartXFlattenPointY732.y) * (0.0f - 1.0f) / (polarWaveDepthStartXFlattenPointY732.x - polarWaveDepthStartXFlattenPointY732.y), 0.001f,
                1.0f);
            float tempOutput890G70 = clampResult910 * clampResult913;
            float tempOutput900G70 = tempOutput820G70 * tempOutput850G70 + tempOutput860G70 * tempOutput890G70;
            var appendResult94G70 = new float3(normalizeResult79G70.x * -1.0f * tempOutput900G70, tempOutput820G70 * tempOutput860G70, normalizeResult79G70.y * -1.0f * tempOutput900G70);
            var appendResult967 = new float2(texcoord3.x, texcoord3.y);
            float cos932 = math.cos((tempOutput9330 + 180.0f) * 0.01745f);
            float sin932 = math.sin((tempOutput9330 + 180.0f) * 0.01745f);
            float2 rotator932 = math.mul(appendResult967, new float2x2(cos932, -sin932, sin932, cos932));
            float2 ifLocalVar77G71 = math.length(rotator932) == 0.0f ? new float2(0.001f, 0) : rotator932;
            float2 normalizeResult79G71 = math.normalize(ifLocalVar77G71);
            float clampResult998 = math.clamp(tempOutput9930, 0.0f, tempOutput9930 / clampResult894);
            float clampResult1000 = math.clamp(clampResult998, 0.01f, 1.0f);
            float tempOutput610G71 = UnityPI * 2.0f / _gerstner1.w;
            float tempOutput820G71 = clampResult1000 / tempOutput610G71;
            var appendResult71G71 = new float3(aseWorldPos.x, aseWorldPos.z, 0.0f);
            float dotResult72G71 = math.dot(new float3(normalizeResult79G71, 0.0f), appendResult71G71);
            float tempOutput9640 = time + timeOffset843;
            float tempOutput810G71 = tempOutput610G71 * (dotResult72G71 - math.sqrt(9.8f / tempOutput610G71) * tempOutput9640);
            float tempOutput850G71 = math.cos(tempOutput810G71);
            float tempOutput860G71 = math.sin(tempOutput810G71);
            float tempOutput9910 = clampResult985 * (clampResult1062 * (_smallWaveSwashSize * texcoord3.z));
            float clampResult996 = math.clamp(tempOutput9910, 0.0f, tempOutput9910 / clampResult894);
            float tempOutput900G71 = tempOutput820G71 * tempOutput850G71 + tempOutput860G71 * clampResult996;
            var appendResult94G71 = new float3(normalizeResult79G71.x * tempOutput900G71, tempOutput820G71 * tempOutput860G71, normalizeResult79G71.y * tempOutput900G71);
            float cos931 = math.cos((tempOutput9290 + 180.0f) * 0.01745f);
            float sin931 = math.sin((tempOutput9290 + 180.0f) * 0.01745f);
            float2 rotator931 = math.mul(appendResult967, new float2x2(cos931, -sin931, sin931, cos931));
            float2 ifLocalVar77G53 = math.length(rotator931) == 0.0f ? new float2(0.001f, 0) : rotator931;
            float2 normalizeResult79G53 = math.normalize(ifLocalVar77G53);
            float clampResult1004 = math.clamp(tempOutput9940, 0.0f, tempOutput9940 / clampResult894);
            float clampResult1005 = math.clamp(clampResult1004, 0.01f, 1.0f);
            float tempOutput610G53 = UnityPI * 2.0f / _gerstner2.w;
            float tempOutput820G53 = clampResult1005 / tempOutput610G53;
            var appendResult71G53 = new float3(aseWorldPos.x, aseWorldPos.z, 0.0f);
            float dotResult72G53 = math.dot(new float3(normalizeResult79G53, 0.0f), appendResult71G53);
            float tempOutput810G53 = tempOutput610G53 * (dotResult72G53 - math.sqrt(9.8f / tempOutput610G53) * tempOutput9640);
            float tempOutput850G53 = math.cos(tempOutput810G53);
            float tempOutput860G53 = math.sin(tempOutput810G53);
            float tempOutput9920 = clampResult985 * (_smallWaveSwashSize * texcoord3.z * clampResult1063);
            float clampResult1001 = math.clamp(tempOutput9920, 0.0f, tempOutput9920 / clampResult894);
            float tempOutput900G53 = tempOutput820G53 * tempOutput850G53 + tempOutput860G53 * clampResult1001;
            var appendResult94G53 = new float3(normalizeResult79G53.x * tempOutput900G53, tempOutput820G53 * tempOutput860G53, normalizeResult79G53.y * tempOutput900G53);
            float clampResult44G154 = math.clamp(math.abs(aseWorldNormal.y), 0.0f, 1.0f);
            float2 seaFoamSlopeInfluence701 = _seaFoamSlopeInfluence.xy;
            float2 mainWaterSpeed692 = _slowWaterSpeed.xy;
            float2 waterTiling693 = _slowWaterTiling.xy;
            float2 tempOutput530G154 = ((1.0f - clampResult44G154) * seaFoamSlopeInfluence701 + mainWaterSpeed692) * waterTiling693 * texcoord3.xy;
            var appendResult57G154 = new float2(tempOutput530G154.y, tempOutput530G154.x);

            float2 staticSwitch59G154 = _uvvdirection1Udirection0On ? tempOutput530G154 : appendResult57G154;

            float waterFlowUVRefreshSpeed695 = _waterFlowUVRefresSpeed;
            float tempOutput680G154 = time * waterFlowUVRefreshSpeed695;
            float tempOutput710G154 = math.frac(tempOutput680G154);
            float2 tempOutput600G154 = staticSwitch59G154 * tempOutput710G154;
            float2 tempOutput830G154 = 1.0f / globalTiling70 * (waterTiling693 * texcoord.xy);
            float2 tempOutput161591 = tempOutput600G154 + tempOutput830G154;
            float2 tempOutput800G154 = staticSwitch59G154 * math.frac(tempOutput680G154 + -0.5f);
            float2 tempOutput161593 = tempOutput830G154 + tempOutput800G154;
            float clampResult90G154 = math.clamp(math.abs(math.sin(UnityPI * 1.5f + tempOutput710G154 * UnityPI)), 0.0f, 1.0f);
            float3 lerpResult80 = math.lerp(UnpackScaleNormal(SAMPLE_TEXTURE2D_LOD(_slowWaterNormal, tempOutput161591), _slowNormalScale),
                UnpackScaleNormal(SAMPLE_TEXTURE2D_LOD(_slowWaterNormal, tempOutput161593), _slowNormalScale), clampResult90G154);
            var appendResult136 = new float2(aseWorldPos.x, aseWorldPos.z);
            float lerpResult81 = math.lerp(SAMPLE_TEXTURE2D_LOD(_slowWaterTesselation, tempOutput161591).x, SAMPLE_TEXTURE2D_LOD(_slowWaterTesselation, tempOutput161593).x, clampResult90G154);

            float tempOutput11240 = math.min(polarWaveDepthStartXFlattenPointY732.y, smallWaveShoreDepthStartXFlattenPointY733.y);
            float clampResult1126 = math.clamp(tempOutput11240 / 3.0f, 0.0f, 9999.0f);
            float clampResult1132 = math.clamp(tempOutput11240 * 2.0f, 0.0f, 9999.0f);
            float clampResult1129 = math.clamp(1.0f + (texcoord3.w - clampResult1126) * (0.0f - 1.0f) / (clampResult1132 - clampResult1126), 0.0f, 1.0f);
            float lerpResult1133 = math.lerp((SAMPLE_TEXTURE2D_LOD(_slowWaterTesselation, lerpResult80.xy * new float2(0.05f, 0.05f) +
                                                                                          (time * (_slowWaterMixSpeed.xy * new float2(1.2f, 1.2f) * _macroWaveTiling.xy)
                                                                                           + 1.0f / globalTiling70 * (_macroWaveTiling.xy * appendResult136))).x + -0.25f) * _macroWaveTessScale +
                                             lerpResult81 * _slowWaterTessScale, 0.0f, clampResult1129);
            float3 aseVertexNormal = normal.xyz;
            float3 clampResult559 = math.clamp(aseVertexNormal, new float3(0, 0, 0), new float3(1, 1, 1));
            vertex.xyz += appendResult94G51 + (appendResult94G69 + appendResult94G70) + appendResult94G71 + appendResult94G53 + lerpResult1133 * clampResult559;

            float3 aseVertexTangent = tangent.xyz;
            float3 aseVertexBitangent = math.cross(aseVertexNormal, aseVertexTangent) * tangent.w; // * ( unity_WorldTransformParams.w >= 0.0f ? 1.0f : -1.0f );
            float tempOutput950G51 = tempOutput860G51 * clampResult859;
            float tempOutput1040G51 = tempOutput850G51 * tempOutput610G51 * tempOutput890G51;
            float tempOutput1140G51 = normalizeResult79G51.y * -1.0f * tempOutput950G51 + normalizeResult79G51.y * tempOutput1040G51;
            float tempOutput960G51 = tempOutput850G51 * clampResult859;
            var appendResult120G51 = new float3(normalizeResult79G51.x * tempOutput1140G51, normalizeResult79G51.y * tempOutput960G51, normalizeResult79G51.y * tempOutput1140G51);
            float tempOutput950G69 = tempOutput860G69 * clampResult847;
            float tempOutput1040G69 = tempOutput850G69 * tempOutput610G69 * tempOutput890G69;
            float tempOutput1140G69 = normalizeResult79G69.y * -1.0f * tempOutput950G69 + normalizeResult79G69.y * tempOutput1040G69;
            float tempOutput960G69 = tempOutput850G69 * clampResult847;
            var appendResult120G69 = new float3(normalizeResult79G69.x * tempOutput1140G69, normalizeResult79G69.y * tempOutput960G69, normalizeResult79G69.y * tempOutput1140G69);
            float tempOutput1270G70 = -1.0f / tempOutput1260G70;
            float tempOutput1360G70 = (clampResult901 * -1.0f * tempOutput860G70 + tempOutput610G70 * tempOutput850G70 * tempOutput890G70) * tempOutput1270G70;
            float tempOutput1380G70 = normalizeResult79G70.y * tempOutput1360G70;
            float tempOutput1310G70 = tempOutput850G70 * clampResult901 * tempOutput1270G70;
            var appendResult120G70 = new float3(normalizeResult79G70.x * tempOutput1380G70, normalizeResult79G70.y * tempOutput1310G70, normalizeResult79G70.y * tempOutput1380G70);
            float tempOutput950G71 = tempOutput860G71 * clampResult1000;
            float tempOutput1040G71 = tempOutput850G71 * tempOutput610G71 * clampResult996;
            float tempOutput1140G71 = normalizeResult79G71.y * -1.0f * tempOutput950G71 + normalizeResult79G71.y * tempOutput1040G71;
            float tempOutput960G71 = tempOutput850G71 * clampResult1000;
            var appendResult120G71 = new float3(normalizeResult79G71.x * tempOutput1140G71, normalizeResult79G71.y * tempOutput960G71, normalizeResult79G71.y * tempOutput1140G71);
            float tempOutput950G53 = tempOutput860G53 * clampResult1005;
            float tempOutput1040G53 = tempOutput850G53 * tempOutput610G53 * clampResult1001;
            float tempOutput1140G53 = normalizeResult79G53.y * -1.0f * tempOutput950G53 + normalizeResult79G53.y * tempOutput1040G53;
            float tempOutput960G53 = tempOutput850G53 * clampResult1005;
            var appendResult120G53 = new float3(normalizeResult79G53.x * tempOutput1140G53, normalizeResult79G53.y * tempOutput960G53, normalizeResult79G53.y * tempOutput1140G53);
            float tempOutput1010G51 = normalizeResult79G51.x * -1.0f * tempOutput950G51 + normalizeResult79G51.x * tempOutput1040G51;
            var appendResult110G51 = new float3(normalizeResult79G51.x * tempOutput1010G51, normalizeResult79G51.x * tempOutput960G51, normalizeResult79G51.y * tempOutput1010G51);
            float tempOutput1010G69 = normalizeResult79G69.x * -1.0f * tempOutput950G69 + normalizeResult79G69.x * tempOutput1040G69;
            var appendResult110G69 = new float3(normalizeResult79G69.x * tempOutput1010G69, normalizeResult79G69.x * tempOutput960G69, normalizeResult79G69.y * tempOutput1010G69);
            float tempOutput1370G70 = normalizeResult79G70.x * tempOutput1360G70;
            var appendResult110G70 = new float3(normalizeResult79G70.x * tempOutput1370G70, normalizeResult79G70.x * tempOutput1310G70, normalizeResult79G70.y * tempOutput1370G70);
            float tempOutput1010G71 = normalizeResult79G71.x * -1.0f * tempOutput950G71 + normalizeResult79G71.x * tempOutput1040G71;
            var appendResult110G71 = new float3(normalizeResult79G71.x * tempOutput1010G71, normalizeResult79G71.x * tempOutput960G71, normalizeResult79G71.y * tempOutput1010G71);
            float tempOutput1010G53 = normalizeResult79G53.x * -1.0f * tempOutput950G53 + normalizeResult79G53.x * tempOutput1040G53;
            var appendResult110G53 = new float3(normalizeResult79G53.x * tempOutput1010G53, normalizeResult79G53.x * tempOutput960G53, normalizeResult79G53.y * tempOutput1010G53);
            float3 normalizeResult1099 = math.normalize(math.cross(
                new float3(0, 0, 1) + (aseVertexBitangent + (appendResult120G51 + (appendResult120G69 + appendResult120G70) + appendResult120G71 + appendResult120G53)),
                new float3(1, 0, 0) + (aseVertexTangent.xyz + (appendResult110G51 + (appendResult110G69 + appendResult110G70) + appendResult110G71 + appendResult110G53))));
            normal = normalizeResult1099;


            return new SeaPhysics.PositionNormal()
            {
                Position = vertex,
                Normal = normal
            };
        }
    }
}
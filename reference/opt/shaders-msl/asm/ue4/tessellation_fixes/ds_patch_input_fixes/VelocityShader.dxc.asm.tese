#pragma clang diagnostic ignored "-Wmissing-braces"
#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
	
template <typename T, size_t Num>
struct unsafe_array
{
	T __Elements[Num ? Num : 1];
	
	constexpr size_t size() const thread { return Num; }
	constexpr size_t max_size() const thread { return Num; }
	constexpr bool empty() const thread { return Num == 0; }
	
	constexpr size_t size() const device { return Num; }
	constexpr size_t max_size() const device { return Num; }
	constexpr bool empty() const device { return Num == 0; }
	
	constexpr size_t size() const constant { return Num; }
	constexpr size_t max_size() const constant { return Num; }
	constexpr bool empty() const constant { return Num == 0; }
	
	constexpr size_t size() const threadgroup { return Num; }
	constexpr size_t max_size() const threadgroup { return Num; }
	constexpr bool empty() const threadgroup { return Num == 0; }
	
	thread T &operator[](size_t pos) thread
	{
		return __Elements[pos];
	}
	constexpr const thread T &operator[](size_t pos) const thread
	{
		return __Elements[pos];
	}
	
	device T &operator[](size_t pos) device
	{
		return __Elements[pos];
	}
	constexpr const device T &operator[](size_t pos) const device
	{
		return __Elements[pos];
	}
	
	constexpr const constant T &operator[](size_t pos) const constant
	{
		return __Elements[pos];
	}
	
	threadgroup T &operator[](size_t pos) threadgroup
	{
		return __Elements[pos];
	}
	constexpr const threadgroup T &operator[](size_t pos) const threadgroup
	{
		return __Elements[pos];
	}
};

using namespace metal;

struct type_View
{
    float4x4 View_TranslatedWorldToClip;
    float4x4 View_WorldToClip;
    float4x4 View_ClipToWorld;
    float4x4 View_TranslatedWorldToView;
    float4x4 View_ViewToTranslatedWorld;
    float4x4 View_TranslatedWorldToCameraView;
    float4x4 View_CameraViewToTranslatedWorld;
    float4x4 View_ViewToClip;
    float4x4 View_ViewToClipNoAA;
    float4x4 View_ClipToView;
    float4x4 View_ClipToTranslatedWorld;
    float4x4 View_SVPositionToTranslatedWorld;
    float4x4 View_ScreenToWorld;
    float4x4 View_ScreenToTranslatedWorld;
    packed_float3 View_ViewForward;
    float PrePadding_View_908;
    packed_float3 View_ViewUp;
    float PrePadding_View_924;
    packed_float3 View_ViewRight;
    float PrePadding_View_940;
    packed_float3 View_HMDViewNoRollUp;
    float PrePadding_View_956;
    packed_float3 View_HMDViewNoRollRight;
    float PrePadding_View_972;
    float4 View_InvDeviceZToWorldZTransform;
    float4 View_ScreenPositionScaleBias;
    packed_float3 View_WorldCameraOrigin;
    float PrePadding_View_1020;
    packed_float3 View_TranslatedWorldCameraOrigin;
    float PrePadding_View_1036;
    packed_float3 View_WorldViewOrigin;
    float PrePadding_View_1052;
    packed_float3 View_PreViewTranslation;
    float PrePadding_View_1068;
    float4x4 View_PrevProjection;
    float4x4 View_PrevViewProj;
    float4x4 View_PrevViewRotationProj;
    float4x4 View_PrevViewToClip;
    float4x4 View_PrevClipToView;
    float4x4 View_PrevTranslatedWorldToClip;
    float4x4 View_PrevTranslatedWorldToView;
    float4x4 View_PrevViewToTranslatedWorld;
    float4x4 View_PrevTranslatedWorldToCameraView;
    float4x4 View_PrevCameraViewToTranslatedWorld;
    packed_float3 View_PrevWorldCameraOrigin;
    float PrePadding_View_1724;
    packed_float3 View_PrevWorldViewOrigin;
    float PrePadding_View_1740;
    packed_float3 View_PrevPreViewTranslation;
    float PrePadding_View_1756;
    float4x4 View_PrevInvViewProj;
    float4x4 View_PrevScreenToTranslatedWorld;
    float4x4 View_ClipToPrevClip;
    float4 View_TemporalAAJitter;
    float4 View_GlobalClippingPlane;
    float2 View_FieldOfViewWideAngles;
    float2 View_PrevFieldOfViewWideAngles;
    float4 View_ViewRectMin;
    float4 View_ViewSizeAndInvSize;
    float4 View_BufferSizeAndInvSize;
    float4 View_BufferBilinearUVMinMax;
    int View_NumSceneColorMSAASamples;
    float View_PreExposure;
    float View_OneOverPreExposure;
    float PrePadding_View_2076;
    float4 View_DiffuseOverrideParameter;
    float4 View_SpecularOverrideParameter;
    float4 View_NormalOverrideParameter;
    float2 View_RoughnessOverrideParameter;
    float View_PrevFrameGameTime;
    float View_PrevFrameRealTime;
    float View_OutOfBoundsMask;
    float PrePadding_View_2148;
    float PrePadding_View_2152;
    float PrePadding_View_2156;
    packed_float3 View_WorldCameraMovementSinceLastFrame;
    float View_CullingSign;
    float View_NearPlane;
    float View_AdaptiveTessellationFactor;
    float View_GameTime;
    float View_RealTime;
    float View_DeltaTime;
    float View_MaterialTextureMipBias;
    float View_MaterialTextureDerivativeMultiply;
    uint View_Random;
    uint View_FrameNumber;
    uint View_StateFrameIndexMod8;
    uint View_StateFrameIndex;
    float View_CameraCut;
    float View_UnlitViewmodeMask;
    float PrePadding_View_2228;
    float PrePadding_View_2232;
    float PrePadding_View_2236;
    float4 View_DirectionalLightColor;
    packed_float3 View_DirectionalLightDirection;
    float PrePadding_View_2268;
    unsafe_array<float4,2> View_TranslucencyLightingVolumeMin;
    unsafe_array<float4,2> View_TranslucencyLightingVolumeInvSize;
    float4 View_TemporalAAParams;
    float4 View_CircleDOFParams;
    float View_DepthOfFieldSensorWidth;
    float View_DepthOfFieldFocalDistance;
    float View_DepthOfFieldScale;
    float View_DepthOfFieldFocalLength;
    float View_DepthOfFieldFocalRegion;
    float View_DepthOfFieldNearTransitionRegion;
    float View_DepthOfFieldFarTransitionRegion;
    float View_MotionBlurNormalizedToPixel;
    float View_bSubsurfacePostprocessEnabled;
    float View_GeneralPurposeTweak;
    float View_DemosaicVposOffset;
    float PrePadding_View_2412;
    packed_float3 View_IndirectLightingColorScale;
    float View_HDR32bppEncodingMode;
    packed_float3 View_AtmosphericFogSunDirection;
    float View_AtmosphericFogSunPower;
    float View_AtmosphericFogPower;
    float View_AtmosphericFogDensityScale;
    float View_AtmosphericFogDensityOffset;
    float View_AtmosphericFogGroundOffset;
    float View_AtmosphericFogDistanceScale;
    float View_AtmosphericFogAltitudeScale;
    float View_AtmosphericFogHeightScaleRayleigh;
    float View_AtmosphericFogStartDistance;
    float View_AtmosphericFogDistanceOffset;
    float View_AtmosphericFogSunDiscScale;
    float View_AtmosphericFogSunDiscHalfApexAngleRadian;
    float PrePadding_View_2492;
    float4 View_AtmosphericFogSunDiscLuminance;
    uint View_AtmosphericFogRenderMask;
    uint View_AtmosphericFogInscatterAltitudeSampleNum;
    uint PrePadding_View_2520;
    uint PrePadding_View_2524;
    float4 View_AtmosphericFogSunColor;
    packed_float3 View_NormalCurvatureToRoughnessScaleBias;
    float View_RenderingReflectionCaptureMask;
    float4 View_AmbientCubemapTint;
    float View_AmbientCubemapIntensity;
    float View_SkyLightParameters;
    float PrePadding_View_2584;
    float PrePadding_View_2588;
    float4 View_SkyLightColor;
    unsafe_array<float4,7> View_SkyIrradianceEnvironmentMap;
    float View_MobilePreviewMode;
    float View_HMDEyePaddingOffset;
    float View_ReflectionCubemapMaxMip;
    float View_ShowDecalsMask;
    uint View_DistanceFieldAOSpecularOcclusionMode;
    float View_IndirectCapsuleSelfShadowingIntensity;
    float PrePadding_View_2744;
    float PrePadding_View_2748;
    packed_float3 View_ReflectionEnvironmentRoughnessMixingScaleBiasAndLargestWeight;
    int View_StereoPassIndex;
    unsafe_array<float4,4> View_GlobalVolumeCenterAndExtent;
    unsafe_array<float4,4> View_GlobalVolumeWorldToUVAddAndMul;
    float View_GlobalVolumeDimension;
    float View_GlobalVolumeTexelSize;
    float View_MaxGlobalDistance;
    float PrePadding_View_2908;
    int2 View_CursorPosition;
    float View_bCheckerboardSubsurfaceProfileRendering;
    float PrePadding_View_2924;
    packed_float3 View_VolumetricFogInvGridSize;
    float PrePadding_View_2940;
    packed_float3 View_VolumetricFogGridZParams;
    float PrePadding_View_2956;
    float2 View_VolumetricFogSVPosToVolumeUV;
    float View_VolumetricFogMaxDistance;
    float PrePadding_View_2972;
    packed_float3 View_VolumetricLightmapWorldToUVScale;
    float PrePadding_View_2988;
    packed_float3 View_VolumetricLightmapWorldToUVAdd;
    float PrePadding_View_3004;
    packed_float3 View_VolumetricLightmapIndirectionTextureSize;
    float View_VolumetricLightmapBrickSize;
    packed_float3 View_VolumetricLightmapBrickTexelSize;
    float View_StereoIPD;
    float View_IndirectLightingCacheShowFlag;
    float View_EyeToPixelSpreadAngle;
    float PrePadding_View_3048;
    float PrePadding_View_3052;
    float4x4 View_WorldToVirtualTexture;
    float4 View_VirtualTextureParams;
    unsafe_array<float4,2> View_XRPassthroughCameraUVs;
};

struct type_Material
{
    unsafe_array<float4,5> Material_VectorExpressions;
    unsafe_array<float4,2> Material_ScalarExpressions;
};

constant float4 _118 = {};

struct main0_out
{
    float4 out_var_TEXCOORD6 [[user(locn0)]];
    float4 out_var_TEXCOORD7 [[user(locn1)]];
    float4 out_var_TEXCOORD10_centroid [[user(locn2)]];
    float4 out_var_TEXCOORD11_centroid [[user(locn3)]];
    float gl_ClipDistance [[clip_distance]] [1];
    float4 gl_Position [[position]];
};

struct main0_in
{
    float4 in_var_PN_DominantEdge2 [[attribute(3)]];
    float4 in_var_PN_DominantEdge3 [[attribute(4)]];
    float3 in_var_PN_DominantEdge4 [[attribute(5)]];
    float3 in_var_PN_DominantEdge5 [[attribute(6)]];
    float4 in_var_PN_DominantVertex1 [[attribute(8)]];
    float3 in_var_PN_DominantVertex2 [[attribute(9)]];
    float4 in_var_PN_POSITION_0 [[attribute(10)]];
    float4 in_var_PN_POSITION_1 [[attribute(11)]];
    float4 in_var_PN_POSITION_2 [[attribute(12)]];
    float in_var_PN_WorldDisplacementMultiplier [[attribute(15)]];
    float4 in_var_TEXCOORD10_centroid [[attribute(16)]];
    float4 in_var_TEXCOORD11_centroid [[attribute(17)]];
    float4 in_var_TEXCOORD6 [[attribute(18)]];
    float4 in_var_TEXCOORD8 [[attribute(19)]];
};

struct main0_patchIn
{
    float4 in_var_PN_POSITION9 [[attribute(13)]];
    patch_control_point<main0_in> gl_in;
};

[[ patch(triangle, 0) ]] vertex main0_out main0(main0_patchIn patchIn [[stage_in]], constant type_View& View [[buffer(0)]], constant type_Material& Material [[buffer(1)]], texture3d<float> View_GlobalDistanceFieldTexture0 [[texture(0)]], texture3d<float> View_GlobalDistanceFieldTexture1 [[texture(1)]], texture3d<float> View_GlobalDistanceFieldTexture2 [[texture(2)]], texture3d<float> View_GlobalDistanceFieldTexture3 [[texture(3)]], sampler View_GlobalDistanceFieldSampler0 [[sampler(0)]], float3 gl_TessCoord [[position_in_patch]])
{
    main0_out out = {};
    unsafe_array<unsafe_array<float4,3>,3> in_var_PN_POSITION = {};
    float _190 = gl_TessCoord.x * gl_TessCoord.x;
    float _191 = gl_TessCoord.y * gl_TessCoord.y;
    float _192 = gl_TessCoord.z * gl_TessCoord.z;
    float4 _198 = float4(gl_TessCoord.x);
    float4 _202 = float4(gl_TessCoord.y);
    float4 _207 = float4(gl_TessCoord.z);
    float4 _210 = float4(_190 * 3.0);
    float4 _214 = float4(_191 * 3.0);
    float4 _221 = float4(_192 * 3.0);
    float4 _235 = ((((((((((unsafe_array<float4,3>({ patchIn.gl_in[0].in_var_PN_POSITION_0, patchIn.gl_in[0].in_var_PN_POSITION_1, patchIn.gl_in[0].in_var_PN_POSITION_2 })[0] * float4(_190)) * _198) + ((unsafe_array<float4,3>({ patchIn.gl_in[1].in_var_PN_POSITION_0, patchIn.gl_in[1].in_var_PN_POSITION_1, patchIn.gl_in[1].in_var_PN_POSITION_2 })[0] * float4(_191)) * _202)) + ((unsafe_array<float4,3>({ patchIn.gl_in[2].in_var_PN_POSITION_0, patchIn.gl_in[2].in_var_PN_POSITION_1, patchIn.gl_in[2].in_var_PN_POSITION_2 })[0] * float4(_192)) * _207)) + ((unsafe_array<float4,3>({ patchIn.gl_in[0].in_var_PN_POSITION_0, patchIn.gl_in[0].in_var_PN_POSITION_1, patchIn.gl_in[0].in_var_PN_POSITION_2 })[1] * _210) * _202)) + ((unsafe_array<float4,3>({ patchIn.gl_in[0].in_var_PN_POSITION_0, patchIn.gl_in[0].in_var_PN_POSITION_1, patchIn.gl_in[0].in_var_PN_POSITION_2 })[2] * _214) * _198)) + ((unsafe_array<float4,3>({ patchIn.gl_in[1].in_var_PN_POSITION_0, patchIn.gl_in[1].in_var_PN_POSITION_1, patchIn.gl_in[1].in_var_PN_POSITION_2 })[1] * _214) * _207)) + ((unsafe_array<float4,3>({ patchIn.gl_in[1].in_var_PN_POSITION_0, patchIn.gl_in[1].in_var_PN_POSITION_1, patchIn.gl_in[1].in_var_PN_POSITION_2 })[2] * _221) * _202)) + ((unsafe_array<float4,3>({ patchIn.gl_in[2].in_var_PN_POSITION_0, patchIn.gl_in[2].in_var_PN_POSITION_1, patchIn.gl_in[2].in_var_PN_POSITION_2 })[1] * _221) * _198)) + ((unsafe_array<float4,3>({ patchIn.gl_in[2].in_var_PN_POSITION_0, patchIn.gl_in[2].in_var_PN_POSITION_1, patchIn.gl_in[2].in_var_PN_POSITION_2 })[2] * _210) * _207)) + ((((patchIn.in_var_PN_POSITION9 * float4(6.0)) * _207) * _198) * _202);
    float3 _237 = float3(gl_TessCoord.x);
    float3 _240 = float3(gl_TessCoord.y);
    float3 _254 = float3(gl_TessCoord.z);
    float3 _256 = ((patchIn.gl_in[0].in_var_TEXCOORD10_centroid.xyz * _237) + (patchIn.gl_in[1].in_var_TEXCOORD10_centroid.xyz * _240)).xyz + (patchIn.gl_in[2].in_var_TEXCOORD10_centroid.xyz * _254);
    float4 _259 = ((patchIn.gl_in[0].in_var_TEXCOORD11_centroid * _198) + (patchIn.gl_in[1].in_var_TEXCOORD11_centroid * _202)) + (patchIn.gl_in[2].in_var_TEXCOORD11_centroid * _207);
    float3 _264 = _235.xyz;
    float3 _265 = _256.xyz;
    float3 _266 = _259.xyz;
    float3 _272 = _264 + float3(View.View_WorldCameraOrigin);
    float _279 = float(int(gl_TessCoord.x == 0.0));
    float _282 = float(int(gl_TessCoord.y == 0.0));
    float _285 = float(int(gl_TessCoord.z == 0.0));
    float _286 = _279 + _282;
    float _287 = _286 + _285;
    float4 _387;
    float3 _388;
    if (float(int(_287 == 2.0)) == 1.0)
    {
        float _363 = float(int((_282 + _285) == 2.0));
        float _367 = float(int((_285 + _279) == 2.0));
        float _370 = float(int(_286 == 2.0));
        _387 = ((float4(_363) * patchIn.gl_in[0].in_var_PN_DominantVertex1) + (float4(_367) * patchIn.gl_in[1].in_var_PN_DominantVertex1)) + (float4(_370) * patchIn.gl_in[2].in_var_PN_DominantVertex1);
        _388 = ((float3(_363) * patchIn.gl_in[0].in_var_PN_DominantVertex2) + (float3(_367) * patchIn.gl_in[1].in_var_PN_DominantVertex2)) + (float3(_370) * patchIn.gl_in[2].in_var_PN_DominantVertex2);
    }
    else
    {
        float4 _358;
        float3 _359;
        if (float(int(_287 == 1.0)) != 0.0)
        {
            float4 _304 = float4(_279);
            float4 _306 = float4(_282);
            float4 _309 = float4(_285);
            float4 _311 = ((_304 * patchIn.gl_in[0].in_var_PN_DominantEdge2) + (_306 * patchIn.gl_in[1].in_var_PN_DominantEdge2)) + (_309 * patchIn.gl_in[2].in_var_PN_DominantEdge2);
            float4 _316 = ((_304 * patchIn.gl_in[0].in_var_PN_DominantEdge3) + (_306 * patchIn.gl_in[1].in_var_PN_DominantEdge3)) + (_309 * patchIn.gl_in[2].in_var_PN_DominantEdge3);
            float3 _331 = float3(_279);
            float3 _333 = float3(_282);
            float3 _336 = float3(_285);
            float3 _338 = ((_331 * patchIn.gl_in[0].in_var_PN_DominantEdge4) + (_333 * patchIn.gl_in[1].in_var_PN_DominantEdge4)) + (_336 * patchIn.gl_in[2].in_var_PN_DominantEdge4);
            float3 _343 = ((_331 * patchIn.gl_in[0].in_var_PN_DominantEdge5) + (_333 * patchIn.gl_in[1].in_var_PN_DominantEdge5)) + (_336 * patchIn.gl_in[2].in_var_PN_DominantEdge5);
            _358 = ((_304 * ((_202 * _311) + (_207 * _316))) + (_306 * ((_207 * _311) + (_198 * _316)))) + (_309 * ((_198 * _311) + (_202 * _316)));
            _359 = ((_331 * ((_240 * _338) + (_254 * _343))) + (_333 * ((_254 * _338) + (_237 * _343)))) + (_336 * ((_237 * _338) + (_240 * _343)));
        }
        else
        {
            _358 = float4(_259.xyz, 0.0);
            _359 = _265;
        }
        _387 = _358;
        _388 = _359;
    }
    float3x3 _398;
    if (float(int(_287 == 0.0)) == 0.0)
    {
        _398 = float3x3(_388, cross(_387.xyz, _388) * float3(_387.w), _387.xyz);
    }
    else
    {
        _398 = float3x3(_265, cross(_266, _265) * float3(_259.w), _266);
    }
    float3 _411 = fast::min(fast::max((_272 - View.View_GlobalVolumeCenterAndExtent[0].xyz) + View.View_GlobalVolumeCenterAndExtent[0].www, float3(0.0)), fast::max((View.View_GlobalVolumeCenterAndExtent[0].xyz + View.View_GlobalVolumeCenterAndExtent[0].www) - _272, float3(0.0)));
    float _547;
    if (fast::min(_411.x, fast::min(_411.y, _411.z)) > (View.View_GlobalVolumeCenterAndExtent[0].w * View.View_GlobalVolumeTexelSize))
    {
        _547 = View_GlobalDistanceFieldTexture0.sample(View_GlobalDistanceFieldSampler0, ((_272 * View.View_GlobalVolumeWorldToUVAddAndMul[0u].www) + View.View_GlobalVolumeWorldToUVAddAndMul[0u].xyz), level(0.0)).x;
    }
    else
    {
        float3 _436 = fast::min(fast::max((_272 - View.View_GlobalVolumeCenterAndExtent[1].xyz) + View.View_GlobalVolumeCenterAndExtent[1].www, float3(0.0)), fast::max((View.View_GlobalVolumeCenterAndExtent[1].xyz + View.View_GlobalVolumeCenterAndExtent[1].www) - _272, float3(0.0)));
        float _535;
        if (fast::min(_436.x, fast::min(_436.y, _436.z)) > (View.View_GlobalVolumeCenterAndExtent[1].w * View.View_GlobalVolumeTexelSize))
        {
            _535 = View_GlobalDistanceFieldTexture1.sample(View_GlobalDistanceFieldSampler0, ((_272 * View.View_GlobalVolumeWorldToUVAddAndMul[1u].www) + View.View_GlobalVolumeWorldToUVAddAndMul[1u].xyz), level(0.0)).x;
        }
        else
        {
            float3 _459 = fast::min(fast::max((_272 - View.View_GlobalVolumeCenterAndExtent[2].xyz) + View.View_GlobalVolumeCenterAndExtent[2].www, float3(0.0)), fast::max((View.View_GlobalVolumeCenterAndExtent[2].xyz + View.View_GlobalVolumeCenterAndExtent[2].www) - _272, float3(0.0)));
            float3 _475 = fast::min(fast::max((_272 - View.View_GlobalVolumeCenterAndExtent[3].xyz) + View.View_GlobalVolumeCenterAndExtent[3].www, float3(0.0)), fast::max((View.View_GlobalVolumeCenterAndExtent[3].xyz + View.View_GlobalVolumeCenterAndExtent[3].www) - _272, float3(0.0)));
            float _480 = fast::min(_475.x, fast::min(_475.y, _475.z));
            float _523;
            if (fast::min(_459.x, fast::min(_459.y, _459.z)) > (View.View_GlobalVolumeCenterAndExtent[2].w * View.View_GlobalVolumeTexelSize))
            {
                _523 = View_GlobalDistanceFieldTexture2.sample(View_GlobalDistanceFieldSampler0, ((_272 * View.View_GlobalVolumeWorldToUVAddAndMul[2u].www) + View.View_GlobalVolumeWorldToUVAddAndMul[2u].xyz), level(0.0)).x;
            }
            else
            {
                float _511;
                if (_480 > (View.View_GlobalVolumeCenterAndExtent[3].w * View.View_GlobalVolumeTexelSize))
                {
                    _511 = mix(View.View_MaxGlobalDistance, View_GlobalDistanceFieldTexture3.sample(View_GlobalDistanceFieldSampler0, ((_272 * View.View_GlobalVolumeWorldToUVAddAndMul[3u].www) + View.View_GlobalVolumeWorldToUVAddAndMul[3u].xyz), level(0.0)).x, fast::clamp((_480 * 10.0) * View.View_GlobalVolumeWorldToUVAddAndMul[3].w, 0.0, 1.0));
                }
                else
                {
                    _511 = View.View_MaxGlobalDistance;
                }
                _523 = _511;
            }
            _535 = _523;
        }
        _547 = _535;
    }
    float3 _565 = _264 + ((_398[2] * float3(fast::min(_547 + Material.Material_ScalarExpressions[0].z, 0.0) * Material.Material_ScalarExpressions[0].w)) * float3(((patchIn.gl_in[0].in_var_PN_WorldDisplacementMultiplier * gl_TessCoord.x) + (patchIn.gl_in[1].in_var_PN_WorldDisplacementMultiplier * gl_TessCoord.y)) + (patchIn.gl_in[2].in_var_PN_WorldDisplacementMultiplier * gl_TessCoord.z)));
    float4 _574 = View.View_TranslatedWorldToClip * float4(_565.x, _565.y, _565.z, _235.w);
    float4 _579 = _574;
    _579.z = _574.z + (0.001000000047497451305389404296875 * _574.w);
    out.gl_Position = _579;
    out.out_var_TEXCOORD6 = ((patchIn.gl_in[0].in_var_TEXCOORD6 * _198) + (patchIn.gl_in[1].in_var_TEXCOORD6 * _202)) + (patchIn.gl_in[2].in_var_TEXCOORD6 * _207);
    out.out_var_TEXCOORD7 = ((patchIn.gl_in[0].in_var_TEXCOORD8 * _198) + (patchIn.gl_in[1].in_var_TEXCOORD8 * _202)) + (patchIn.gl_in[2].in_var_TEXCOORD8 * _207);
    out.out_var_TEXCOORD10_centroid = float4(_256.x, _256.y, _256.z, _118.w);
    out.out_var_TEXCOORD11_centroid = _259;
    out.gl_ClipDistance[0u] = dot(View.View_GlobalClippingPlane, float4(_565.xyz - float3(View.View_PreViewTranslation), 1.0));
    return out;
}


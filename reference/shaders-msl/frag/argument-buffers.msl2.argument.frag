#pragma clang diagnostic ignored "-Wmissing-prototypes"
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

struct SSBO
{
    float4 ssbo;
};

struct SSBOs
{
    float4 ssbo;
};

struct Push
{
    float4 push;
};

struct UBO
{
    float4 ubo;
};

struct UBOs
{
    float4 ubo;
};

struct spvDescriptorSetBuffer0
{
    texture2d<float> uTexture [[id(2)]];
    sampler uTextureSmplr [[id(3)]];
    constant UBO* v_90 [[id(5)]];
    array<texture2d<float>, 2> uTextures [[id(6)]];
    array<sampler, 2> uTexturesSmplr [[id(8)]];
};

struct spvDescriptorSetBuffer1
{
    array<texture2d<float>, 4> uTexture2 [[id(3)]];
    device SSBO* v_60 [[id(7)]];
    unsafe_array<const device thread SSBOs*,2> ssbos [[id(8)]];
    array<sampler, 2> uSampler [[id(10)]];
};

struct spvDescriptorSetBuffer2
{
    unsafe_array<constant thread UBOs*,4> ubos [[id(4)]];
};

struct main0_out
{
    float4 FragColor [[color(0)]];
};

struct main0_in
{
    float2 vUV [[user(locn0)]];
};

static inline __attribute__((always_inline))
float4 sample_in_function2(thread texture2d<float> uTexture, thread const sampler uTextureSmplr, thread float2& vUV, thread const array<texture2d<float>, 4> uTexture2, thread const array<sampler, 2> uSampler, thread const array<texture2d<float>, 2> uTextures, thread const array<sampler, 2> uTexturesSmplr, device SSBO& v_60, constant unsafe_array<const device SSBOs*,2> (&ssbos), constant Push& registers)
{
    float4 ret = uTexture.sample(uTextureSmplr, vUV);
    ret += uTexture2[2].sample(uSampler[1], vUV);
    ret += uTextures[1].sample(uTexturesSmplr[1], vUV);
    ret += v_60.ssbo;
    ret += ssbos[0]->ssbo;
    ret += registers.push;
    return ret;
}

static inline __attribute__((always_inline))
float4 sample_in_function(thread texture2d<float> uTexture, thread const sampler uTextureSmplr, thread float2& vUV, thread const array<texture2d<float>, 4> uTexture2, thread const array<sampler, 2> uSampler, thread const array<texture2d<float>, 2> uTextures, thread const array<sampler, 2> uTexturesSmplr, device SSBO& v_60, constant unsafe_array<const device SSBOs*,2> (&ssbos), constant Push& registers, constant UBO& v_90, constant unsafe_array<constant UBOs*,4> (&ubos))
{
    float4 ret = sample_in_function2(uTexture, uTextureSmplr, vUV, uTexture2, uSampler, uTextures, uTexturesSmplr, v_60, ssbos, registers);
    ret += v_90.ubo;
    ret += ubos[0]->ubo;
    return ret;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], constant spvDescriptorSetBuffer1& spvDescriptorSet1 [[buffer(1)]], constant spvDescriptorSetBuffer2& spvDescriptorSet2 [[buffer(2)]], constant Push& registers [[buffer(3)]])
{
    main0_out out = {};
    out.FragColor = sample_in_function(spvDescriptorSet0.uTexture, spvDescriptorSet0.uTextureSmplr, in.vUV, spvDescriptorSet1.uTexture2, spvDescriptorSet1.uSampler, spvDescriptorSet0.uTextures, spvDescriptorSet0.uTexturesSmplr, (*spvDescriptorSet1.v_60), spvDescriptorSet1.ssbos, registers, (*spvDescriptorSet0.v_90), spvDescriptorSet2.ubos);
    out.FragColor += (*spvDescriptorSet0.v_90).ubo;
    out.FragColor += (*spvDescriptorSet1.v_60).ssbo;
    out.FragColor += spvDescriptorSet2.ubos[1]->ubo;
    out.FragColor += registers.push;
    return out;
}


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

struct main0_out
{
    float FragColor [[color(0)]];
};

struct main0_in
{
    float3 vUV [[user(locn0)]];
};

static inline __attribute__((always_inline))
float sample_combined(thread float3& vUV, thread depth2d<float> uShadow, thread const sampler uShadowSmplr)
{
    return uShadow.sample_compare(uShadowSmplr, vUV.xy, vUV.z);
}

static inline __attribute__((always_inline))
float sample_separate(thread float3& vUV, thread depth2d<float> uTexture, thread sampler uSampler)
{
    return uTexture.sample_compare(uSampler, vUV.xy, vUV.z);
}

fragment main0_out main0(main0_in in [[stage_in]], depth2d<float> uShadow [[texture(0)]], depth2d<float> uTexture [[texture(1)]], sampler uShadowSmplr [[sampler(0)]], sampler uSampler [[sampler(2)]])
{
    main0_out out = {};
    out.FragColor = sample_combined(in.vUV, uShadow, uShadowSmplr) + sample_separate(in.vUV, uTexture, uSampler);
    return out;
}


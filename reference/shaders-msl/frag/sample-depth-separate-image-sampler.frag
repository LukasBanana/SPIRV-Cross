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

static inline __attribute__((always_inline))
float sample_depth_from_function(thread const depth2d<float> uT, thread const sampler uS)
{
    return uT.sample_compare(uS, float3(0.5).xy, float3(0.5).z);
}

static inline __attribute__((always_inline))
float sample_color_from_function(thread const texture2d<float> uT, thread const sampler uS)
{
    return uT.sample(uS, float2(0.5)).x;
}

fragment main0_out main0(depth2d<float> uDepth [[texture(0)]], texture2d<float> uColor [[texture(1)]], sampler uSampler [[sampler(2)]], sampler uSamplerShadow [[sampler(3)]])
{
    main0_out out = {};
    out.FragColor = sample_depth_from_function(uDepth, uSamplerShadow) + sample_color_from_function(uColor, uSampler);
    return out;
}


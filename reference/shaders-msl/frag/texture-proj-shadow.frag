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
    float3 vClip3 [[user(locn0)]];
    float4 vClip4 [[user(locn1)]];
    float2 vClip2 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], depth2d<float> uShadow2D [[texture(1)]], texture1d<float> uSampler1D [[texture(2)]], texture2d<float> uSampler2D [[texture(3)]], texture3d<float> uSampler3D [[texture(4)]], sampler uShadow2DSmplr [[sampler(1)]], sampler uSampler1DSmplr [[sampler(2)]], sampler uSampler2DSmplr [[sampler(3)]], sampler uSampler3DSmplr [[sampler(4)]])
{
    main0_out out = {};
    float4 _20 = in.vClip4;
    _20.z = in.vClip4.w;
    out.FragColor = uShadow2D.sample_compare(uShadow2DSmplr, _20.xy / _20.z, in.vClip4.z / _20.z);
    out.FragColor = uSampler1D.sample(uSampler1DSmplr, in.vClip2.x / in.vClip2.y).x;
    out.FragColor = uSampler2D.sample(uSampler2DSmplr, in.vClip3.xy / in.vClip3.z).x;
    out.FragColor = uSampler3D.sample(uSampler3DSmplr, in.vClip4.xyz / in.vClip4.w).x;
    return out;
}


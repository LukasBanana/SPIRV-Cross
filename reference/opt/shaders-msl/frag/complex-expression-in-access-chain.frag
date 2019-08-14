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

struct UBO
{
    unsafe_array<float4,1024> results;
};

struct main0_out
{
    float4 FragColor [[color(0)]];
};

struct main0_in
{
    int vIn [[user(locn0)]];
    int vIn2 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], device UBO& _34 [[buffer(0)]], texture2d<int> Buf [[texture(1)]], sampler BufSmplr [[sampler(1)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _40 = Buf.read(uint2(int2(gl_FragCoord.xy)), 0).x % 16;
    out.FragColor = (_34.results[_40] + _34.results[_40]) + _34.results[(in.vIn * in.vIn) + (in.vIn2 * in.vIn2)];
    return out;
}


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

constant unsafe_array<float,16> _16 = unsafe_array<float,16>({ 1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0, 4.0 });
constant unsafe_array<float4,4> _60 = unsafe_array<float4,4>({ float4(0.0), float4(1.0), float4(8.0), float4(5.0) });
constant unsafe_array<float4,4> _104 = unsafe_array<float4,4>({ float4(20.0), float4(30.0), float4(50.0), float4(60.0) });

struct main0_out
{
    float FragColor [[color(0)]];
};

struct main0_in
{
    int index [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]])
{
    main0_out out = {};
    out.FragColor = _16[in.index];
    if (in.index < 10)
    {
        out.FragColor += _16[in.index ^ 1];
    }
    else
    {
        out.FragColor += _16[in.index & 1];
    }
    bool _63 = in.index > 30;
    if (_63)
    {
        out.FragColor += _60[in.index & 3].y;
    }
    else
    {
        out.FragColor += _60[in.index & 1].x;
    }
    unsafe_array<float4,4> foobar = unsafe_array<float4,4>({ float4(0.0), float4(1.0), float4(8.0), float4(5.0) });
    if (_63)
    {
        foobar[1].z = 20.0;
    }
    int _91 = in.index & 3;
    out.FragColor += foobar[_91].z;
    out.FragColor += _104[_91].z;
    return out;
}


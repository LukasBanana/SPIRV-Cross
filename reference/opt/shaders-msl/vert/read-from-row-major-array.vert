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

struct Block
{
    unsafe_array<unsafe_array<float2x3,3>,4> var;
};

struct main0_out
{
    float v_vtxResult [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct main0_in
{
    float4 a_position [[attribute(0)]];
};

// Implementation of a conversion of matrix content from RowMajor to ColumnMajor organization.
static inline __attribute__((always_inline))
float2x3 spvConvertFromRowMajor2x3(float2x3 m)
{
    return float2x3(float3(m[0][0], m[0][2], m[1][1]), float3(m[0][1], m[1][0], m[1][2]));
}

vertex main0_out main0(main0_in in [[stage_in]], constant Block& _104 [[buffer(0)]])
{
    main0_out out = {};
    out.gl_Position = in.a_position;
    out.v_vtxResult = ((float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[0].x - 2.0) < 0.0500000007450580596923828125) * float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[0].y - 6.0) < 0.0500000007450580596923828125)) * float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[0].z - (-6.0)) < 0.0500000007450580596923828125)) * ((float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[1].x) < 0.0500000007450580596923828125) * float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[1].y - 5.0) < 0.0500000007450580596923828125)) * float(abs(spvConvertFromRowMajor2x3(_104.var[0][0])[1].z - 5.0) < 0.0500000007450580596923828125));
    return out;
}


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

struct VertexOutput
{
    float4 HPosition;
};

struct TestStruct
{
    float3 position;
    float radius;
};

struct TestStruct_1
{
    packed_float3 position;
    float radius;
};

struct CB0
{
    unsafe_array<TestStruct_1,16> CB0;
};

struct main0_out
{
    float4 _entryPointOutput [[color(0)]];
};

static inline __attribute__((always_inline))
float4 _main(thread const VertexOutput& IN, constant CB0& v_26)
{
    TestStruct st;
    st.position = float3(v_26.CB0[1].position);
    st.radius = v_26.CB0[1].radius;
    float4 col = float4(st.position, st.radius);
    return col;
}

fragment main0_out main0(constant CB0& v_26 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    VertexOutput IN;
    IN.HPosition = gl_FragCoord;
    VertexOutput param = IN;
    VertexOutput param_1 = param;
    out._entryPointOutput = _main(param_1, v_26);
    return out;
}


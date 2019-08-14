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
    unsafe_array<char,16> i8;
    unsafe_array<uchar,16> u8;
};

struct Push
{
    char i8;
    uchar u8;
};

struct UBO
{
    char i8;
    uchar u8;
};

struct main0_out
{
    int4 FragColorInt [[color(0)]];
    uint4 FragColorUint [[color(1)]];
};

struct main0_in
{
    int4 vColor [[user(locn0)]];
};

static inline __attribute__((always_inline))
void packing_int8(device SSBO& ssbo)
{
    short i16 = 10;
    int i32 = 20;
    char2 i8_2 = as_type<char2>(i16);
    char4 i8_4 = as_type<char4>(i32);
    i16 = as_type<short>(i8_2);
    i32 = as_type<int>(i8_4);
    ssbo.i8[0] = i8_4.x;
    ssbo.i8[1] = i8_4.y;
    ssbo.i8[2] = i8_4.z;
    ssbo.i8[3] = i8_4.w;
}

static inline __attribute__((always_inline))
void packing_uint8(device SSBO& ssbo)
{
    ushort u16 = 10u;
    uint u32 = 20u;
    uchar2 u8_2 = as_type<uchar2>(u16);
    uchar4 u8_4 = as_type<uchar4>(u32);
    u16 = as_type<ushort>(u8_2);
    u32 = as_type<uint>(u8_4);
    ssbo.u8[0] = u8_4.x;
    ssbo.u8[1] = u8_4.y;
    ssbo.u8[2] = u8_4.z;
    ssbo.u8[3] = u8_4.w;
}

static inline __attribute__((always_inline))
void compute_int8(device SSBO& ssbo, thread int4& vColor, constant Push& registers, constant UBO& ubo, thread int4& FragColorInt)
{
    char4 tmp = char4(vColor);
    tmp += char4(registers.i8);
    tmp += char4(char(-40));
    tmp += char4(-50);
    tmp += char4(char(10), char(20), char(30), char(40));
    tmp += char4(ssbo.i8[4]);
    tmp += char4(ubo.i8);
    FragColorInt = int4(tmp);
}

static inline __attribute__((always_inline))
void compute_uint8(device SSBO& ssbo, thread int4& vColor, constant Push& registers, constant UBO& ubo, thread uint4& FragColorUint)
{
    uchar4 tmp = uchar4(char4(vColor));
    tmp += uchar4(registers.u8);
    tmp += uchar4(uchar(216));
    tmp += uchar4(206);
    tmp += uchar4(uchar(10), uchar(20), uchar(30), uchar(40));
    tmp += uchar4(ssbo.u8[4]);
    tmp += uchar4(ubo.u8);
    FragColorUint = uint4(tmp);
}

fragment main0_out main0(main0_in in [[stage_in]], constant Push& registers [[buffer(0)]], constant UBO& ubo [[buffer(1)]], device SSBO& ssbo [[buffer(2)]])
{
    main0_out out = {};
    packing_int8(ssbo);
    packing_uint8(ssbo);
    compute_int8(ssbo, in.vColor, registers, ubo, out.FragColorInt);
    compute_uint8(ssbo, in.vColor, registers, ubo, out.FragColorUint);
    return out;
}


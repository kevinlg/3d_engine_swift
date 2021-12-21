#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstant {
    float4x4 modelMatrix;
};

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant ModelConstant &modelConstant [[ buffer(1) ]] ) {
    RasterizerData rd;
    rd.position = modelConstant.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;

    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]]) {
    float4 color = rd.color;
    return half4(color.r, color.g, color.b, color.a);
}
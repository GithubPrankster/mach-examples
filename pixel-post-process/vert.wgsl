@group(0) @binding(0) var<uniform> ubo: mat4x4<f32>;

struct VertexOut {
    @builtin(position) position_clip: vec4<f32>,
    @location(0) normal: vec3<f32>,
    @location(1) uv: vec2<f32>,
}

@vertex fn main(
    @location(0) position: vec3<f32>,
    @location(1) normal: vec3<f32>,
    @location(2) uv: vec2<f32> 
) -> VertexOut {
    var output: VertexOut;
    output.position_clip = vec4<f32>(position, 1) * ubo;
    output.normal = (vec4<f32>(normal, 0) * ubo).xyz;
    output.uv = uv;
    return output;
}


shader_type canvas_item;
uniform float hair_vertical_offs = -0.1;
uniform float hair_horizontal_offs = 0;

void fragment() {
    float t = TIME;
    vec2 uv = UV;
    float uv_x_deform = cos(uv.x);
    vec2 offs_uv = vec2(cos(t * 0.3 + uv.y * 1.0) + ( uv.x) * ( uv.x) * 0.1, cos(t * 0.1 + uv.x * 0.1) + hair_vertical_offs * (1.2 - uv.x)) * 0.03 * (1.0 - uv.x);
    
    vec4 img = texture(TEXTURE, uv + vec2(offs_uv.x, offs_uv.y));
    COLOR = img;
    
}
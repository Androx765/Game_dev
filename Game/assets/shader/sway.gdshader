shader_type spatial;
render_mode depth_prepass_alpha, depth_draw_opaque, cull_disabled, world_vertex_coords, blend_mix, diffuse_burley, specular_schlick_ggx;

uniform sampler2D texture_albedo: source_color,filter_linear_mipmap,repeat_enable;
uniform vec4 transmission;


uniform float uv = 1.0;
uniform float green_multiplier = 1.0;
uniform float sway_speed = 1.0;
uniform float sway_strength = 0.05;
uniform float sway_phase_len = 8.0;
uniform float metallic : hint_range(0,1) = 0.0;
uniform float roughness : hint_range(0,1) = 1.0;
uniform float specular : hint_range(0,1) = 0.5;

void vertex() {
 
	float strength = COLOR.r * sway_strength;
	VERTEX.x += sin(VERTEX.x * sway_phase_len * 1.123 + TIME * sway_speed) * strength;
	VERTEX.y += sin(VERTEX.y * sway_phase_len + TIME * sway_speed * 1.12412) * strength;
	VERTEX.z += sin(VERTEX.z * sway_phase_len * 0.9123 + TIME * sway_speed * 1.3123) * strength;
}
void fragment() {
 
	vec4 albedo_tex = texture(texture_albedo, UV * uv) * COLOR;
	vec4 normal_tex = texture(texture_albedo, UV);
	ALBEDO = albedo_tex.rgb;
	ALPHA = albedo_tex.a;
	ALBEDO.g *= green_multiplier;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	SPECULAR = specular;
	ALPHA_SCISSOR_THRESHOLD = 0.5;
}
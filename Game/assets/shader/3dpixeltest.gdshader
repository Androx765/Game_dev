shader_type spatial;
render_mode unshaded;

uniform int pixel_size;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

void vertex() {
	POSITION = vec4(VERTEX, 1.0);
}

void fragment() {
	// Called for every pixel the material is visible on.
	float x = float (int(FRAGCOORD.x) % pixel_size);
	float y = float (int(FRAGCOORD.y) % pixel_size);
	
	x = FRAGCOORD.x + floor(float(pixel_size)/ 2.0) - x;
	y = FRAGCOORD.y + floor(float(pixel_size)/ 2.0) - y;
	
	ALBEDO = texture(SCREEN_TEXTURE, vec2(x, y) / VIEWPORT_SIZE).xyz;
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

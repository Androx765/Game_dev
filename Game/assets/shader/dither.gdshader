shader_type spatial;
render_mode unshaded;


uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;

uniform float spread = 0.1;
uniform float color_count = 1.0;
uniform int bayer_level = 1; //0 -> 2x2, 1 -> 4x4, 2 -> 8x8

//Threshold-maps (https://en.wikipedia.org/wiki/Ordered_dithering)

const int bayer2[4] = 
	{0, 2, 
	3, 1};

const int bayer4[16] =
	{0, 8, 2, 10, 
	12, 4, 14, 6, 
	3, 11, 1, 9, 
	15, 7, 13, 5};

const int bayer8[64] =
	{0, 32, 8, 40, 2, 34, 10, 42,
	48, 16, 56, 24, 50, 18, 58, 26,  
	12, 44,  4, 36, 14, 46,  6, 38, 
	60, 28, 52, 20, 62, 30, 54, 22,  
	3, 35, 11, 43,  1, 33,  9, 41,  
	51, 19, 59, 27, 49, 17, 57, 25, 
	15, 47,  7, 39, 13, 45,  5, 37, 
	63, 31, 55, 23, 61, 29, 53, 21};

void vertex() {
	//https://docs.godotengine.org/en/stable/tutorials/shaders/advanced_postprocessing.html#full-screen-quad
	POSITION = vec4(VERTEX, 1.0);
}

float getBayer2(int x, int y) {
	return float(bayer2[(x % 2) + (y % 2) * 2]) * (1.0 / 4.0) - 0.5;
}

float getBayer4(int x, int y) {
	return float(bayer4[(x % 4) + (y % 4) * 4]) * (1.0 / 16.0) - 0.5;
}

float getBayer8(int x, int y) {
	return float(bayer8[(x % 8) + (y % 8) * 8]) * (1.0 / 64.0) - 0.5;
}

// Called for every pixel the material is visible on.
void fragment() {
	vec2 uv = SCREEN_UV; //Screen-UV-Koordinate für das aktuelle Pixel.
	vec2 size = VIEWPORT_SIZE; //Größe des Viewports (in Pixeln).
	
	int x = int(uv.x * size.x);
	int y = int(uv.y * size.y);
	
	float bayerValues[3] = {0.0, 0.0, 0.0};
	bayerValues[0] = getBayer2(x, y);
	bayerValues[1] = getBayer4(x, y);
	bayerValues[2] = getBayer8(x, y);
	
	vec3 original = texture(SCREEN_TEXTURE, uv).rgb;
	vec3 dithered = original + spread * bayerValues[bayer_level];

	//dithered = clamp(dithered, 0.0, 1.0); //ensure values are within 0, 1.

	vec3 newColor;
	newColor.r = floor(dithered.r * (color_count - 1.0) + 0.5) / (color_count - 1.0);
	newColor.g = floor(dithered.g * (color_count - 1.0) + 0.5) / (color_count - 1.0);
	newColor.b = floor(dithered.b * (color_count - 1.0) + 0.5) / (color_count - 1.0);

	ALBEDO = newColor;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}

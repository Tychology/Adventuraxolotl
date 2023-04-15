shader_type canvas_item;

uniform bool invert_mask = false; 

void fragment() {
	COLOR = texture(SCREEN_TEXTURE,SCREEN_UV);
	float alpha_total; 
}

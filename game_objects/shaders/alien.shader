shader_type canvas_item;

uniform int hit : hint_range(0,1);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	COLOR.r += 0.8;
}
/// @description Insert description here
// You can write your code in this editor

if (state != STATE.AGGRO)
	draw_self();
else
{
	// Shake Intensity
	var _int = 3;
	
	// Shake violently
	draw_sprite_ext(sprite_index, image_index,
					x + irandom_range(-_int, _int),
					y + irandom_range(-_int, _int),
					image_xscale, image_yscale,
					0, c_white, 1);
}
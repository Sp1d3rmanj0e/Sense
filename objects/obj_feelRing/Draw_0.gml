/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(fade);
draw_sprite_ext(sprite_index, image_index,
		    x + irandom_range(-shakeIntensity, shakeIntensity),
			y + irandom_range(-shakeIntensity, shakeIntensity),
			1, 1, image_angle, c_white, image_alpha);
draw_set_alpha(1);
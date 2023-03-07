/// @description Insert description here
// You can write your code in this editor

draw_self();

// Draw the little roofing piece over the doors
draw_sprite_ext(spr_door_ceiling, 0, x, y, 
			    image_xscale, image_yscale, 
				image_angle, c_white, 1);
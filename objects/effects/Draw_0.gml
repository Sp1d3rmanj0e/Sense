/// @description Insert description here
// You can write your code in this editor
if (sanityDemon)
{
	// Get mid of camera y
	var _camY = camera_get_view_y(view_camera[0]);
	var _camH = camera_get_view_height(view_camera[0]);

	draw_sprite_ext(spr_sanityDemon,0,xLoc+192,_camY + _camH + 128, 16, 16, -25, c_blue, 0.5);
	draw_sprite_ext(spr_sanityDemon,0,xLoc-192,_camY + _camH + 128, 16, 16, 25, c_yellow, 0.5);
	draw_sprite_ext(spr_sanityDemon,0,xLoc,   _camY + _camH + 128, 16, 16, 0, c_red, 0.75);
	xLoc+= 15;
	
	if (xLoc > room_width*2) sanityDemon = false;
}
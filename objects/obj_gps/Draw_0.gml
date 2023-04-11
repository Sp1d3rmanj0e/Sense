/// @description Draw self and arrow pointing

draw_self();

// Draw an arrow to point towards enemy
if (state == GPS.ENEMY)
{
	draw_sprite_ext(spr_gpsArrowTmp, 0, obj_player.x, obj_player.y+40, 1, 1, 
					point_direction(obj_player.x, obj_player.y, x, y) - 90, c_white, 1);
}
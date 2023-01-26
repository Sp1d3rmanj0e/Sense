/// @description Insert description here
// You can write your code in this editor

// Get tilemap
var _tilemap = layer_tilemap_get_id("walls");

// Get theoretical player hitbox
var x1, x2, y1, y2;
x1 = obj_player.bbox_left;
x2 = obj_player.bbox_right;
y1 = obj_player.bbox_bottom;
y2 = obj_player.bbox_top - 48;

// Move until touching player or out of bounds
if (place_meeting(x,y,obj_player))
{
	// Apply stun
	obj_player.alarm[0] = stunTime;
	obj_player.state = PSTATE.STUN;
	//instance_destroy();
}
else if (tilemap_get_at_pixel(_tilemap,x,y) != 0)
{
	instance_destroy();
}
else
{
	x += lengthdir_x(bSpeed, image_angle);
	y += lengthdir_y(bSpeed, image_angle);
}
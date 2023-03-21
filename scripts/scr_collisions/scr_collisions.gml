// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// tilemap collisions
function collisions()
{
	// Collisions - Credit to Shaun Spalding
	var bbox_side;

	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top) != 0 || (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom) != 0))
	{
		if (hsp > 0) x = x - (x mod WORLD.CELL_SIZE) + (WORLD.CELL_SIZE - 1) - (bbox_right - x);
		else x = x - (x mod WORLD.CELL_SIZE) - (bbox_left - x);
		hsp = 0;
	}

	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) != 0 || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp) != 0))
	{
		if (vsp > 0) y = y - (y mod WORLD.CELL_SIZE) + (WORLD.CELL_SIZE - 1) - (bbox_bottom - y);
		else y = y - (y mod WORLD.CELL_SIZE) - (bbox_top - y);
		vsp = 0;
	}

	object_collisions(obj_furniture);

	x += hsp;
	y += vsp;
}

// Object collisions
function object_collisions(_object)
{
	// Stores the id of the collided object
	var _id = noone;
	
	// Check if there is an object in the way (horizontal)
	_id = instance_place(x + hsp, y, _object);
	if ((_id != noone) && (_id.solid))
	{
		hsp = 0;
	}
	
	// Check if there is an object in the way (vertical)
	_id = instance_place(x, y + vsp, _object);
	if ((_id != noone) && (_id.solid))
	{
		while(!place_meeting(x, y+sign(vsp), _object))
			y+=sign(vsp);
		
		vsp = 0;
	}
}
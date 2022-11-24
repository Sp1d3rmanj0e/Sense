// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collisions(_hsp, _vsp)
{
	// Collisions - Credit to Shaun Spalding
	var bbox_side;

	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top) != 0 || (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom) != 0))
	{
		if (hsp > 0) x = x - (x mod WORLD.TILE_SIZE) + (WORLD.TILE_SIZE - 1) - (bbox_right - x);
		else x = x - (x mod WORLD.TILE_SIZE) - (bbox_left - x);
		hsp = 0;
	}

	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+vsp) != 0 || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+vsp) != 0))
	{
		if (vsp > 0) y = y - (y mod WORLD.TILE_SIZE) + (WORLD.TILE_SIZE - 1) - (bbox_bottom - y);
		else y = y - (y mod WORLD.TILE_SIZE) - (bbox_top - y);
		vsp = 0;
	}

	x += hsp;
	y += vsp;
}
/// @description Interaction with environment

// Check if ghost is going through a wall
// and that goo isn't already there
if (tilemap_get_at_pixel(tilemap,x,y) != 0)
&& (!place_meeting(x,y,obj_residue) 
&& (gooTimer = -1))
{	
	canPlace = true;
}

if (canPlace) && (tilemap_get_at_pixel(tilemap, x, y) == 0)
{
	// Make x and y fit the tile grid
	var tileSize = WORLD.CELL_SIZE;
	var _x = ceil(x / tileSize) * tileSize - 32;
	var _y = ceil(y / tileSize) * tileSize - 32;
	
	// Spawn goo
	with(instance_create_layer(_x, _y, "Structures", obj_residue))
	{
		// Tell the residue that it is actually goop
		realResidue = spr_resGoo;
		
		// Point it in the direction that it came from
		// (spills onto the walls)
		image_angle = other.dir;
	}
	gooTimer = gooTime * room_speed;
	
	// Reset canPlace
	canPlace = false;
}

if (gooTimer > 0) gooTimer--;
else gooTimer = -1;
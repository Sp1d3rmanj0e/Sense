/// @description Interaction with environment

// Check if ghost is going through a wall
// and that goo isn't already there
if (tilemap_get_at_pixel(tilemap,x,y) != 0)
&& (!place_meeting(x,y,obj_goo) 
&& (gooTimer = -1))
{
	// Make x and y fit the tile grid
	var tileSize = WORLD.CELL_SIZE;
	var _x = round(x / tileSize) * tileSize - 32;
	var _y = round(y / tileSize) * tileSize - 32;
	
	// Spawn goo
	instance_create_layer(_x,_y,"Senses", obj_goo);
	gooTimer = gooTime * room_speed;
}

if (gooTimer > 0) gooTimer--;
else gooTimer = -1;
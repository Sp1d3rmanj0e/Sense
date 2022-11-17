/// @description Create a path

// Import world info
var tile_size = WORLD.TILE_SIZE;

// Get spawn and objective locations (anywhere on the map)
randomize();
var sides = ["left","right","top","bottom"];

for (var i = 0; i < 2; i++)
{
	switch (sides[irandom(3)])
	{
		case "left":
			x = tile_size/2;
			y = irandom_range(tile_size, roomHeight - tile_size);
		break;
		case "right":
			x = roomWidth - tile_size/2;
			y = irandom_range(tile_size, roomHeight - tile_size);
		break;
		case "top":
			x = irandom_range(tile_size, roomWidth - tile_size);
			y = tile_size/2;
		break;
		case "bottom":
			x = irandom_range(tile_size, roomWidth - tile_size);
			y = roomHeight - tile_size/2;
		break;
	}
	
	// Puts x and y on a 64 grid (multiple of 64)
	x = x - (x mod 32);
	y = y - (y mod 32);
	
	// Setting location coords
	if (i == 0) spawnLocation = [x,y]; // The first loop gets the spawn location
	else objectiveLocation = [x,y]; // The second loop gets the objective location
}

instance_create_layer(spawnLocation[0],spawnLocation[1],"Instances",obj_player);
instance_create_layer(objectiveLocation[0],objectiveLocation[1],"Instances",obj_player);
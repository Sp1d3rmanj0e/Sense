/// @description Decrement sanity

// Decrement sanity to 0
if (sanity > 0) sanity--;

// Summon sanity demon if time ran out
else if (!instance_exists(obj_sanityDemon))
{
	instance_create_layer(startX, startY, "Instances", obj_sanityDemon);
}

// In decimal form - 1 to 0
var _percentInsane = sanity/startSanity;

// Gets the num of sanity entities based on current sanity
spawnCap = (0.5- _percentInsane) * maxSpawns * 0.5; // spawnCap is amt of entities at 0 sanity

// Change player heart rate based on _percentInsane
if (instance_exists(obj_gui))
{
	obj_gui.beatSpawnTime = _percentInsane * 90 + 30; // 30 is fastest, 120 is slowest
}
if (instance_number(obj_sanitySpawn) < spawnCap)
{
	var _x = -1;
	var _y = -1;
	
	while(_x == -1 && _y == -1)
	{
		var _width = ds_grid_width(wallLoc);
		var _height = ds_grid_height(wallLoc);
		
		var _randX = irandom(_width);
		var _randY = irandom(_height);
		
		if (ds_grid_get(wallLoc, _randX, _randY) == 1)
		{
			_x = _randX * WORLD.CELL_SIZE;
			_y = _randY * WORLD.CELL_SIZE;
		}
	}
	instance_create_layer(_x, _y, "Effects", obj_sanitySpawn);
}
/// @description Insert description here
// You can write your code in this editor

sanity = 100; // Overwritten in Room Start Event
howManyEyesOnMap = 0; // Increases as sanity decreases
maxEyeSpawns = 120; // Max total number of eyeballs to spawn on the map

// Create wall location grid
var gridX = ceil(room_width / WORLD.CELL_SIZE);
var gridY = ceil(room_height / WORLD.CELL_SIZE);

wallLoc = ds_grid_create(gridX, gridY);

var _tilemap = layer_tilemap_get_id("walls");
var _tileSize = WORLD.CELL_SIZE;

// Add all wall locations to grid
for (var _x = 0; _x < gridX; _x++)
{
	for (var _y = 0; _y < gridY; _y++)
	{
		if (tilemap_get_at_pixel(_tilemap, _x * _tileSize, _y * _tileSize))
			ds_grid_set(wallLoc,_x,_y,1);
	}
}
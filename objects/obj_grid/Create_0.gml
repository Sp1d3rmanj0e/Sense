/// @description Insert description here
// You can write your code in this editor

// Create the grid
var hcells = room_width div WORLD.CELL_SIZE;
var vcells = room_height div WORLD.CELL_SIZE;

// Create grid for non-Ghosts
global.grid = mp_grid_create(0, 0, hcells, vcells, WORLD.CELL_SIZE, WORLD.CELL_SIZE);

// Create grid for Ghosts
global.ghostGrid = mp_grid_create(0, 0, hcells, vcells, WORLD.CELL_SIZE, WORLD.CELL_SIZE);

// Add walls to the grid
var tilemap = layer_tilemap_get_id("walls");

var cell_size = WORLD.CELL_SIZE;
var w = room_width / cell_size;
var h = room_height / cell_size;

for (var i = 0; i < w; i++) {
for (var j = 0; j < h; j++) {
    if (tilemap_get_at_pixel(tilemap, i * cell_size, j * cell_size) > 0)
    {
		// Add tiles for any present wall
        mp_grid_add_cell(global.grid, i, j);
		
		// Sometimes add walls for ghost wall set
		if (irandom(9) < 8) // 90% chance a wall will exist
		{
			mp_grid_add_cell(global.ghostGrid, i, j);
		}
    }
}}
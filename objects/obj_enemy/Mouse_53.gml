/// @description Insert description here
// You can write your code in this editor

var tile_size = WORLD.TILE_SIZE;

var _mx = (mouse_x div tile_size) * tile_size + (tile_size/2);
var _my = (mouse_y div tile_size) * tile_size + (tile_size/2);

if (mp_grid_path(global.grid, path, x, y, _mx, _my, 1))
{
	path_start(path, 4, path_action_stop, false);
}
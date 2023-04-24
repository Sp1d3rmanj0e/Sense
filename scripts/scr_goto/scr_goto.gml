
/**
 * _path - path to use
 * _x - x location to go to
 * _y - y location to go to
 * _speed - travel speed
 */
function goto(_path, _x, _y, _speed, _grid)
{
	// Get tile size
	var tile_size = WORLD.CELL_SIZE;
	
	// Lock location to the center of the grid squares
	var _nx = (_x div tile_size) * tile_size + (tile_size/2);
	var _ny = (_y div tile_size) * tile_size + (tile_size/2);
	
	// Do the path if possible
	if (mp_grid_path(_grid, _path, x, y, _nx, _ny, 1))
	{
		path_start(_path, _speed, path_action_stop, false);
		return true;
	}
	// If the path is impossible
	else
	{
		//log("Path is impossible");
		return false;
	}
}
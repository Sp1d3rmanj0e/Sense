// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collision_line_tile(_x1, _y1, _x2, _y2, _tilemap, _viewDist)
{
	// Get useful information
	var _sightAngle = point_direction(_x1, _y1, _x2, _y2);
	var ldX = lengthdir_x(1, _sightAngle);
	var ldY = lengthdir_y(1, _sightAngle);
	
	// Set checker variables
	var _vX = _x1;
	var _vY = _y1;
	

	for (var i = 0; i < (_viewDist); i++)
	{
		if (tilemap_get_at_pixel(_tilemap, _vX, _vY) != 0)
		return false;
		
		_vX += ldX;
		_vY += ldY;
	}
	
	// If no walls were detected
	return true;
}
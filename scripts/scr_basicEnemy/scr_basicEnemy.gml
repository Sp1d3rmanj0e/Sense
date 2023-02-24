// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Contains basic enemy stuff that can be added or omitted using the function (or not)

// Enemy has natural sight mechanics
// Sight not obstructed by walls or doors, return true
function scr_sight(_viewConeDeg, _viewDist, _dir)
{
	// Initialize temp vars
	var _visWithinCone, _visWithinDist, _visNotWallBlocked = false, _playerDir;

	// Check to see if player is within line of sight (and conditions are met)
	_playerDir = point_direction(x, y, obj_player.x, obj_player.y); // Gets direction of player
	
	_visWithinCone = (abs(_dir - _playerDir) < _viewConeDeg)
				   ||(abs((_dir+360) - _playerDir) < _viewConeDeg); // Ensures that player is within FOV
	
	_visWithinDist = (distance_to_object(obj_player) < _viewDist); // Ensures that player is within view dist

	// Draw a line to make sure los does not go through walls
	if (_visWithinCone && _visWithinDist) // Only activates if less resource intensive methods have been met

	// Checks if los intercepts with a tilemap wall
	// True = No walls blocking LOS to player
	// False = Walls blocking LOS to player
	_visNotWallBlocked = (collision_line_tile(x, y, obj_player.x, obj_player.y, 
											  tilemap, distance_to_object(obj_player)));
											  
	return _visNotWallBlocked;
}

function path_cancel()
{
	path_end();
	path_position = 1;
}
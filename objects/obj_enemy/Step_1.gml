/// @description Insert description here
// You can write your code in this editor

// Look in the direction of motion (if not moving)
if ((prevX - x) + (prevY - y) != 0) dir = point_direction(x, y, prevX, prevY);
image_angle = dir + 90;

// Set new previous locations
prevX = x;
prevY = y;

// Initialize temp vars
var _visWithinCone, _visWithinDist, _visNotWallBlocked = false, _playerDir;

// Check to see if player is within line of sight (and conditions are met)
_playerDir = abs(point_direction(x, y, obj_player.x, obj_player.y) - 180);
_visWithinCone = (abs(dir - _playerDir) < viewConeDeg);
_visWithinDist = (distance_to_object(obj_player) < maxSightDist);

// Draw a line to make sure los does not go through walls
if (_visWithinCone && _visWithinDist) // Only activates if less resource intensive methods have been met
_visNotWallBlocked = (collision_line_tile(x, y, obj_player.x, obj_player.y, 
										  tilemap, distance_to_object(obj_player)));
/*
 * visWithinCone - Makes sure the view is within a certain cone 
 * from the facing direction
 * visWithinDist - Makes sure the player is close enough to be seen
 * visNotWallBlocked - Makes sure the player is not being seen through walls
*/

// Activates aggro if the player is seen
if (_visNotWallBlocked) state = STATE.CHASE;


// State machine
switch(state)
{
	case STATE.WANDER:
		// Assign task a variable if there is none
		if (task == -1) task = 1;
			
		// Get a path to follow
		if (newPath == true)
		{
			// Only allows one tick to go through
			newPath = false;
				
			// Get the tile size
			var tile_size = WORLD.TILE_SIZE;
			
			// Get cell width and height
			var cw = room_width div tile_size;
			var ch = room_height div tile_size;
				
			// Find an open space to travel to
			while(true)
			{
				// Choose a random spot to go to
				var gotoX = irandom_range(1, cw - 1) * tile_size;
				var gotoY = irandom_range(1, ch - 1) * tile_size;
					
				// Make sure that random location isn't in a wall
				if (goto(path, gotoX, gotoY, eSpeed))
				{
					// Break the while loop and continue the code
					exit;
				}
			}
		}

		// Once the path ends, idle, then get a new path
		if (path_position == 1)
		{
			// Idle for a few seconds
			if (idleTimer == -1) idleTimer = idleTime * room_speed;
				
			// Countdown the timer
			if (idleTimer > 0) 
			{
				idleTimer--;
			}
				
			// Start new path after timer ends
			// Reset the timer
			else 
			{
				newPath = true;
				idleTimer = -1;
			}
		}
		
		// Search for the player to aggro to
		
		break;
		
	case STATE.CHASE:
		
		break;
}
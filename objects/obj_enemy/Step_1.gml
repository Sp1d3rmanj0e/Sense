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

// Checks if los intercepts with a tilemap wall or any object labeled with losObstruction
// True = No walls blocking LOS to player
// False = Walls blocking LOS to player
_visNotWallBlocked = (collision_line_tile(x, y, obj_player.x, obj_player.y, 
										  tilemap, distance_to_object(obj_player)));
/*
 * visWithinCone - Makes sure the view is within a certain cone 
 * from the facing direction
 * visWithinDist - Makes sure the player is close enough to be seen
 * visNotWallBlocked - Makes sure the player is not being seen through walls
*/

// Activates aggro if the player is seen
/*
if (_visNotWallBlocked || place_meeting(x, y, obj_player)) 
{
	state = STATE.CHASE; // Switches to chase state
}
else
{
	state = STATE.WANDER; // Switches to wander state
}
*/

// State machine
switch(state)
{
	case STATE.WANDER:
	
		// Get a path to follow
		if (newPath == true)
		{
			
			// Only allows one tick to go through
			newPath = false;
				
			// Get the tile size
			var tile_size = WORLD.CELL_SIZE;
			
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
		if (_visNotWallBlocked || place_meeting(x, y, obj_player))
		{
			// Reset vars
			idleTimer = -1;
			newPath = false;
			
			// Set the state to chase
			state = STATE.CHASE;
		}
		break;
		
	case STATE.CHASE:
		
		// Forget the player if not seen for x amt. time
		if (_visNotWallBlocked || place_meeting(x, y, obj_player)) // If the player is seen
		{
			// Activate timer while player is visually seen
			enemyMemoryTimer = enemyMemoryTime * room_speed;
		}
		else // If the player is not seen
		{
			// Count down timer
			if (enemyMemoryTimer > 0) enemyMemoryTimer--;
			else 
			{
				// Reset timer
				enemyMemoryTimer = -1;
				
				// Switch to wander state
				state = STATE.WANDER;
				exit;
			}
		}
		
		// Delay timer before the enemy will find a new path towards the player
		if (playerChaseTimer == -1) playerChaseTimer = playerChaseTime * room_speed;
			
		// Countdown the timer
		if (playerChaseTimer > 0) playerChaseTimer--;
		// Reset the timer & refresh pathfinding towards player
		else 
		{
			playerChaseTimer = -1;
			goto(path, obj_player.x, obj_player.y, eSpeed);
		}
		break;
}
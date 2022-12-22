/// @description Insert description here
// You can write your code in this editor

// Get direction of motion
if ((prevX - x) != 0 || (prevY - y) != 0) dir = point_direction(prevX, prevY, x, y);
/**
 * 0   - right
 * 180 - left
 * 270 - down
 * 90  - up
 */

// Set new previous locations
prevX = x;
prevY = y;

// Checks if enemy can see the player
var _canSee = scr_sight(viewConeDeg, maxViewDist, dir);
show_debug_message("Can see: " + string(_canSee));
// State machine
switch(state)
{
	case STATE.WANDER:
		#region code
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
		if (_canSee || place_meeting(x, y, obj_player))
		{
			// Reset vars
			idleTimer = -1;
			newPath = false;
			
			// Set the state to chase
			state = STATE.CHASE;
		}
		#endregion code
		break;
		
	case STATE.CHASE:
		#region code
		// Forget the player if not seen for x amt. time
		if (_canSee || place_meeting(x, y, obj_player)) // If the player is seen
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
		#endregion code
		break;
}
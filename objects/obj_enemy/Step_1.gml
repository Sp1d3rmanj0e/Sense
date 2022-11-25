/// @description Insert description here
// You can write your code in this editor

// Look in the direction of motion (if not moving)
if ((prevX - x) + (prevY - y) != 0) dir = point_direction(x, y, prevX, prevY) + 90;
image_angle = dir;

// Set new previous locations
prevX = x;
prevY = y;

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
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mimic()
{

// State machine
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
		if (goto(path, gotoX, gotoY, eSpeed, global.grid))
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
#endregion code

}
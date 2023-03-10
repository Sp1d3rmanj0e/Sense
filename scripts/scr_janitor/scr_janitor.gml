// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_janitor()
{

// Wandering
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
		var gotoX, gotoY;
		
		// Check if there is any garbage on the map
		if (instance_number(obj_residue) > 0)
		{
			// Create garbage array
			var _garbage = [];
			
			// Get number of garbage pieces on the map
			var  _numGarbage = instance_number(obj_residue);
		
			// Look for garbage to clean up
			for (var i = 0; i < _numGarbage; ++i;)
			{
			    _garbage[i] = instance_find(obj_residue,i);
			}
			
			// Choose a random piece of garbage and get ID
			targetId = _garbage[irandom(_numGarbage-1)];
			
			// Get x and y from ID and go there
			var _x = targetId.x;
			var _y = targetId.y;
			
			gotoX = _x;
			gotoY = _y;
			
			// Choose a random spot to go to
			gotoX = irandom_range(1, cw - 1) * tile_size;
			gotoY = irandom_range(1, ch - 1) * tile_size;
			
		}
		else
		{
			// Choose a random spot to go to
			gotoX = irandom_range(1, cw - 1) * tile_size;
			gotoY = irandom_range(1, ch - 1) * tile_size;
		}
		
		testX = gotoX;
		testY = gotoY;
		
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
	// Destroy the garbage
	if (instance_exists(targetId)) instance_destroy(targetId);
	
	newPath = true;
}
#endregion code

}
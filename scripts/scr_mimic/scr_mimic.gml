// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_mimic()
{
	
var _playerMoving = (obj_player.moveX != 0 || obj_player.moveY != 0);
var _canHear = (distance_to_object(obj_player) < maxViewDist && _playerMoving);

// Aggroing code
/*
* If player is within radius AND 
* player is making noise for more 
* than 1/2 second, switch to aggro
*/
	
// Increment anger if people moving within range, decrement if not
if (_canHear && anger < maxAnger) && (sprite_index != spr_mimicSpirit)
{
	anger++;
}
else if (anger > 0)
{
	anger-= 0.7;
}
	
if (anger >= maxAnger)
{
	state = STATE.CHASE;
}

// State machine
if (state == STATE.WANDER)
{
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
			
		// If in pixie form, immediately start moving again
		if (animScript == defaultAnimScript)
		{
			idleTimer = 0;
		}
			
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
	
	// Transform into nearby enemies
	if (distance_to_object(enemies) < transformDist)
	{
		show_debug_message("copying new enemy");
		// Start the transformation timer
		mimicFormTimer = mimicFormTime * room_speed;
	
		// Get ID of copied enemy
		instance_deactivate_object(id);
		copyID = instance_nearest(x,y,enemies);
		instance_activate_object(id);
	
		// Take enemy's behavior
		//stateScript = copyID.stateScript;
	
		// Take enemy's sprite
		animScript = copyID.animScript;
	}
	
	#endregion code
}
else if (state == STATE.CHASE)
{
	#region code
	
	if (anger <= 0)
	{
		// Stop current path
		goto(path, x, y, eSpeed, global.grid);	
			
		// Switch to wander state
		state = STATE.WANDER;
		exit;
	}
		
	// Delay timer before the enemy will find a new path towards the player
	if (playerChaseTimer == -1) playerChaseTimer = playerChaseTime * room_speed;
			
	// Countdown the timer
	if (playerChaseTimer > 0) playerChaseTimer--;
	// Reset the timer & refresh pathfinding towards player
	else 
	{
		playerChaseTimer = -1;
		goto(path, obj_player.x, obj_player.y, eSpeed, global.grid);
	}
	#endregion code
}

// Passive stuff



// Decrement timer
if (mimicFormTimer > 0) mimicFormTimer--;
else 
{
	// Transform back
	mimicFormTimer = -1;
	animScript = defaultAnimScript;
}

// If close to player, transform into demon
if ((_canHear && anger >= maxAnger ) || place_meeting(x,y,obj_player)) && (sprite_index != spr_mimicSpirit)
{
	state = STATE.CHASE;
	animScript = defaultAnimScript;
	
	// Set transform timer to 0
	mimicFormTimer = -1;
}

}
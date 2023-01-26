// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eyeball()
{

// Checks if enemy can see the player
var _canSee = scr_sight(viewConeDeg, maxViewDist, dir);

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
		
		// Search for the player to aggro to
		if (_canSee || place_meeting(x, y, obj_player))
		{
			// Reset vars
			idleTimer = -1;
			newPath = false;
			
			// Set the state to chase
			state = STATE.AGGRO;
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
			goto(path, obj_player.x, obj_player.y, eSpeed, global.grid);
		}
		
		// Shoot eyebeam every couple seconds
		/*
		if (eyebeamTimer > 0) eyebeamTimer--;
		else 
		{
			eyebeamTimer = eyebeamTime;
			
			// Create eyebeam
			with(instance_create_layer(x,y,"Instances",obj_eyebeam))
			{
				image_angle = point_direction(x,y, obj_player.x, obj_player.y);
			}
		}
		*/
		
		#endregion code
		break;
	case STATE.AGGRO:
		#region code
		// Freeze in place (cancel path)
		path_end();
		path_position = 1; // To activate idle timer
		
		// Always check to see if the eyeball can see you
		if (_canSee || place_meeting(x, y, obj_player))
		{
			// Start timer till chase mode
			if (angryTimer == -1) angryTimer = angryTime;
			else angryTimer--;
			
			// If the timer reaches 0, go into chase mode
			if (angryTimer <= 0)
			{
				state = STATE.CHASE;
				angryTimer = -1;
			}
		}
		else // LOS was broken
		{
			angryTimer = -1;
			state = STATE.WANDER;
		}
		
		#endregion
		break;
}

}
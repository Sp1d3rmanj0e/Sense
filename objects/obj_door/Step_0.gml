/// @description Door Opening

#region see if able to open the door
// Get cell size to local var
var cellSize = WORLD.CELL_SIZE;

// Changeable vars
var checkLength = 0.4; // how many tiles out from the door tile to check for a player
var checkWidth  = 1; // how wide you want the check to be (in tiles also)

// Translate to creating the rectangle
// Compenstates for the origin being in the center
checkLength = checkLength * cellSize + cellSize / 2;
checkWidth  = checkWidth  * cellSize/2 - 1;

// Check if entity is near
if (distance_to_object(obj_player) < checkLength) && (!place_meeting(x, y, obj_player))
{
	
	// The check shape is similar to a "+"
	if (collision_rectangle(x - checkLength, y - checkWidth, x + checkLength, y + checkWidth, 
							obj_player, false, false) != noone) // Horizontal (-)
	|| (collision_rectangle(x - checkWidth, y - checkLength, x + checkWidth, y + checkLength,
							obj_player, false, false) != noone) // Vertical   (|)
	{
		openable = 1; // Open
	}
	else
	{
		openable = 0; // Closed
	}
}
else
{
	openable = 0; // Closed
}
#endregion
// Returns openable T/F

#region interaction with the door
if (instance_exists(obj_player) && obj_player.keyInteract && openable && (sprite_index != spr_hedge_door_front_gold && sprite_index != spr_hedge_door_left_gold))
{
	// If interact delay is over
	if (interactDelayTimer == -1)
	{
		
		// Close or open door
		doorOpen = !doorOpen;
		
		// Resaet delay timer
		interactDelayTimer = interactDelay * room_speed;
		event_user(0); // Put or remove tile block
		show_debug_message("door open is: " + string(doorOpen));
	}
}

// Work timers
if (interactDelayTimer > 0) interactDelayTimer--;
else interactDelayTimer = -1;
#endregion
// If [interact] pressed near a door, open/close it
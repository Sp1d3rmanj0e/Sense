/// @description Camera follow and functions

// Inherit the parent event
event_inherited();

// Functions for the gadget
function dash()
{
	
}

/**
 * Player will press the gadget button and then
 * gets the ability to throw a sticky GPS at a nearby enemy
 * the gps will then tell you exactly where it is on the map
 * via an arrow.
 * If the player misses their shot, they can pick it up again.
 */
function decoy()
{
	
}

function gps()
{
	// Check if the gadget is already activated
	if (!instance_exists(obj_gps)) // Not activated
	{
		// Create the GPS to be shot
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_gps);
	}
	else // Activated
	{
		// Recall the GPS (Player decided not to use it)
		instance_destroy(obj_gps);
	}
}

/**
 * Player will press the button once to place
 * a teleporter pylon.  After they press it a
 * second time, they will teleport back to that
 * location.
 */
function teleport()
{
	with(obj_player)
	{
		// Create a teleporter if none exist
		if (!instance_exists(obj_teleporter)) {
			instance_create_layer(x,y,"Instances",obj_teleporter);
		}
		else // Otherwise, teleport back to teleporter
		{
			x = obj_teleporter.x;
			y = obj_teleporter.y;
			instance_destroy(obj_teleporter);
		}
	}
}

function thermal()
{
	
}
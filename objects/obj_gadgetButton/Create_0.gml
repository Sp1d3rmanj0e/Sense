/// @description Camera follow and functions

// Inherit the parent event
event_inherited();

// Functions for the gadget
function echo()
{
	
}

function nightvis()
{
	
}

function tase()
{
	
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


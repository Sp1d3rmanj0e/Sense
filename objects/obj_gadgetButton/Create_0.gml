/// @description Camera follow and functions

// Inherit the parent event
event_inherited();

// Get the maximum number of uses for the selected gadget
numGadgetUsesLeft = 0;
switch(obj_player.curGadget)
{
	case GADGET.DASH:		numGadgetUsesLeft = 5; break;
	case GADGET.GPS:		numGadgetUsesLeft = 1; break;
	case GADGET.LURE:		numGadgetUsesLeft = 2; break;
	case GADGET.TELEPORT:	numGadgetUsesLeft = 3; break;
	case GADGET.THERMAL:	numGadgetUsesLeft = 3; break;
}

// Stores the original value for the uses bar in the GUI object
startingGadgetUses = numGadgetUsesLeft;

// Functions for the gadget
function dash()
{
	// How far the player will go if unobstructed
	//var _dashLen = 5 * WORLD.CELL_SIZE;
	//var _stunTime = 3 * room_speed;
	
	if (!instance_exists(obj_dash)) // Not activated
	{
		if (numGadgetUsesLeft > 0)
		{
			instance_create_layer(obj_player.x, obj_player.y, "Structures", obj_dash);
			numGadgetUsesLeft--;
		}
	}
	else // Activated
	{
		// Only cancel dash if not actively using it
		if (obj_player.state != PSTATE.DASH)
		{
			instance_destroy(obj_dash);
			numGadgetUsesLeft++;
		}
	}
	
}

/**
 * When the button is pressed, a lure is spawned.
 * The lure will attract enemies within a certain radius
 */
function lure()
{
	if (numGadgetUsesLeft > 0)
	{
		numGadgetUsesLeft--;
	
		// Destroy any existing lures
		if (instance_exists(obj_lure))
			instance_destroy(obj_lure);
	
		// Create a new lurew
		instance_create_layer(obj_player.x, obj_player.y, "Structures", obj_lure);
	}
}

/**
 * Player will press the gadget button and then
 * gets the ability to throw a sticky GPS at a nearby enemy
 * the gps will then tell you exactly where it is on the map
 * via an arrow.
 * If the player misses their shot, they can pick it up again.
 */
function gps()
{
	// Check if the gadget is already activated
	if (!instance_exists(obj_gps)) // Not activated
	{
		if (numGadgetUsesLeft > 0)
		{
			numGadgetUsesLeft--;
		
			// Create the GPS to be shot
			instance_create_layer(obj_player.x, obj_player.y, "Structures", obj_gps);
		}
	}
	else if (obj_gps.state == GPS.PLAYER)// Activated
	{
		numGadgetUsesLeft++;
		
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
	if (numGadgetUsesLeft > 0)
	{
		with(obj_player)
		{
			// Create a teleporter if none exist
			if (!instance_exists(obj_teleporter)) {
				instance_create_layer(x,y,"Structures",obj_teleporter);
			}
			else // Otherwise, teleport back to teleporter
			{
				x = obj_teleporter.x;
				y = obj_teleporter.y;
			
				audio_play_sound(snd_teleporterUsed, 1, 0);
			
				other.numGadgetUsesLeft--;
				
				image_alpha = 0;
				
				// Break the the teleporter
				instance_destroy(obj_teleporter);
			}
		}
	}
}

function thermal()
{
	audio_play_sound(snd_thermalOn, 1, 0);
	
	if (numGadgetUsesLeft > 0)
	{
		function createHeat()
		{
			var _id = instance_create_layer(x, y, "Effects", obj_heat);
			_id.followID = id;
		}
			if (!instance_exists(obj_heat))
			{
	
			with(obj_wallLight)
				createHeat();
	
			with(enemies)
				createHeat();
		}
		numGadgetUsesLeft--;
	}
	
	alarm[0] = obj_heat.uptime;
}
/// @description Insert description here
// You can write your code in this editor

// Set to fullscreen
window_set_fullscreen(true);

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Initialize player variables
playerHealth = 1;
hardcoreMode = false;
invuln = false;

// Movement Control Initialization
moveX = 0;
moveY = 0;
hsp = 0;
vsp = 0;
//walkSp = 4;
//origWalkSp = walkSp; // Save walk speed just in case

// Gadget and sense storage
curGadget = GADGET.NIGHTVIS;
curSense = SENSE.NONE;

// Sense vars
feelRad = 2 * WORLD.CELL_SIZE;
/*
feelRingTimer = -1;
feelRingTime = 1;
*/

// special vars
trashCollected = 0;

// state code
state = PSTATE.NORMAL;

// Functions
function takeDmg() // Enemy can call this when able to hurt you
{
	if (!invuln) // Only take damage if not invulnerable
	{
		// Decrease health
		playerHealth--;
	
		// Temp invulnerability
		invuln = true;
		
		// Remove speed boost and invuln after time
		alarm[1] = 2 * room_speed; // This will also activate speed boost
		
		// Restart game/round if health is 0
		if (playerHealth <= 0)
		{
			if (global.difficulty == DIFF.HARDER)
			{ // Hardcore mode (restart after one hit)
				game_restart();
			}
			else
			{ // Anything else (restart round after all lives lost)
				room_restart();
			}
		}
	}
}
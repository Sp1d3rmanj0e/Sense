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

// Camera vars
sShake = 0;

// Gadget and sense storage
curGadget = GADGET.DASH;
curSense = SENSE.NONE;

// Sense vars
feelRad = 2 * WORLD.CELL_SIZE;

// special vars
trashCollected = 0;

// state code
state = PSTATE.NORMAL;

// Depth vars
layerDepth = layer_get_depth(layer);

// Initialize player dash particles
pSystem = part_system_create_layer("Effects", false);
dashTrail = part_type_create();

// \/\/\/ Subject to change based on sprite_index at the time of activation
part_type_sprite(dashTrail, obj_player.sprite_index, true, true, false);

part_type_alpha2(dashTrail, 1, 0);
part_type_life(dashTrail, 60, 60);
part_type_blend(dashTrail, 1);
part_type_speed(dashTrail,0.1, 0.2, 0, 0);
part_type_direction(dashTrail, 0, 359, 0, 20);

// Functions
function takeDmg() // Enemy can call this when able to hurt you
{
	if (!invuln) // Only take damage if not invulnerable
	{
		// Player speed in End Step
		
		// Decrease health
		playerHealth--;
		screenShake(7);
		
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

function screenShake(_shakeInt)
{
	sShake = _shakeInt;
	alarm[2] = 0.5 * room_speed;
}
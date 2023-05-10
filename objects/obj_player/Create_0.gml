/// @description Insert description here
// You can write your code in this editor

// Set to fullscreen
window_set_fullscreen(global.fullscreen);

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
feelRad = 3 * WORLD.CELL_SIZE;

// special vars
trashCollected = 0;

// state code
state = PSTATE.NORMAL;

// Depth vars
layerDepth = layer_get_depth(layer);

// Effect timer
bloodEffectTime = 4.5 * room_speed;

// Sounds
var _footSound = getFootSound();
footsteps = create_emitter(_footSound);

// Initialize player dash particles
pSystem = part_system_create_layer("Effects", false);
dashTrail = part_type_create();

// Flash animation vars
flashColor = c_white;
flashAlpha = 0

// \/\/\/ Subject to change based on sprite_index at the time of activation
part_type_sprite(dashTrail, obj_player.sprite_index, true, true, false);

part_type_alpha2(dashTrail, 1, 0);
part_type_life(dashTrail, 15, 15);
part_type_blend(dashTrail, 1);
part_type_speed(dashTrail,0.1, 0.2, 0, 0);
part_type_direction(dashTrail, 0, 359, 0, 20);

// Functions
function takeDmg(_objectIndexOfEnemy) // Enemy can call this when able to hurt you
{
	if (!invuln) // Only take damage if not invulnerable
	{
		// Player speed in End Step
		
		// Decrease health
		playerHealth--;
		screenShake(7);
		
		// Add blood effect
		alarm[3] = bloodEffectTime;
		
		// Temp invulnerability
		invuln = true;
		
		// Remove speed boost and invuln after time
		alarm[1] = 2 * room_speed; // This will also activate speed boost
		
		// Restart game/round if health is 0
		if (playerHealth <= 0)
		{
			audio_play_sound(snd_die, 1, false);
			
			// Freeze the player where they are
			state = PSTATE.FREEZE;
			
			// Switch to death animation
			
			// Create deathScreenSpawner in the top left of the camera
			// The constructor will add the sprite of the that killed them
			// That sprite will be what the jumpscare is
			instance_create_layer(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]),
									"GUI", obj_deathScreenSpawner,
									{
										enemyThatKilledPlayer : _objectIndexOfEnemy
									});
		}
		else
		{
			audio_play_sound(snd_hurt, 1, false);
		}
	}
}

function screenShake(_shakeInt)
{
	sShake = _shakeInt;
	alarm[2] = 0.5 * room_speed;
}
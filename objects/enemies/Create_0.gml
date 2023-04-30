/// @description Insert description here
// You can write your code in this editor

var _footNoise = get_enemy_sound();

footsteps = create_emitter(_footNoise);

// Timer for heat residue
heatSpawnTime = 0.5;
heatSpawnTimer = -1;

// Initialize dir
dir = 0;

// Enemy Attacks
attackRange = 0.25 * WORLD.CELL_SIZE;

// Functions

function stun(_duration)
{
	stunned = true; // Stop any decisions made by the enemy
	alarm[1] = _duration; // Time until no longer stunned
	path_cancel(); // Stop any paths going
}
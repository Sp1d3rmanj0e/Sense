/// @description Insert description here
// You can write your code in this editor

// Spawn the Sound Control
if (!instance_exists(obj_soundControl))
	instance_create_layer(0, 0, "Instances", obj_soundControl);

var _footNoise = getFootSound();
//footsteps = play_sound_at(_footNoise, true);
footsteps = audio_emitter_create();
audio_emitter_falloff(
					  footsteps,
					  obj_soundControl.max_distance_to_be_heard,
					  obj_soundControl.start_dropping_off_at,
					  obj_soundControl.multiplier);
audio_play_sound_on(footsteps, _footNoise, 1, 1);
audio_emitter_position(footsteps, x, y, 0); // So that the sound doesn't lock at 0, 0

// Timer for heat residue
heatSpawnTime = 0.5;
heatSpawnTimer = -1;

// Initialize dir
dir = 0;

// Enemy Attacks
attackRange = 0.75 * WORLD.CELL_SIZE;
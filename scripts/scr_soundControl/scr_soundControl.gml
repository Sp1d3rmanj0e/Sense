// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getFootSound()
{
	var _footNoise;
	
	// Get room names
	room1 = rm_Gwall_1;
	room2 = rm_Gwall_2;
	room3 = rm_Gwall_3;
	room4 = rm_Gwall_4;
	room5 = rm_Gwall_5;

	// Initialize level footstep noises
	_footNoise = snd_FloorFootsteps;
	
	footBasement = snd_GravelFootsteps;
	footKitchen = snd_ConcreteFootsteps;
	footMain = snd_FloorFootsteps;
	footBedroom = snd_CarpetFootsteps;
	footGrass = snd_GrassFootsteps;
	footAttic = snd_FloorFootsteps;
	
	// Get footstep noise per room
	switch(room)
	{
		case room1:
			_footNoise = footMain;
			break;
		default:
			_footNoise = footMain;
	}
	
	return _footNoise;
}

function create_emitter(_footNoise)
{
	// Spawn sound control
	if (!instance_exists(obj_soundControl))
		instance_create_layer(0, 0, "Instances", obj_soundControl);
	
	// Create the emitter
	footsteps = audio_emitter_create();
	
	// Give the emitter default stats
	audio_emitter_falloff(
						  footsteps,
						  obj_soundControl.max_distance_to_be_heard,
						  obj_soundControl.start_dropping_off_at,
						  obj_soundControl.multiplier);
						  
	// Play the emitter on loop
	audio_play_sound_on(footsteps, _footNoise, 1, 1);
	
	// Place the emitter on its creator
	audio_emitter_position(footsteps, x, y, 0);
	
	// Return the emitter id
	return footsteps;
}

function update_emitter_position(_emitter)
{
	audio_emitter_position(_emitter, x, y, 0);
}

function emitter_mute(_emitter)
{
	audio_emitter_gain(footsteps, 0);
}

function emitter_unmute(_emitter)
{
	audio_emitter_gain(footsteps, 1);
}
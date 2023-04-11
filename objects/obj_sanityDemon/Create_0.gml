/// @description Insert description here
// You can write your code in this editor

// Footstep and heat
event_inherited();

// Since the sanity demon spawns later than everything else
// we need to check separately from the original code to see
// if the footstep sounds should be on or off at spawn in time
if (obj_player.curSense != SENSE.HEAR)
	audio_emitter_gain(footsteps, 0);
else
	audio_emitter_gain(footsteps, 1);

// Aggro
passive = false;

// Scripts
stateScript = scr_sanityDemon;
animScript = scr_sanityDemonA;

// State vars
stunned = false;

// Create the path
path = path_add();

// Enemy speed
eSpeed = 3;

// Start alarm loop
alarm[0] = 1;

// Activate sanity demon effect
if (!instance_exists(effects)) // Spawn effects if needed
	instance_create_layer(0, 0, "Effects", effects);
	
with(effects) 
{
	event_user(0);
}
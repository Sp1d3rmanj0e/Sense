/// @description Insert description here
// You can write your code in this editor

// Footstep and heat
event_inherited();

// Aggro
passive = false;

// Scripts
stateScript = scr_sanityDemon;
animScript = scr_sanityDemonA;

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
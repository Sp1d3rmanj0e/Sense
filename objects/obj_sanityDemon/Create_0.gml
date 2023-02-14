/// @description Insert description here
// You can write your code in this editor

// Footstep and heat
event_inherited();

// Scripts
stateScript = scr_sanityDemon;
animScript = scr_sanityDemonA;

// Create the path
path = path_add();

// Start alarm loop
alarm[0] = 1;

// Activate sanity demon effect
with(effects) 
{
	event_user(0);
}
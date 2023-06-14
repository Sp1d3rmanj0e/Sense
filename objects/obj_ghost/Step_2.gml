/// @description Animations

var _previousState = sprite_index;

script_execute(animScript);

// This checks if the ghost has switched from their current state
// (say passive) to a new state (to aggro)
if (sprite_index != _previousState)
{
	if (sprite_index = spr_ghost) // Passive
	{
		emitter_set_foot_sound(snd_ghostPassive); // Switch to passive sounds
	}
	else
	{
		emitter_set_foot_sound(snd_ghostAngry); // Switch to aggro sounds
	}
}
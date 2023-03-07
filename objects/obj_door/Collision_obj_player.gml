/// @description Insert description here
// You can write your code in this editor

// Removes the GUI
function clearScreen()
{
	instance_destroy(obj_gui);
	instance_destroy(obj_sense_button);
}

// Only activate once
if (!activated) && (roomTarget != noone)
{
	activated = true;
	
	// Destroy all enemies
	with(enemies) instance_destroy();

	// Create a cutscene
	TransitionStart(sq_loseSense, roomTarget);
	
	// Freeze player and remove UI for best view
	obj_player.state = PSTATE.FREEZE;
	clearScreen();
}


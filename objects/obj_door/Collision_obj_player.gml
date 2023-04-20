/// @description Insert description here
// You can write your code in this editor

// Removes the GUI
function clearScreen()
{
	instance_destroy(obj_gui);
	instance_destroy(obj_gadgetGUI);
	instance_destroy(obj_sense_button);
}

// Only activate once.  Start the cutscene
if (!activated) && (roomTarget != noone)
{
	var _inTheIntroCutscene = (roomTarget == rm_3_introFightCutscene) || (room == rm_4_introFightAftermath);
	
	if (roomTarget != rm_setScore) && (!_inTheIntroCutscene)
	{
		activated = true;
	
		// Destroy all enemies
		with(enemies) instance_destroy();

		// Create a cutscene
		var _mostUsedSense = getMaxSense();
		var _loseSenseSequence = getLoseSenseSequence(_mostUsedSense);
		TransitionStart(_loseSenseSequence, roomTarget);
	
		// Make player lose that sense
		deactivateSense(_mostUsedSense);
	
		// Increment level counter
		global.level++;
	
		// Freeze player and remove UI for best view
		obj_player.state = PSTATE.FREEZE;
		clearScreen();
	}
	else if (roomTarget == rm_setScore) // Transitioning to leaderboard, no need to find max used sense and stuff
	{
		activated = true;
		
		TransitionStart(sq_endScene, rm_setScore);
		
		// Freeze player and remove UI for best view
		obj_player.state = PSTATE.FREEZE;
		clearScreen();
	}
	else // In the intro cutscene stuff, just needs to go to the next room
	{
		room_goto(roomTarget);
		activated = true;
	}
}


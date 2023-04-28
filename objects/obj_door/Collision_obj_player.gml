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
	//var _inTheIntroCutscene = (roomTarget == rm_3_introFightCutscene) || (room == rm_4_introFightAftermath);
	
	activated = true;
	obj_player.state = PSTATE.FREEZE;
	clearScreen();
	with(enemies) instance_destroy(); // Destroy all enemies
	
	switch (roomTarget)
	{
	
		case rm_setScore: // End of the game
			
			// Find which cutscene to use
			if (obj_player.trashCollected == 6) // +1 Tutorial +5 levels
			{
				// Janitor ending
				TransitionStart(sq_endScene_trash, rm_setScore);
			}
			else
			{
				// Main ending
				TransitionStart(sq_endScene_main, rm_setScore);
			}
			
		break;
		
		case rm_3_introFightCutscene: // Intro cutscenes
		case rm_4_introFightAftermath:
			
			// In the intro cutscene stuff, just needs to go to the next room
			room_goto(roomTarget);
		
		break;
		
		case rm_intro: // Wimp ending
		
			TransitionStart(sq_endScene_wimp, rm_setScore);
		
		break;
		
		case rm_selGadget: // Lose sense

			if (room != rm_4_introFightAftermath) // Make sure not in cutscene at the moment
			{
				// Create a cutscene
				var _mostUsedSense = getMaxSense();
				var _loseSenseSequence = getLoseSenseSequence(_mostUsedSense);
				TransitionStart(_loseSenseSequence, roomTarget);
	
				// Make player lose that sense
				deactivateSense(_mostUsedSense);
	
				// Increment level counter
				global.level++;
			}
			else
			{
				room_goto(roomTarget);
			}
		break;
		
		default: room_goto(roomTarget);
	}
}
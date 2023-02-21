/// @description Set up player stats

/*
// Reset player health every round
switch(global.difficulty)
{
	case DIFF.EASY:
		playerHealth = 3;
		hardcoreMode = false;
		walkSp = 5;
		break;
	case DIFF.MEDIUM:
		playerHealth = 2;
		hardcoreMode = false;
		walkSp = 4;
		break;
	case DIFF.HARD:
		playerHealth = 1;
		hardcoreMode = false;
		walkSp = 3.5;
		break;
	case DIFF.HARDER:
		playerHealth = 1;
		hardcoreMode = true;
		walkSp = 3.25;
		break;
	default:
		show_debug_message("DIFFICULTY NOT SELECTED: ROOM START OF PLAYER");
}
*/

// Get stats based on the current difficulty
playerHealth = scr_diffStats(3, 2, 1, 1);
hardcoreMode = scr_diffStats(false, false, false, true);
walkSp       = scr_diffStats(5, 4, 3.5, 3.25);

origWalkSp = walkSp; // Save walk speed just in case

/* Delete later
// Get footstep noise per room
switch(room)
{
	case room1:
		footCur = footMain;
		break;
	default:
		footCur = footMain;
}
*/
var _footNoise = getFootSound();

// Play selected footstep noise
footCur = audio_play_sound(_footNoise, 1, true);
/// @description Set up player stats

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
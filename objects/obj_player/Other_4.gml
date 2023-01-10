/// @description 

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

// Get footstep noise per room
switch(room)
{
	case room1:
		footCur = footMain;
		break;
	default:
		footCur = footMain;
}

// Play selected footstep noise
audio_play_sound(footCur, 1, true);
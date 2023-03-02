/// @description Set up player stats

// Get stats based on the current difficulty
playerHealth = scr_diffStats(3, 2, 1, 1); // Reset player health every round
hardcoreMode = scr_diffStats(false, false, false, true);
walkSp       = 4;

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
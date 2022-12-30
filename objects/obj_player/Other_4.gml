/// @description get footstep noise per room

switch(room)
{
	case Room1:
		footCur = footBasement;
		break;
	default:
		footCur = footMain;
}

audio_play_sound(footCur, 1, true);
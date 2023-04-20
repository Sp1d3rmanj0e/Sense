// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_tracker_A(_dir){

	switch(_dir)
	{
		case 0:   sprite_index = spr_player_tracker_right;		break;
		case 45:  sprite_index = spr_player_tracker_backRight;	break;
		case 90:  sprite_index = spr_player_tracker_back;		break;
		case 135: sprite_index = spr_player_tracker_backLeft;	break;
		case 180: sprite_index = spr_player_tracker_left;		break;
		case 225: sprite_index = spr_player_tracker_frontLeft;	break;
		case 270: sprite_index = spr_player_tracker_front;		break;
		case 315: sprite_index = spr_player_tracker_frontRight; break;
	}

}
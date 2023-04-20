// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_flashlight_A(_dir){

	switch(_dir)
	{
		case 0:   sprite_index = spr_player_flashlight_right;		break;
		case 45:  sprite_index = spr_player_flashlight_backRight;	break;
		case 90:  sprite_index = spr_player_flashlight_back;		break;
		case 135: sprite_index = spr_player_flashlight_backLeft;	break;
		case 180: sprite_index = spr_player_flashlight_left;		break;
		case 225: sprite_index = spr_player_flashlight_frontLeft;	break;
		case 270: sprite_index = spr_player_flashlight_front;		break;
		case 315: sprite_index = spr_player_flashlight_frontRight;	break;
	}

}
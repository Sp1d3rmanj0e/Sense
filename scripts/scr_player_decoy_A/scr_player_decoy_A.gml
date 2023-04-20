// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_decoy_A(_dir){

	switch(_dir)
	{
		case 0:   sprite_index = spr_player_decoy_right;		break;
		case 45:  sprite_index = spr_player_decoy_backRight;	break;
		case 90:  sprite_index = spr_player_decoy_back;			break;
		case 135: sprite_index = spr_player_decoy_backLeft;		break;
		case 180: sprite_index = spr_player_decoy_left;			break;
		case 225: sprite_index = spr_player_decoy_frontLeft;	break;
		case 270: sprite_index = spr_player_decoy_front;		break;
		case 315: sprite_index = spr_player_decoy_frontRight;	break;
	}

}
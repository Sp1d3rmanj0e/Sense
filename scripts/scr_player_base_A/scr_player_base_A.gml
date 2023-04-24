function scr_player_base_A(_dir){

	switch(_dir)
	{
		case 0:   sprite_index = spr_playerBase_right;		break;
		case 45:  sprite_index = spr_playerBase_backRight;	break;
		case 90:  sprite_index = spr_playerBase_back;		break;
		case 135: sprite_index = spr_playerBase_backLeft;	break;
		case 180: sprite_index = spr_playerBase_left;		break;
		case 225: sprite_index = spr_playerBase_frontLeft;	break;
		case 270: sprite_index = spr_playerBase_front;		break;
		case 315: sprite_index = spr_playerBase_frontRight;	break;
	}

}
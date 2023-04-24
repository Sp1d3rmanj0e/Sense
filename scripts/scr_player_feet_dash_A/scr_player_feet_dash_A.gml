function scr_player_feet_dash_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_feet_right_dash;
		case spr_playerBase_backRight:	return spr_player_feet_backRight_dash;
		case spr_playerBase_back:		return spr_player_feet_back_dash;
		case spr_playerBase_backLeft:	return spr_player_feet_backLeft_dash;
		case spr_playerBase_left:		return spr_player_feet_left_dash;
		case spr_playerBase_frontLeft:	return spr_player_feet_frontLeft_dash;
		case spr_playerBase_front:		return spr_player_feet_front_dash;
		case spr_playerBase_frontRight: return spr_player_feet_frontRight_dash;
	}
}
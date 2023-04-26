function scr_player_head_thermal_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_head_right_thermal;
		case spr_playerBase_backRight:	return spr_player_head_backRight_thermal;
		case spr_playerBase_back:		return spr_player_head_back_thermal;
		case spr_playerBase_backLeft:	return spr_player_head_backLeft_thermal;
		case spr_playerBase_left:		return spr_player_head_left_thermal;
		case spr_playerBase_frontLeft:	return spr_player_head_frontLeft_thermal;
		case spr_playerBase_front:		return spr_player_head_front_thermal;
		case spr_playerBase_frontRight: return spr_player_head_frontRight_thermal;
	}
}
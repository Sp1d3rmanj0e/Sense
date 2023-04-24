function scr_player_leftArm_default_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_leftArm_right_default;
		case spr_playerBase_backRight:	return spr_player_leftArm_backRight_default;
		case spr_playerBase_back:		return spr_player_leftArm_back_default;
		case spr_playerBase_backLeft:	return spr_player_leftArm_backLeft_default;
		case spr_playerBase_left:		return spr_player_leftArm_left_default;
		case spr_playerBase_frontLeft:	return spr_player_leftArm_frontLeft_default;
		case spr_playerBase_front:		return spr_player_leftArm_front_default;
		case spr_playerBase_frontRight: return spr_player_leftArm_frontRight_default;
	}
}
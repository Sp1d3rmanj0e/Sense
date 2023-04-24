function scr_player_leftArm_flashlight_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_leftArm_right_flashlight;
		case spr_playerBase_backRight:	return spr_player_leftArm_backRight_flashlight;
		case spr_playerBase_back:		return spr_player_leftArm_back_flashlight;
		case spr_playerBase_backLeft:	return spr_player_leftArm_backLeft_flashlight;
		case spr_playerBase_left:		return spr_player_leftArm_left_flashlight;
		case spr_playerBase_frontLeft:	return spr_player_leftArm_frontLeft_flashlight;
		case spr_playerBase_front:		return spr_player_leftArm_front_flashlight;
		case spr_playerBase_frontRight: return spr_player_leftArm_frontRight_flashlight;
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_rightArm_decoy_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_rightArm_right_decoy;
		case spr_playerBase_backRight:	return spr_player_rightArm_backRight_decoy;
		case spr_playerBase_back:		return spr_player_rightArm_back_decoy;
		case spr_playerBase_backLeft:	return spr_player_rightArm_backLeft_decoy;
		case spr_playerBase_left:		return spr_player_rightArm_left_decoy;
		case spr_playerBase_frontLeft:	return spr_player_rightArm_frontLeft_decoy;
		case spr_playerBase_front:		return spr_player_rightArm_front_decoy;
		case spr_playerBase_frontRight: return spr_player_rightArm_frontRight_decoy;
	}

}
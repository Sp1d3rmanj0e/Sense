function scr_player_head_tracker_A(){
	
	switch(sprite_index)
	{
		case spr_playerBase_right:		return spr_player_head_right_tracker;
		case spr_playerBase_backRight:	return spr_player_head_backRight_tracker;
		case spr_playerBase_back:		return spr_player_head_back_tracker;
		case spr_playerBase_backLeft:	return spr_player_head_backLeft_tracker;
		case spr_playerBase_left:		return spr_player_head_left_tracker;
		case spr_playerBase_frontLeft:	return spr_player_head_frontLeft_tracker;
		case spr_playerBase_front:		return spr_player_head_front_tracker;
		case spr_playerBase_frontRight: return spr_player_head_frontRight_tracker;
	}
}
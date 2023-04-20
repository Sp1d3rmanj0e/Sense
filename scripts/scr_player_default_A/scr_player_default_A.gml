// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_default_A(_dir){
	
	var _moveX = keyRight - keyLeft;
	
	// On this animation, we only have 5 out of the 8 angles, so we use
	// mirroring to compensate.
	if (_moveX != 0) image_xscale = _moveX;
	
	switch(_dir)
	{
		case 0:
		case 180:
		
			sprite_index = spr_playerSide;
			break;
		case 45:
		case 135:

			sprite_index = spr_playerQBack;
			break;
		case 90:
			
			sprite_index = spr_playerBack;
			break;
		case 225:
		case 315:
			
			sprite_index = spr_playerQFront;
			break;
		case 270:
			
			sprite_index = spr_playerFront;
			break;
	}
}
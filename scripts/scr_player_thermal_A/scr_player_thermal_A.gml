// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_player_thermal_A(_dir){

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
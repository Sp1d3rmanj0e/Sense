/// @description State machine and transitions

switch(state)
{
	case GPS.PLAYER:
	
		// Follow player
		x = obj_player.x;
		y = obj_player.y;
		
		// Point in direction of mouse
		image_angle = point_direction(x, y, mouse_x, mouse_y);
		
		// Shoot if right click pressed
		if (mouse_check_button_pressed(mb_right))
		{
			state = GPS.AIRBORNE;
			audio_play_sound(snd_GPS_thrown, 1, false);
		}
	
	break;
	
	case GPS.AIRBORNE:
		
		// Move in direction thrown
		var _tilemap = layer_tilemap_get_id("walls");
		if (tilemap_get_at_pixel(_tilemap, x, y) == 0)
		{
			x += lengthdir_x(projSp, image_angle);
			y += lengthdir_y(projSp, image_angle);
		}
		else // Switch to ground state if hit wall
		{
			state = GPS.GROUND;
			audio_play_sound(snd_GPS_hitWall, 1, false);
		}
		
		// If contacting an enemy, 
		// switch to enemy tracking state
		var _enemyId = instance_place(x, y, enemies);
		if (_enemyId != noone)
		{
			trackId = _enemyId; // Store who to track
			state = GPS.ENEMY; // Switch to tracking enemy state
			logImportant("Switching to GPS.ENEMY");
			logImportant(string(_enemyId));
		}
		
	break;
	
	case GPS.GROUND:
		
		// Get picked up by player
		if (place_meeting(x, y, obj_player))
		{
			state = GPS.PLAYER;
			audio_play_sound(snd_GPS_pickedUp, 1, false);
		}
		
	break;
	
	case GPS.ENEMY:
		
		sprite_index = spr_GPS_item_active;
		image_angle = 0;
		
		if (instance_exists(trackId))
		{
			// Follow new enemy
			x = trackId.x;
			y = trackId.y;
		}
		
	break;
}
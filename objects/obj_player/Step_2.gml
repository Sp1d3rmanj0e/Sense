/// @description Animations and Camera

// Allow player to go behind furniture
depth = -y - (bbox_bottom - y);

// Get camera dimensions
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

var _camX = x - _camWidth/2;
var _camY = y - _camHeight/2;

// Camera does not go out of map bounds
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// Camera follows player
camera_set_view_pos(view_camera[0], _camX, _camY);

// Animations

// Animate only if player is moving
if (hsp == 0 && vsp == 0)
{
	image_index = 3; // Sets animation to idle frame (the fourth frame)
	image_speed = 0; // Freezes on that frame
	
	// Pause footsteps if not moving
	audio_pause_sound(footCur);
}
else // Moving
{	
	// Play footstep noises when moving
	audio_resume_sound(footCur);
	
	image_speed = 1; // Sets animation speed to normal when moving
	
	// Get directions of motion **THANKS TO FriendlyCosmonaut
	var _moveX = keyRight - keyLeft;
	var _moveY = keyDown - keyUp;
	
	// Gets the degree direction the player is facing
	var _dir = point_direction(0, 0, _moveX, _moveY);
	
	// flip animations if moving left (because we only have 5 out of 8 directions
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
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spiderA(){

// Animations

var _moveX, _moveY;

// Turn dir into local var
var _dir = dir;

// Get the direction of motion into hsp and vsp variables
var _moveX = sign(lengthdir_x(1,_dir));
var _moveY = sign(lengthdir_y(1,_dir));

// Animate only if player is moving
if (_moveX == 0 && _moveY == 0)
{
	image_index = 3; // Sets animation to idle frame (the fourth frame)
	image_speed = 0; // Freezes on that frame
	
	// Pause footsteps if not moving
	//audio_pause_sound(footCur);
}
else // Moving
{	
	// Play footstep noises when moving
	//audio_resume_sound(footCur);
	
	image_speed = 1; // Sets animation speed to normal when moving
	
	// flip animations if moving left (because we only have 5 out of 8 directions
	if (_moveX != 0) image_xscale = _moveX;
	
	switch(_dir)
	{
		case 0:
		case 180:
			if (global.arachnaphobiaMode)
				sprite_index = spr_spiderSide_A;
			else
				sprite_index = spr_spiderSide;
			break;
		case 45:
		case 135:
			if (global.arachnaphobiaMode)
				sprite_index = spr_spiderBack3_A;
			else
				sprite_index = spr_spiderBack3;
			break;
		case 90:
			if (global.arachnaphobiaMode)
				sprite_index = spr_spiderBack_A;
			else
				sprite_index = spr_spiderBack;
			break;
		case 225:
		case 315:
			if (global.arachnaphobiaMode)
				sprite_index = spr_spiderFront3_A;
			else
				sprite_index = spr_spiderFront3;
			break;
		case 270:
			if (global.arachnaphobiaMode)
				sprite_index = spr_spiderFront_A;
			else
				sprite_index = spr_spiderFront;
			break;
	}
	
}

}
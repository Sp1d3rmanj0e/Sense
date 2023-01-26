// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_eyeballA(){

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
	image_speed = 1; // Sets animation speed to normal when moving
	
	// flip animations if moving left (because we only have 5 out of 8 directions
	if (_moveX != 0) image_xscale = _moveX;
	
	// Get which stage of eyeball to be
	switch(state)
	{
		case STATE.WANDER:
			#region angles
			// Get which angle eyeball is facing
			switch(_dir)
			{
				case 0:
				case 180:
		
					sprite_index = spr_eyeSide_0;
					break;
				case 45:
				case 135:

					sprite_index = spr_eyeBack3_0;
					break;
				case 90:
			
					sprite_index = spr_eyeBack_0;
					break;
				case 225:
				case 315:
			
					sprite_index = spr_eyeFrnt3_0;
					break;
				case 270:
			
					sprite_index = spr_eyeFront_0;
					break;
			}
			#endregion angles
			break;
			
		case STATE.AGGRO:
			#region angles
			// Get which angle eyeball is facing
			switch(_dir)
			{
				case 0:
				case 180:
		
					sprite_index = spr_eyeSide_1;
					break;
				case 45:
				case 135:

					sprite_index = spr_eyeBack3_1;
					break;
				case 90:
			
					sprite_index = spr_eyeBack_1;
					break;
				case 225:
				case 315:
			
					sprite_index = spr_eyeFrnt3_1;
					break;
				case 270:
			
					sprite_index = spr_eyeFront_1;
					break;
			}
			#endregion angles
			break;
			
		case STATE.CHASE:
			#region angles
			// Get which angle eyeball is facing
			switch(_dir)
			{
				case 0:
				case 180:
		
					sprite_index = spr_eyeSide_2;
					break;
				case 45:
				case 135:

					sprite_index = spr_eyeBack3_2;
					break;
				case 90:
			
					sprite_index = spr_eyeBack_2;
					break;
				case 225:
				case 315:
			
					sprite_index = spr_eyeFrnt3_2;
					break;
				case 270:
			
					sprite_index = spr_eyeFront_2;
					break;
			}
			#endregion angles
			break;
	}
}

}
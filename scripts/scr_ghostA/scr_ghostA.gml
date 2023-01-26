// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ghostA(){

// Get dir var
var _dir = floor(dir) + 1; // + 1 biases the code upwards to prevent glitches

// Turn dir from degrees to a number we can work with (whole number)
_dir = floor(_dir / 45);

// Check what state the enemy is in (different animations based on that)
switch(state)
{
	case STATE.WANDER: // Use passive sprites
	
		// Check if index is already selected - switch if not
		if (sprite_index != spr_ghost) sprite_index = spr_ghost;
		
		// Set image index to direction
		image_index = _dir;
		
		break;
	case STATE.CHASE: // Use aggro sprites
		
		// Check if index is already selected - switch if not
		if (sprite_index != spr_ghostAggro) sprite_index = spr_ghostAggro;
		
		// Set image index to dirwdection
		image_index = _dir;
		break;
}

}
/// @description Dash mechanics

// Get button inputs
var _keyRight = obj_player.keyRight;
var _keyLeft  = obj_player.keyLeft;
var _keyUp    = obj_player.keyUp;
var _keyDown  = obj_player.keyDown;

// Get the direction of motion the player is moving in
var _moveX = _keyRight - _keyLeft;
var _moveY = _keyDown - _keyUp;

// Checks if any movement button was pressed
var _movementButtonPressed = ((_moveX != 0) || (_moveY != 0));

// If only 1 input pressed
if ((_movementButtonPressed == 1) && (!pressed))
{
	pressed = true; // Only allow one press
	
	obj_player.state = PSTATE.DASH; // Dash state
	audio_play_sound(snd_Dash_used, 1, false);
	obj_player.invuln = true; // Invuln on
	
	alarm[0] = dashTime // Stop dashing timer
	
	// Find which button it was and
	// move player accordingly
	with(obj_player)
	{
		vsp = _moveY * other.dashSpeed;
		hsp = _moveX * other.dashSpeed;
	}
	
	//instance_destroy();
}
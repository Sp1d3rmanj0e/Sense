/// @description Dash mechanics

// Get button inputs

// Get the direction of motion the player is moving in
var _moveX = sign(obj_player.moveX);
var _moveY = sign(obj_player.moveY);

// Checks if any movement button was pressed
var _movementButtonPressed = ((_moveX != 0) || (_moveY != 0));

// If only 1 input pressed
if ((_movementButtonPressed == 1) && (!pressed))
{
	pressed = true; // Only allow one press
	
	if (obj_player.state != PSTATE.FREEZE)
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
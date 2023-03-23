/// @description Dash mechanics

// Get button inputs
var _keyRight = obj_player.keyRight;
var _keyLeft  = obj_player.keyLeft;
var _keyUp    = obj_player.keyUp;
var _keyDown  = obj_player.keyDown;

// Store inputs into an array
inputs = [_keyRight, _keyLeft, _keyDown, _keyUp];

// Find how many inputs are being pressed
// And which button it was
var _buttonsPressed = 0;
var _button = -1;
for (var i = 0; i < 4; i++) // Loop through all 4 buttons
{
	/*
	 * When one of the buttons is pressed, it will
	 * add it to the _buttonsPressed total
	 * and then store which button was pressed with _button
	 */
	if (inputs[i] == 1) 
	{
		_buttonsPressed += inputs[i];
		_button = i; // Store the button index being pressed
	}
}

// If only 1 input pressed
if ((_buttonsPressed == 1) && (!pressed))
{
	pressed = true; // Only allow one press
	
	obj_player.state = PSTATE.DASH; // Dash state
	
	alarm[0] = dashTime // Stop dashing timer
	
	// Find which button it was and
	// move player accordingly
	with(obj_player)
	{
		switch(_button)
		{
			case 0: log("right");
				hsp = other.dashSpeed;
				break;
			case 1: log("left");
				hsp = -other.dashSpeed;
				break;
			case 2: log("down");
				vsp = other.dashSpeed;
				break;
			case 3: log("up");
				vsp = -other.dashSpeed;
				break;
		}
	}
	
	//instance_destroy();
}
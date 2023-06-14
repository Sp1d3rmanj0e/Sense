/// @description Insert description here
// You can write your code in this editor

// Follow player
x = obj_player.x;
y = obj_player.y - 20;

// Point towards mouse
if (!global.controllerConnected) // Follow mouse if no controller connected
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);
}
else // Follow left stick if controller connected
{
	var pointX, pointY;
	
	pointX = gamepad_axis_value(global.connectedPad, gp_axislh);
	pointY = gamepad_axis_value(global.connectedPad, gp_axislv);
	
	if !(pointX == 0 && pointY == 0)
	{
		image_angle = point_direction(0, 0, pointX, pointY);
	}
}

// Toggle Light On/Off based on player's current sense
lightOn = (obj_player.curSense == SENSE.SEE);

// Flashlight will look off when light is off (and v/v)
image_index = lightOn;
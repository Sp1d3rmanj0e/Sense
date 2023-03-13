/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Grow when mouse hovers over it
if (point_in_circle(mouse_x, mouse_y, x+20, y, sprite_width/2))
{
	// Grow if mouse touching
	if (hover < 1) hover+= changeSp;
}
else
{
	// Unshrink if not hovered over
	if (hover > 0) hover-= changeSp;
}

// Grow and shrink button
var _scale = lerp(minSize,maxSize,hover);
image_xscale = _scale;
image_yscale = _scale;


var _clicked = ((point_in_circle(mouse_x, mouse_y, x+20, y, sprite_width/2)) && (mouse_check_button_pressed(mb_left)));
var _hotkeyPressed = (keyboard_check_pressed(ord(string(hotkey))));

// Check if mouse is touching button
if  ((_clicked) || (_hotkeyPressed)) && (!deactivated)
{
	
	// Toggle this button (on or off)
	if (instance_exists(obj_player))
	{
		if (obj_player.curSense == sense) // Toggle off sense
		{
			obj_player.curSense = SENSE.NONE;
		}
		else // Toggle on sense
		{
			obj_player.curSense = sense;
		}
	}
}

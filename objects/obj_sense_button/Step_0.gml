/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Grow and shrink button
var _scale = lerp(minSize,maxSize,hover);
image_xscale = _scale;
image_yscale = _scale;


// Check if mouse is touching button
if (position_meeting(mouse_x, mouse_y, id))
{
	// Grow if mouse touching
	if (hover < 1) hover+= changeSp;
	
	// Check if button is clicked
	if (mouse_check_button_pressed(mb_left))
	{
		// Toggle this button (on or off)
		if (instance_exists(obj_player))
		{
			if (obj_player.curSense == sense) // Toggle off sense
			{
				obj_player.curSense = SENSE.NONE;
				show_debug_message("swapping off sense");
			}
			else // Toggle on sense
			{
				obj_player.curSense = sense;
				show_debug_message("swapping on semse");
			}
		}
	}
}
else
{
	// Unshrink if not hovered over
	if (hover > 0) hover-= changeSp;
}
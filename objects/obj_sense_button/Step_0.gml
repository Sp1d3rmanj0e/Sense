/// @description Insert description here
// You can write your code in this editor

// Get button dimensions
var _x1 = bbox_left;
var _y1 = bbox_top;
var _x2 = bbox_right;
var _y2 = bbox_bottom;

// Grow and shrink button
var _scale = lerp(minSize,maxSize,hover);
image_xscale = _scale;
image_yscale = _scale;

// Check if mouse is touching button
if (position_meeting(mouse_x, mouse_y, id))
{
	// Grow if mouse touching
	if (hover < 1) hover+= changeSp;
	
	// Check if clicked
	if (mouse_check_button_pressed(mb_left))
	{
		obj_player.curSense = sense;
	}
}
else
{
	// Unshrink if not
	if (hover > 0) hover-= changeSp;
}

x = xOffset;
y = yOffset;
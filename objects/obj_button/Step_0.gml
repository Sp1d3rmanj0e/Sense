/// @description Button code

// Get button dimensions
var _x1 = bbox_left;
var _y1 = bbox_top;
var _x2 = bbox_right;
var _y2 = bbox_bottom;

// Grow and shrink button
var _scale = lerp(1,maxSize,hover);
image_xscale = _scale;
image_yscale = _scale;


// Check if mouse or controller mouse is touching the button
var _touchingMouse = false;

if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2))
	_touchingMouse = true;
	
if (instance_exists(obj_controllerMouse)) 
&& (point_in_rectangle(obj_controllerMouse.x, obj_controllerMouse.y, _x1, _y1, _x2, _y2)) 
	_touchingMouse = true;

if (_touchingMouse)
{
	// Grow if mouse touching
	if (hover < 1) hover+= changeSp;
	
	// Check if clicked
	if (mouse_check_button_pressed(mb_left)
	|| (gamepad_button_check_pressed(global.connectedPad, gp_face1)))
	{
		audio_play_sound(snd_buttonPressed, 1, 0);
		
		if (roomCode != noone) // Check if button is a room
		{
			room_goto(roomCode);
		}
		
		// Execute button code
		if (executeCode != noone) // Check if button is a script
		{
			// If the value is an array, execute the script with a condition as well
			if(is_array(executeCode)) script_execute(executeCode[0],executeCode[1]);
			else					  script_execute(executeCode);
		}
	}
}
else
{
	// Unshrink if not
	if (hover > 0) hover-= changeSp;
}

// Check if clicked
	// Shrink
	// Check if unclicked afterwards
		// Execute click code

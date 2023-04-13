/// @description Insert description here
// You can write your code in this editor

// Follow camera code
event_inherited();

#region zoom

// Initialize vars
var _scale; // Initialize the new scale the button will be
var _selected = (obj_player.curSense == sense); // True if the player is using this button
												// for their sense

// Grow when mouse hovers over it
// or it is currently selected
if (point_in_circle(mouse_x, mouse_y, x+20, y, sprite_width/2)
|| _selected)
{
	// Grow if mouse touching
	if (hover < 1) hover+= changeSp;
}
else
{
	// Unshrink if not hovered over
	if (hover > 0) hover-= changeSp;
}

// If mouse is hovering over the button, scale normally
// If the button is selected, scale a little bit more than that
if (!_selected)								// Normal scaling
	_scale = lerp(minSize,maxSize,hover);
else										// Slightly larger scaling
	_scale=  lerp(minSize, selectedMaxSize, hover);

// Set the new scale
image_xscale = _scale;
image_yscale = _scale;

#endregion zoom

// Find which hotkey activates this button
var _activateButton = get_hotkey();

// Check if the sense hotkey or the button were pressed
// both of which can activate the button
var _hotkeyPressed = keyboard_check_pressed(_activateButton);
var _clicked = ((point_in_circle(mouse_x, mouse_y, x+20, y, sprite_width/2)) && (mouse_check_button_pressed(mb_left)));

// Check if mouse is touching button
if  ((_clicked) || (_hotkeyPressed)) && (!deactivated)
{
	// Toggle this button (on or off)
	if (instance_exists(obj_player))
	{
		if (obj_player.curSense == sense)	// Toggle off sense
			obj_player.curSense = SENSE.NONE;
		else								// Toggle on sense
			obj_player.curSense = sense;
	}
}
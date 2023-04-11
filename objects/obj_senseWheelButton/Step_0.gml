/// @description Click detection

// Find which hotkey activates this button
var _activateButton;
switch(sense)
{
	case 0: _activateButton = global.kb_keyHotkey1; break;
	case 1: _activateButton = global.kb_keyHotkey2; break;
	case 2: _activateButton = global.kb_keyHotkey3; break;
	case 3: _activateButton = global.kb_keyHotkey4; break;
	case 4: _activateButton = global.kb_keyHotkey5; break;
}

// Check if the sense hotkey or the button were pressed
// both of which can activate the button
var _hotkeyPressed = keyboard_check_pressed(_activateButton);
var _clicked = (position_meeting(mouse_x, mouse_y, id)) && (mouse_check_button_pressed(mb_left));

// Clicked checker
if (_clicked || _hotkeyPressed) && (!deactivated)
{
	switch_sense(sense);
}
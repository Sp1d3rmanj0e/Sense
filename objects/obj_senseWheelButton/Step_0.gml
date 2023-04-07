/// @description Insert description here
// You can write your code in this editor

// Clicked checker
if ((position_meeting(mouse_x, mouse_y, id)) 
&& (mouse_check_button_pressed(mb_left)))
{
	switch_sense(sense);
}

var _activateButton; // button to press to activate this sense

switch(sense)
{
	case 0: _activateButton = global.kb_keyHotkey1; break;
	case 1: _activateButton = global.kb_keyHotkey2; break;
	case 2: _activateButton = global.kb_keyHotkey3; break;
	case 3: _activateButton = global.kb_keyHotkey4; break;
	case 4: _activateButton = global.kb_keyHotkey5; break;
}

if (keyboard_check_pressed(_activateButton))
{
	switch_sense(sense);
	show_debug_message("button: " + string(sense) + " activated with button: " + string(_activateButton));
}
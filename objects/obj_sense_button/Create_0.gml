/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

// Stores the sense it represents
sense = SENSE.NONE;

// Grow and shrink effects
minSize = 1.8;
maxSize = 2;
selectedMaxSize = 2.5;
hover = 0;
changeSp = 0.10;

// Hotkey info for the buttons
bottomPadding = 30;
sideBuffer = 5;

// Sense loss
deactivated = false; // Default to being on

function get_hotkey()
{
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
	
	return _activateButton;
}
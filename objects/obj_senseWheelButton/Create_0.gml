/// @description Insert description here
// You can write your code in this editor
event_inherited(); // Follow Camera

image_index = sense;
rotationOffset = 0;

// Initialized before create event

// startAngle - the default angle of the button if no offset is in place
// sense      - the sense the button represents
// parent     - the id of obj_spinnywheel creator
// senseSprite- the sprite the sense button represents

function switch_sense(_sense)
{
	// If the button is pressed and the player
	// already had that sense active, it turns
	// off the sense until pressed again.
	// Otherwise, it just switches to the selected
	// sense
	if (obj_player.curSense == _sense) // New sense is old sense
	{
		if (instance_exists(obj_player))
			obj_player.curSense = SENSE.NONE;
	}
	else // New sense is not old sense
	{
		with(parent) // Tell parent to set this button as the selected button
			change_sense(_sense);
		
		if (instance_exists(obj_player))
			obj_player.curSense = _sense;
	}
}

hotkeyButton = "";


// Deactivate button if sense was lost
deactivated = false
for (var i = 0; i < array_length(global.lostSenses); i++)
{
	if (global.lostSenses[i] == sense) deactivated = true;
}

/*
switch(sense)
{
	case SENSE.FEEL:  hotkeyButton = getUnicodeString(global.kb_keyHotkey1); break;
	case SENSE.HEAR:  hotkeyButton = getUnicodeString(global.kb_keyHotkey2); break;
	case SENSE.SEE:   hotkeyButton = getUnicodeString(global.kb_keyHotkey3); break;
	case SENSE.SMELL: hotkeyButton = getUnicodeString(global.kb_keyHotkey4); break;
	case SENSE.TASTE: hotkeyButton = getUnicodeString(global.kb_keyHotkey5); break;
	default: hotkeyButton = "Button not found";
}

show_debug_message("My sense: " + string(sense));
*/
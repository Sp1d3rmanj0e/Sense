/// @description Check for inputs

if (keyboard_check_pressed(vk_escape)) // If escape is pressed, cancel the keybind setup
{
	instance_destroy();
}
else if (keyboard_check_pressed(vk_anykey))
{
	var _key = keyboard_key;
	
	// Set the new keybind option to the pressed button
	parent.options[0] = getUnicodeString(_key); // Tell button the new keybind
	
	// Set the keybind the button represents
	// to the new key as well
	switch(parent.bText)
	{
		case "Move Left": global.kb_keyLeft = _key; break;
		case "Move Right": global.kb_keyRight = _key; break;
		case "Move Up": global.kb_keyUp = _key; break;
		case "Move Down": global.kb_keyDown = _key; break;
		case "Interact": global.kb_keyInteract = _key; break;
		case "Activate Gadget": global.kb_keyGadgetActivate = _key; break;
		case "Sense 1 Hotkey": global.kb_keyHotkey1 = _key; break;
		case "Sense 2 Hotkey": global.kb_keyHotkey2 = _key; break;
		case "Sense 3 Hotkey": global.kb_keyHotkey3 = _key; break;
		case "Sense 4 Hotkey": global.kb_keyHotkey4 = _key; break;
		case "Sense 5 Hotkey": global.kb_keyHotkey5 = _key; break;
	}
	
	instance_destroy();
}
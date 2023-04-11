/// @description Load existing keybind setup

// Check to see if user has a custom keybind setup
if (keybindsExist())
{
	importKeybinds();
}
else
{
	event_user(0); // Use default keybinds
}
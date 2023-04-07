/// @description Insert description here
// You can write your code in this editor

if (!global.settingKeybind) { // Don't leave the settings room until
							  // the keybind being set is complete

gamePaused = !gamePaused; // Toggle game paused

if (gamePaused)
{
	instance_deactivate_all(true); // Deactivate everything besides this instance
	
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	
	list = scr_createList(LISTTYPE.OPTIONS, _camX, _camY, 0, noone); // Create the first list
}
else
{
	instance_activate_all(); // Reactivate the game
	
	with(list) destroyGen(0);
}
}
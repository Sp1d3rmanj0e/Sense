/// @description Pause game (manually)

gamePaused = true;

// Mute all enemies noises
with(enemies)
	audio_emitter_gain(footsteps, 0);
	
instance_deactivate_all(true); // Deactivate everything besides this instance
	
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
	
// Create the starting pause menu
if (room != rm_intro)
	list = scr_createList(LISTTYPE.OPTIONS, _camX, _camY, 0, noone); 
else
	list = scr_createList(LISTTYPE.OPTIONSHOME, _camX, _camY, 0, noone);
	
// Allow the keybind object to keep working
// after everything else gets deactivated
instance_activate_object(obj_loadAndSaveKeybinds);

cMouseId = create_controller_mouse();
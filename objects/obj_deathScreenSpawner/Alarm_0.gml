/// @description Allow player to continue

// Spawn jumpscare at the bottom middle of the screen
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);


if (global.difficulty != DIFF.HARDER)
{
	
	
	var _buttonWidth = sprite_get_width(obj_button);
	var _buttonBuffer = _buttonWidth + 10;
	
	// Not Hardcore mode
	instance_create_layer(_camX + _camWidth/2 - _buttonBuffer, _camY + _camHeight * (11/12), "GUI", obj_button,
	{
		executeCode : room_restart,
		roomCode : room,
		text : "Restart Floor"
	});
	
	// Not Hardcore mode
	instance_create_layer(_camX + _camWidth/2 + _buttonBuffer, _camY + _camHeight * (11/12), "GUI", obj_button,
	{
		executeCode : [array_pop,global.lostGadgets],
		roomCode : rm_selGadget,
		text : "Change Gadget"
	});
}
else
{

	// Hardcore mode
	instance_create_layer(_camX + _camWidth/2, _camY + _camHeight * (11/12), "GUI", obj_button,
	{
		executeCode : game_restart,
		roomCode : rm_intro,
		text : "Restart Entirely"
	});
}
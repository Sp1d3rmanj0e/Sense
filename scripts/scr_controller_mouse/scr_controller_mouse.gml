// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_controller_mouse(){
	
	// This will be returned to the creator.  If the button had existed already
	// prior to it being created here, then when the creator is done using it, it
	// should not delete the button as it was being used prior to the creation of this object
	var _buttonAlreadyExists = instance_exists(obj_controllerMouse);
	
	/*
	// Create a controller mouse if controller is connected
	if (global.controllerConnected && !_buttonAlreadyExists)
	{
		instance_create_layer(camera_get_view_x(view_camera[0]) 
		+ camera_get_view_width(view_camera[0])/2,
		camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2,
		"Instances", obj_controllerMouse);
	}
	
	*/
	logImportant("Existed prior: " + string(_buttonAlreadyExists));
	return _buttonAlreadyExists
}

function destroy_controller_mouse(_didButtonAlreadyExist)
{
	if (instance_exists(obj_controllerMouse) && !_didButtonAlreadyExist)
	{
		instance_destroy(obj_controllerMouse);
		logImportant("Did not exist prior");
	}
	else
	{
		logImportant("existed prior");
	}
}
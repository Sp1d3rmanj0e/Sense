/// @description Insert description here
// You can write your code in this editor

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
	case "gamepad discovered":   
		global.connectedPad = async_load[? "pad_index"];
		global.controllerConnected = true;								// Mark that you can now use controllers
		gamepad_set_axis_deadzone(global.connectedPad, 0.5);			// Set the "deadzone" for the axis
		gamepad_set_button_threshold(global.connectedPad, 0.1);			// Set the "deadzone" for the buttons
		break;
	case "gamepad lost":
		
		// Check to see if no other controllers are connected upon
		// one of them being disconnected
		var _atLeastOneControllerConnected = false;
		for (var i = 0; i < 12; i++)
		{
			if(gamepad_is_connected(i))
			{
				_atLeastOneControllerConnected = true;	// Confirm at least one controller is connected
				global.connectedPad = i;				// Mark the new pad to use for controls
			}
		}
		
		if (!_atLeastOneControllerConnected)
			global.controllerConnected = false;				// Mark that you can no longer use controllers
		break;
}
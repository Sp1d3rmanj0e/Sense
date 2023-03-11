/// @description Insert description here
// You can write your code in this editor

// Always be at the top left of the camera
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

// Create the buttons
instance_destroy(obj_sense_button); // Delete existing buttons
function createButton(_index, _sense)
{
	with(instance_create_layer(205.375 + (240*_index), 60, "GUI", obj_sense_button))
	{
		sense = _sense;
		hotkey = _index+1; // +1 because hotkeys start at 1, not 0
		
		// Turn off the button if sense is lost
		var _sensesLost = global.lostSenses; // Get the lostSenses array
		for (var i = 0; i < array_length(_sensesLost); i++)
		{
			// If this button held a lost sense, deactivate (unactivatable)
			if (_sensesLost[i] == sense)
				deactivated = true;
		}
	}
}

createButton(0, SENSE.FEEL);
createButton(1, SENSE.HEAR);
createButton(2, SENSE.SEE);
createButton(3, SENSE.SMELL);
createButton(4, SENSE.TASTE);
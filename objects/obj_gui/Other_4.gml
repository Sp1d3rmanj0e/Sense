/// @description Create sense and gadget buttons

// Always be at the top left of the camera
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

#region create Sense buttons
instance_destroy(obj_sense_button); // Delete existing buttons
function createButton(_index, _sense)
{
	var _buttonSpacing = 120;
	var _barOffset = (barHeight + topPadding) * 3 + _buttonSpacing; // Starting y to stay below the healthbar and stuff
	var _indexOffset =  _index * (_buttonSpacing); // Y location of the specific button
																			// based on the index
																			// Higher index = lower button
	with(instance_create_layer(camWidth - sprite_get_width(spr_sense_button), (_barOffset + _indexOffset), 
								"GUI", obj_sense_button))
	{
		sense = _sense;
		
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

// Actually create said buttons
createButton(0, SENSE.FEEL);
createButton(1, SENSE.HEAR);
createButton(2, SENSE.SEE);
createButton(3, SENSE.SMELL);
createButton(4, SENSE.TASTE);
#endregion

#region create Gadget button

// Create the gadget button
instance_destroy(obj_gadgetButton); // Destroy the button if it already exists
instance_create_layer(camWidth-topPadding, topPadding, "GUI", obj_gadgetButton);

#endregion create Gadget button


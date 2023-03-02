/// @description Insert description here
// You can write your code in this editor

// Set origins to camera x
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

// Create the buttons
instance_destroy(obj_sense_button); // Delete existing buttons
function createButton(_index, _sense)
{
	with(instance_create_layer(205.375 + (240*_index), 60, "Instances", obj_sense_button))
	{
		sense = _sense;
	}
}

createButton(0, SENSE.FEEL);
createButton(1, SENSE.HEAR);
createButton(2, SENSE.SEE);
createButton(3, SENSE.SMELL);
createButton(4, SENSE.TASTE);
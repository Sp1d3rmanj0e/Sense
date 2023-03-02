/// @description Insert description here
// You can write your code in this editor

// Set origins to camera x
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

// Create the buttons

//143 0 //240

function createButton(_index, _sense)
{
	with(instance_create_layer(143 + (240*_index), 0, "Instances", obj_sense_button))
	{
		sense = _sense;
	}
}
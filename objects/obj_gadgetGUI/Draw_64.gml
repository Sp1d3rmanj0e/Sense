/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);

// Activate the gadget GUI if the activation object exists
if (instance_exists(activationObj))
{
	switch(activationObj)
	{
		case obj_gps:			GPS_GUI();			break;
		case obj_lure:			lure_GUI();			break;
		case obj_heat:			thermal_GUI();		break;
	}
}
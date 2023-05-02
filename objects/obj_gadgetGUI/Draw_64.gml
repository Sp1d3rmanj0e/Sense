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

//if (window_get_height() < camera_get_view_height(view_camera[0]))
	//display_set_gui_size(camera_get_view_width(view_camera[0]), window_get_height());

//draw_set_color(c_white);
//draw_text(0, 0, "test");
//draw_set_valign(fa_bottom);
//draw_text(0, window_get_height(), "bottom test window");
//draw_text(0, camera_get_view_height(view_camera[0]), "bottom test camera");
//draw_set_valign(fa_top);

//draw_text(100, 100, camera_get_view_height(view_camera[0]));
//draw_text(100, 120, window_get_height());
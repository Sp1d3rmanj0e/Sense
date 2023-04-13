/// @description Get the activation object

// The activation object is the object the gadgetGUI looks
// for to start drawing its stats.
// Ex. Only once the teleporter is placed, will it draw the
// teleporter GUI

// activationObj initialized in constructor of obj_gadgetButton

// Properties
camHeight = camera_get_view_height(view_camera[0]);

// Only put the function we'll be using this round in memory
switch(activationObj)
{
	case obj_dash:
		function dash_GUI()
		{
			draw_text(0, camHeight - 20, "Press any direction to dash.");
		}
	break;
	case obj_gps:
		function GPS_GUI()
		{
			draw_circle(50, camHeight-50, 50, false);
		}
	break;
	case obj_lure:
		function lure_GUI()
		{
			draw_text(0, camHeight - 35, "lure uptime");
			var _gadgetTimePercent = obj_lure.alarm[0]/obj_lure.uptime*100;
			draw_healthbar(0, camHeight-15, 50, camHeight, _gadgetTimePercent, 
						   c_black, global.color_gadget, global.color_gadget, 1, true, true);
		}
	break;
	case obj_teleporter:
		function teleport_GUI()
		{
			draw_text(0, camHeight-20, "teleporter active");
		}
	break;
	case obj_heat:
		function thermal_GUI()
		{
			draw_text(0, camHeight - 35, "thermal uptime");
			var _gadgetTimePercent = obj_heat.alarm[0]/obj_heat.uptime*100;
			draw_healthbar(0, camHeight-15, 50, camHeight, _gadgetTimePercent, 
						   c_black, global.color_gadget, global.color_gadget, 1, true, true);
		}
	break;
}
/// @description Get the activation object

// The activation object is the object the gadgetGUI looks
// for to start drawing its stats.
// Ex. Only once the teleporter is placed, will it draw the
// teleporter GUI

// activationObj initialized in constructor of obj_gadgetButton

// Properties
camHeight = camera_get_view_height(view_camera[0]);

#region GPS Properties

circleRad = 100;
scale = (circleRad)/room_height;

// Enemy tracker vars
radar_max_dist = min(room_height, room_width);
enemy_distX = 0;
enemy_distY = 0;

/// Ring vars
radar_ring_search_radius = 0;
radar_speed = 15;

// Colors
baseColor = make_color_rgb(16, 102, 19);
playerDotColor = make_color_rgb(33, 33, 33);
enemyDotColor = make_color_rgb(163, 41, 41);
sonarRingColor = c_green;

// Ping vars
dot_alpha = 1;
ping_time = 1.5 * room_speed;
alpha_falloff = 0.025;
enemy_visible = false;

#endregion GPS Properties



// Only put the function we'll be using this round in memory
switch(activationObj)
{
	case obj_gps:
		function GPS_GUI()
		{
			// Create a pseudo x and y for the code to work off of
			// the x and y will be the coordinate of the center of the circle
			var _x = circleRad;
			var _y = camHeight - circleRad - 40;
			
			#region base setup
			
			// Draw the background circle
			draw_set_color(baseColor);
			draw_circle(_x, _y, circleRad, false);
			
			// Draw player icon
			draw_set_color(playerDotColor);
			draw_circle(_x, _y, 5, false);
			
			#endregion base setup
			
			#region get relative enemy location
				
				// Get the enemy is tracking
				var _trackee = obj_gps.trackId;
				
				// Only draw enemy location if such location exists
				if (_trackee != noone) && (instance_exists(_trackee))
				{
					// Increase the radar ring until it goes out of scope
					// then bring it back to the start to go again
					if (radar_ring_search_radius < radar_max_dist) radar_ring_search_radius += radar_speed;
					else radar_ring_search_radius = 0;

					// Get the offset of the enemy to the player
					var _distX = _trackee.x - obj_player.x;
					_distX *= scale;
					var _distY = _trackee.y - obj_player.y;
					_distY *= scale;

					// Get the distance of the enemy to the player
					var _distance_from_target = point_distance(obj_player.x, obj_player.y, _trackee.x, _trackee.y);

					// Only draw trackee on radar if within scope
					if (_distance_from_target < radar_max_dist)								// Only ping if enemy is within radar range
					&& (_distance_from_target < radar_ring_search_radius)					// Only ping after the radar has passed the enemy location
					&& (_distance_from_target > radar_ring_search_radius - radar_speed - 1) // Only ping once per radar sweep
					&& (alarm[0] == -1)
					{
	
						// When trackee is within scope, save the offset
						// coordinates so it can be drawn on the radar
						enemy_distX = _distX;
						enemy_distY = _distY;
	
						enemy_visible = true;
						alarm[0] = ping_time;
					}
				}
			#endregion get enemy location
			
			#region Draw the enemy location + radar
			
			if (enemy_visible)
			{
				draw_set_alpha(dot_alpha);
				dot_alpha -= alpha_falloff;
				draw_set_color(enemyDotColor);
				draw_circle(_x + enemy_distX, _y + enemy_distY, 5, false);
			}
			else dot_alpha = 1;
			
			draw_set_alpha(1);

			// Draw the radar ring
			draw_set_color(sonarRingColor);
			draw_circle(_x, _y, radar_ring_search_radius * scale, true);
			
			#endregion Draw the enemy location + radar
			
			// If gps exists and is attached to an enemy,
			// draw the connected gps overlay
			if (instance_exists(obj_gps) && (obj_gps.state == GPS.ENEMY))
			{
				draw_sprite(spr_guiActive_tracker, 1, 0, camHeight); // Activated
			}
			else
			{
				draw_sprite(spr_guiActive_tracker, 0, 0, camHeight); // Deactivated
			}
		}
	break;
	case obj_lure:
		function lure_GUI()
		{
			
			draw_sprite(spr_guiActive_decoy, 0, 0, camHeight);
			
			var _gadgetTimePercent = obj_lure.alarm[0]/obj_lure.uptime*100;
			draw_healthbar(0, camHeight-15, 50, camHeight, _gadgetTimePercent, 
						   c_black, global.color_gadget, global.color_gadget, 1, true, true);
						   
		}
	break;
	case obj_heat:
		function thermal_GUI()
		{
			draw_sprite(spr_guiActive_thermal, 0, 0, camHeight);
			
			var _gadgetTimePercent = obj_heat.alarm[0]/obj_heat.uptime*100;
			draw_healthbar(0, camHeight-15, 50, camHeight, _gadgetTimePercent, 
						   c_black, global.color_gadget, global.color_gadget, 1, true, true);
		}
	break;
}
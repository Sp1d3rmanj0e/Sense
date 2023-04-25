/// @description Insert description here
// You can write your code in this editor

if (!surface_exists(surf))
{
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	surf = surface_create(_cw, _ch);
	surface_set_target(surf);
	draw_set_color(c_black);
	draw_set_alpha(0);
	draw_rectangle(0, 0, _cw, _ch, false);
	surface_reset_target();
}
else
{
	if (surface_exists(surf))
	{
		var _cw = camera_get_view_width(view_camera[0]);
		var _ch = camera_get_view_height(view_camera[0]);
		var _cx = camera_get_view_x(view_camera[0]);
		var _cy = camera_get_view_y(view_camera[0]);
		surface_set_target(surf);
		draw_set_color(c_black);
		draw_set_alpha(darkness);
		draw_rectangle(0, 0, _cw, _ch, 0);
		gpu_set_blendmode(bm_subtract);
		with(par_lightParent) // This is where we draw the lights on specific lighting objects
		{
			switch(object_index)
			{
				case obj_player:
				
					// Draw light ring around the player
					draw_sprite_ext(spr_lightSourceRadial, 0, x - _cx, y - _cy, 1.25, 1.25, 0, c_white, 1);
					draw_circle(x - _cx, y - _cy, 30, true);
					break;
					
				case obj_flashlight:
				
					if (obj_flashlight.lightOn)
					{
						var _tilemap = layer_tilemap_get_id("walls");
						var _lightLen = 5; // Default light length
						var _pointDir = obj_flashlight.image_angle;
						var _maxLength = 500;
						var _spriteHeight = sprite_get_height(spr_lightSourceFlashlight);
						var _spriteWidth = sprite_get_width(spr_lightSourceFlashlight);
						while(_lightLen < _maxLength) 
						   &&(tilemap_get_at_pixel(_tilemap,x+lengthdir_x(_lightLen,_pointDir),y+lengthdir_y(_lightLen,_pointDir)) != 1)
						{
							_lightLen++;
						}
					
						//draw_circle((x-_cx) + lengthdir_x(_lightLen, _pointDir), (y - _cy) + lengthdir_y(_lightLen, _pointDir), 50, true);
						draw_sprite_ext(spr_lightSourceFlashlight, 
										0, x - _cx, y - _cy,
										_lightLen/(5*_spriteWidth), // Width. Expands as the light gets longer
										(_lightLen+25)/_spriteHeight, // Length. +35 to bleed into wall
										_pointDir - 90, c_white, 1);
					}
				break;
					
				case obj_wallLight:
					
					// Draw light when light is on
					if (toggleLight)
					{
						draw_sprite_ext(spr_wallLightSource, 0, x - _cx, y - _cy, 1, 1, image_angle, c_yellow, 0.75);
					}
					break;
					
				case obj_mimic:
					// Only draw light if in pixie form
					if (sprite_index == spr_mimicSpirit)
					{
						var _randomScale = random_range(0.3, 0.5);
						draw_sprite_ext(spr_lightSourceRadial, 0, x - _cx, y - _cy, _randomScale, _randomScale, 0, c_white, 1);
					}
					break;
					
				case obj_lightPixel:
					
					draw_sprite_ext(spr_pixel, 0, x - _cx, y - _cy, image_xscale, image_yscale, 0, c_white, 1);
					
				break;
			}
		}
		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(surf, _cx, _cy);
	}
}
/// @description Insert description here
// You can write your code in this editor

// Animate the frames of the door lights (at its original frame speed)
lightFrames = (lightFrames + sprite_get_speed(spr_door_front_light) / room_speed) % sprite_get_number(spr_door_front_light);

// Draw the door light if ending door
if (roomTarget != noone)
{
	switch(image_angle % 180)
	{
		case -90:	// Left
					draw_sprite_ext(spr_door_left_light, lightFrames, x, y, -1, 1, 0, c_white, 1);
			break;
		case 0:		// Up
					draw_sprite(spr_door_front_light, lightFrames, x, y);
			break;
		case 90:	// Right
					draw_sprite(spr_door_left_light, lightFrames, x, y);
			break;
		case 180:	// Down
					draw_sprite_ext(spr_door_front_light, lightFrames, x, y, 1, -1, 0, c_white, 1);
			break;
	}
}

// Draw the door
draw_self();

draw_text(x, y, string(image_angle));
draw_text(x, y+20, string(image_angle % 180));

				

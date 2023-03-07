/// @description Insert description here
// You can write your code in this editor

// Animate the frames of the door lights (at its original frame speed)
lightFrames = (lightFrames + sprite_get_speed(spr_door_front_light) / room_speed) % sprite_get_number(spr_door_front_light);

// Draw the door light if ending door
if (roomTarget != noone)
{
	if (rotated)
	{
		draw_sprite(spr_door_left_light, lightFrames, x, y);
	}
	else
	{
		draw_sprite(spr_door_front_light, lightFrames, x, y);
	}
}

// Draw the door
draw_self();
				

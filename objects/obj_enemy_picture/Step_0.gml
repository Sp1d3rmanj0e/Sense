/// @description Insert description here
// You can write your code in this editor

if (distance_to_object(obj_player) < 5)
{
	if (keyboard_check_pressed(global.kb_keyInteract))
	{
		room_goto()
	}
}
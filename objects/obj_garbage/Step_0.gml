/// @description Outlining and collection

if (place_meeting(x, y, obj_player))
{
	sprite_index = spr_garbage_outlined;
	
	// If interact is pressed on the garbage, collect it
	if (keyboard_check_pressed(global.kb_keyInteract))
	{
		event_user(0);
	}
}
else
{
	sprite_index = spr_garbage;
}
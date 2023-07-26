/// @description

if(on)
{
	if (instance_exists(obj_player))
	{
		if (mouse_check_button_pressed(mb_left))
		{
			obj_player.x = mouse_x;
			obj_player.y = mouse_y;
		}
	}
}
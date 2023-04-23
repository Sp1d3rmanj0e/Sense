/// @description Update player/listener position

// When a cutscene is not happening, put the listener position on the player
if (!layer_exists("transition"))
{
	if (instance_exists(obj_player))
		audio_listener_position(obj_player.x, obj_player.y, 0);
}
else // If a cutscene is happening, we need be able to rely on the fact
	 // That the listener position is in the top left corner
{
	audio_listener_position(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1);
}
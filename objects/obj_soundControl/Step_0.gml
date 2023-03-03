/// @description Update player/listener position

if (instance_exists(obj_player))
	audio_listener_position(obj_player.x, obj_player.y, 0);
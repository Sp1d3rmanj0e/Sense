
function playsoundAt(_listener, _priority, _sound, _loops)
{
	audio_listener_position(_listener.x, _listener.y, 0);
	audio_listener_orientation(0, 1, 0, 0, 0, 1);
	audio_falloff_set_model(audio_falloff_exponent_distance);
	sound = audio_play_sound_at(_sound, x, y, 0, 25, 5, 1, _loops, _priority);
	return sound;
}
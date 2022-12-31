

function playsoundAt(_listener, _sound)
{
	audio_listener_position(_listener.x, _listener.y, 0);
	audio_listener_orientation(0, 1, 0, 0, 0, 1);
	audio_falloff_set_model(audio_falloff_exponent_distance);
	audio_play_sound_at(_sound, x, y, 0, 25, 5, 1, false, 1);
}
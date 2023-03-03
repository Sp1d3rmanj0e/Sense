
function play_sound_at(_sound, _loops)
{
	audio = audio_play_sound_at(
	_sound, 
	x, y, 0,
	obj_soundControl.max_distance_to_be_heard,
	obj_soundControl.start_dropping_off_at,
	obj_soundControl.multiplier,
	_loops, 1);
	
	return audio
}
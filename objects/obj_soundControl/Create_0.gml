/// @description Default sound settings

max_distance_to_be_heard = WORLD.CELL_SIZE * 8;
start_dropping_off_at    = 100;
multiplier               = 10;

audio_falloff_set_model(audio_falloff_exponent_distance);
audio_listener_orientation(0,1,0, 0,0,1);
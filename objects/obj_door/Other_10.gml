/// @description Door tileset control

// Get tilemap data
tilemap = layer_tilemap_get_id("walls");

// Check whether to remove or
// add a tile block
if (doorOpen)
{
	// Remove tile
	tilemap_set_at_pixel(tilemap, 0, x, y);
	play_sound_at_preset(x, y, snd_DoorOpen);
}
else // door closed
{
	// Add tile
	tilemap_set_at_pixel(tilemap, 1, x, y);
	play_sound_at_preset(x, y, snd_DoorClose);
}

// Play door sound
//if (doorOpen) audio_play_sound(snd_DoorOpen,  1, false);
//else		  audio_play_sound(snd_DoorClose, 1, false);
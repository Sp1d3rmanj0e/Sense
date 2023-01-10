/// @description Door tileset control

// Get tilemap data
tilemap = layer_tilemap_get_id("walls");

// Check whether to remove or
// add a tile block
if (doorOpen)
{
	// Remove tile
	tilemap_set_at_pixel(tilemap, 0, x, y);
}
else // door closed
{
	// Add tile
	tilemap_set_at_pixel(tilemap, 1, x, y);
}

// Play door sound
if (doorOpen) playsoundAt(obj_player, snd_DoorOpen1);
else		  playsoundAt(obj_player, snd_DoorClose3);
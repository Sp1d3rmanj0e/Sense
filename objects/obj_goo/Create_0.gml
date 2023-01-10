/// @description Insert description here
// You can write your code in this editor

// Decay timer
gooTimer = 14 * room_speed;
alarm[0] = gooTimer;

// Delete self if accidentally spawned on the ground
var _tilemap = layer_tilemap_get_id("Walls");
if (tilemap_get_at_pixel(_tilemap, x, y) == 0) instance_destroy();
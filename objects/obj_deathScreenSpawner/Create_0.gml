/// @description Insert description here
// You can write your code in this editor


// Variables created in constructor
// enemyThatKilledPlayer - id of the enemy that killed the player

// Spawn jumpscare at the bottom middle of the screen
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);
instance_create_layer(_camX + _camWidth/2, _camY + _camHeight, "Effects", obj_jumpscare,
{
	enemyThatKilledPlayer : enemyThatKilledPlayer,
	camHeight : _camHeight
})

// Deactivate enemies
instance_destroy(enemies);
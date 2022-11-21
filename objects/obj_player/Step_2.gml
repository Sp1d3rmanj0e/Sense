/// @description Insert description here
// You can write your code in this editor

// Get camera dimensions
var camWidth = camera_get_view_width(view_camera[0]);
var camHeight = camera_get_view_height(view_camera[0]);

// Camera follows player
camera_set_view_pos(view_camera[0],x - camWidth/2,y - camHeight/2);
/// @description Insert description here
// You can write your code in this editor

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

offX = x - _camX;
offY = y - _camY;
show_debug_message("Offset x is: " + string(offX) + " and Offset y is: " + string(offY));
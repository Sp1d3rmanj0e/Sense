
if (gamePaused)
{
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);
	var _camWidth = camera_get_view_width(view_camera[0]);
	var _camHeight = camera_get_view_height(view_camera[0]);
	
	draw_set_color(c_black);
	draw_rectangle(_camX, _camY, _camX + _camWidth, _camY + _camHeight, false);
	draw_set_color(c_white);
}
/// @description Only draw if controller is connected

if (global.controllerConnected)
	draw_self();
else
{
	x = -500;
	y = -500;
}
/// @description Only draw if controller is connected

if (global.controllerConnected)
{
	// Load back to last known controller mouse position
	if (!controllerStillConnected)
	{
		x = lastKnownX;
		y = lastKnownY;
		controllerStillConnected = true;
	}
	
	draw_self();
}
else
{
	// Controller is going to be moved off frame to avoid the controller
	// mouse contacting any buttons on screen.  We must first save their
	// last known location so that if the controller reconnects, that's where
	// we put it
	if (controllerStillConnected)
	{
		lastKnownX = x;
		lastKnownY = y;
		controllerStillConnected = false;
	}
	
	x = -500;
	y = -500;
}
// Door vars

// Get the correct sprite perspective
if ((image_angle % 180) != 0) // Not Vertical
{
	sprite_index = spr_door_left;
}
else // Straight Up
{
	sprite_index = spr_door_front;
}

openable = false;

// Get the door's starting status (open/closed)
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;

// Frame counter for sprites
lightFrames = 0;

// Cutscene Animation
activated = false;
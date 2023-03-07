// Door vars

// Get whether a front or side door
rotated = (image_angle != 0);

// Go behind the player layeraw
depth += 50;

// Get the correct sprite perspective
if (rotated) // Not Straight Up
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
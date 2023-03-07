// Door vars

// Get the correct sprite perspective
if (image_angle == 0) // AKA straight up
{
	sprite_index = spr_door_front;
}
else // Not straight up
{
	sprite_index = spr_door_left;
	depth += 50;
}

openable = false;

// Get the door's starting status (open/closed)
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;
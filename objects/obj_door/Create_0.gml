// Door vars

vertical = ((image_angle % 180) == 0);

// Gets the correct door perspective based on the angle
// and if it's the ending door, make it gold
if (!vertical) // Not Vertical
{
	sprite_index = spr_door_left;
	
	if (roomTarget != noone) && (!hidden) sprite_index = spr_door_left_gold;
}
else // Straight Up
{
	sprite_index = spr_door_front;
	
	if (roomTarget != noone) && (!hidden) sprite_index = spr_door_front_gold;
}

openable = false;

// Get the door's starting status (open/closed)
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;

// Cutscene Animation
activated = false;
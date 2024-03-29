// Door vars

vertical = ((image_angle % 180) == 0);

// Gets the correct door perspective based on the angle
// and if it's the ending door, make it gold
if (override == noone)
{
	if (!vertical) // Not Vertical
	{
		sprite_index = get_room_door(false);
	
		if (roomTarget != noone) && (!hidden) sprite_index = get_gold_room_door(false);
	}
	else // Straight Up
	{
		sprite_index = get_room_door(true);
	
		if (roomTarget != noone) && (!hidden) sprite_index = get_gold_room_door(true);
	}
}
else
{
	sprite_index = override;
}

openable = false;

// Get the door's starting status (open/closed)
if (!doorOpen) event_user(0);

// Timers
interactDelay = 1;
interactDelayTimer = -1;

// Cutscene Animation
activated = false;
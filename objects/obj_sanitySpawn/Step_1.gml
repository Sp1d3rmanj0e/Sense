/// @description Hide if near player

// Disappear if player gets too close
if (hiding == false)
{
	if (distance_to_object(obj_player) < WORLD.CELL_SIZE*2)
		hiding = true;
		hidingTimer = hidingTime * room_speed;
}
else
{
	if (hidingTimer > 0) hidingTimer--;
	else
	{
		hidingTimer = -1;
		hiding = false;
	}
}
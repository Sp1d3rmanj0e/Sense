/// @description Insert description here
// You can write your code in this editor

uptime = 10 * room_speed;
alarm[0] = uptime;

// Lure vars
lureRadius = 10 * WORLD.CELL_SIZE;

with(enemies)
{
	if (distance_to_object(other.id) < other.lureRadius)
		goto(path, other.x, other.y, eSpeed, global.grid);
}
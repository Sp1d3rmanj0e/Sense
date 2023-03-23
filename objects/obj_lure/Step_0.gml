/// @description Insert description here
// You can write your code in this editor

with(enemies)
{
	if (distance_to_object(other.id) < 0.5 * WORLD.CELL_SIZE)
	{
		path_cancel();
	}
}
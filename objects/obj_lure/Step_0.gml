/// @description Insert description here
// You can write your code in this editor

// Lure enemies when activated
if (activated)
{
	with (enemies)
	{
		if (distance_to_object(other.id) < lureRadius)
		{
			goto(path, x, y, eSpeed, global.grid);
		}
	}
}
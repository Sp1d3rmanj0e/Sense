/// @description Get Direction of motion + attack player

// Get direction of motion
if ((prevX - x) != 0 || (prevY - y) != 0) dir = point_direction(prevX, prevY, x, y);
/**
 * 0   - right
 * 180 - left
 * 270 - down
 * 90  - up
 */

// Set new previous locations
prevX = x;
prevY = y;


if (heatSpawnTimer > 0) heatSpawnTimer--;
else
{
	heatSpawnTimer = heatSpawnTime;
	
	// Create heat residue
	instance_create_layer(x, y, "Instances", obj_heat);
}

if (distance_to_object(obj_player) < WORLD.CELL_SIZE/2)
{
	with(obj_player)
	{
		takeDmg();
	}
}
/// @description Get Direction of motion

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
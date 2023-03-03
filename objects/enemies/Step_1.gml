/// @description Get Direction of motion + attack player + sound

// Move the footstep noise to the enemy
audio_emitter_position(footsteps, x, y, 0);

// Get whether enemy is moving or not
var _moving = ((prevX - x) != 0 || (prevY - y) != 0);

if (_moving)
{
	// Set new direction of motion
	dir = point_direction(prevX, prevY, x, y);
}
else
{
	// Pause footstep sound (by moving it out of hearing range)
	audio_emitter_position(footsteps,-400, -400, 0);
}


// Set new previous locations
prevX = x;
prevY = y;

// Create heat residue
if (heatSpawnTimer > 0) heatSpawnTimer--;
else
{
	heatSpawnTimer = heatSpawnTime;
	instance_create_layer(x, y, "Instances", obj_heat);
}

// Deal damage to the player if close enough
if (distance_to_object(obj_player) < WORLD.CELL_SIZE/2)
{
	with(obj_player)
	{
		takeDmg();
	}
}
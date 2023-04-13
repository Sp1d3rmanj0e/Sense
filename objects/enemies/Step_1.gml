/// @description Get Direction of motion + attack player + sound

// Move the footstep noise to the enemy
audio_emitter_position(footsteps, x, y, 0);

// Get whether enemy is moving or not
var _moving = ((prevX - x) != 0 || (prevY - y) != 0);

if (_moving)
{
	// Set new direction of motion
	dir = point_direction(prevX, prevY, x, y);
	
	// Resume footstep sounds (if needed)
	audio_emitter_gain(footsteps, 1);
}
else
{
	// Pause footstep sound (by muting it)
	audio_emitter_gain(footsteps, 0);
}

// Mute audio if player hear sense is not activated
if (obj_player.curSense != SENSE.HEAR)
{
	audio_emitter_gain(footsteps, 0);
	
	// Create a sound icon when player could hear, but isn't actively hearing
	if ((_moving)
    && (distance_to_object(obj_player) < obj_soundControl.max_distance_to_be_heard))
	{
		// Create sound icon
		if (!instance_exists(obj_soundIcon))
			instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_soundIcon);
	}
}

// Set new previous locations
prevX = x;
prevY = y;

// Create heat residue
if (heatSpawnTimer > 0) heatSpawnTimer--;
else
{
	heatSpawnTimer = heatSpawnTime;
	instance_create_layer(x, y, "Instances", obj_scent);
}

// Deal damage to the player if close enough + but not the janitor
if (distance_to_object(obj_player) < attackRange) && (!passive) && (!stunned)
{
	with(obj_player)
	{
		takeDmg(other.object_index);
	}
}
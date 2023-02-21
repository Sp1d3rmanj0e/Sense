/// @description Interations with environment (+Feeling Sense)

// Start the player speed as normal
walkSp = origWalkSp;

// Speed boost when taking damage
if (alarm[1] != -1)
{
	walkSp *= 1.3;
}

// If colliding with janitor, match speed with him
if (place_meeting(x, y, obj_janitor))
{
		walkSp = obj_janitor.eSpeed;
}

// Slow down if colliding with webs
var _id = instance_place(x, y, obj_residue); // Get id of residue
if (_id != noone) && (_id.realResidue == spr_resWeb) // Check if the residue are webs
{
	walkSp *= 0.66; // Reduce speed by 1/3
}

/*
// Only spawn rings when timer is at 0
if (feelRingTimer > 0)
{
	// Decrement timer
	feelRingTimer--;
}
else
{
	// Reset feelRingTimer
	feelRingTimer = feelRingTime;
	
	// Feeling sense (vibrations when enemies are near)
	if (tilemap_get_at_pixel(tilemap, mouse_x, mouse_y) && mouse_check_button(mb_left))
	{
		curSense = SENSE.FEEL; // Set active sense to feel
	
		// Store nearby enemies in a ds_list
		var _enemies = ds_list_create();
		var _enemyNum = collision_circle_list(x, y, feelRad, enemies, false, 
											  false, _enemies, false); // Enemies are within circle
		// Loop for every enemy ID in the circle
		for (var i = 0; i < _enemyNum; i++)
		{
			// Point towards the enemy and set the intensity
			var _enemyID = ds_list_find_value(_enemies, i); // Get an enemy id
			with(instance_create_layer(x, y, "Instances", obj_feelRing))
			{
				image_angle = point_direction(x, y, _enemyID.x, _enemyID.y); // Point towards the enemy
				shakeIntensity = (other.feelRad - distance_to_object(_enemyID)) * 0.04; // Give the ring an intensity based on distance to enemy
			}
		}
	}
}



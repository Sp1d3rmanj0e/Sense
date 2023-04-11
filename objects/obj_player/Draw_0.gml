/// @description Feel Ring

// Feeling sense (vibrations when enemies are near)
if (curSense == SENSE.FEEL)
{
	// Store nearby enemies in a ds_list
	var _enemies = ds_list_create();
	var _enemyNum = collision_circle_list(x, y, feelRad, enemies, false, 
											false, _enemies, false); // Enemies are within circle
	// Loop for every enemy ID in the circle
	for (var i = 0; i < _enemyNum; i++)
	{
		// Point towards the enemy and set the intensity
		var _enemyID = ds_list_find_value(_enemies, i); // Get an enemy id
		var _angle = point_direction(x, y, _enemyID.x, _enemyID.y); // Point towards the enemy
		var _shake = (feelRad - distance_to_object(_enemyID)) * 0.20; // Give the ring an intensity based on distance to enemy
			
		// Draw the feel ringw
		draw_sprite_ext(spr_feelRing, 0, 
						x + random_range(-_shake, _shake),
						y + random_range(-_shake, _shake),
						1, 1, _angle, c_white, 1);
	}
}

draw_self();

/*
 * Invulnerability
 * If the player is invulnerable, it will flash white
 * then fade out.  It will keep doing that until no longer
 * invulnerable.
 * (It will be drawn over the normal player sprite)
 */
 if (invuln)
 {
	if (flashAlpha > 0)
		flashAlpha -= 0.05;
	else
		flashAlpha = 1;
	 
	shader_set(sd_flash);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle,
						flashColor, flashAlpha);
	shader_reset();
 }

depth = 100 - y/room_height*100 + layerDepth;

draw_text(x, y, depth);
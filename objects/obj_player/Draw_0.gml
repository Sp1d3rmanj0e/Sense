/// @description Animations, Feel Ring, Shadows

// Make sure the hitbox stays the same no matter what sprite it is
mask_index = spr_playerFront;

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

// Draw pseudo shadows
// If you are further from a light, the player appears darker
var _maxDarkness = 150;
var _darkness = 255 - clamp(distance_to_object(obj_wallLight), 0, _maxDarkness);
var _darknessBlend = make_color_rgb(_darkness, _darkness, _darkness);
image_blend = _darknessBlend;

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

#region Animations

// Fade in after teleporting
if (image_alpha < 1) image_alpha += 0.05;

// Get directions of motion **THANKS TO FriendlyCosmonaut
var _moveX = keyRight - keyLeft;
var _moveY = keyDown - keyUp;
	
// Gets the degree direction the player is facing
var _dir = point_direction(0, 0, _moveX, _moveY);

// Animate only if player is moving
if (hsp == 0 && vsp == 0)
{
	image_index = 3; // Sets animation to idle frame (the fourth frame)
	image_speed = 0; // Freezes on that frame
	
	// Pause footsteps if not moving
	//audio_pause_sound(footCur);
}
else // Moving
{	
	// Play footstep noises when moving
	//audio_resume_sound(footCur);
	
	image_speed = 1; // Sets animation speed to normal when moving
	
	// Get the animation script based on the player's current status
	var _playerAnimScript = scr_player_default_A;
	
	// Only some gadgets have active sprites
	// If one is found, it will switch to that animation instead
	switch(curGadget)
	{
		case GADGET.DASH:		_playerAnimScript = scr_player_dash_A;		break;
		case GADGET.GPS:		_playerAnimScript = scr_player_tracker_A;	break;
		case GADGET.LURE:		_playerAnimScript = scr_player_decoy_A;		break;
	}
	
	// If no active sprite was chosen and the player has the
	// flashlight equipped, use the flashlight active sprite
	if (_playerAnimScript == scr_player_default_A) && (curSense == SENSE.SEE)
	{
		_playerAnimScript = scr_player_flashlight_A;
	}
	
	script_execute(_playerAnimScript, _dir);
}

#endregion animations
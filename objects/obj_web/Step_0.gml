/// @description Slow player when walked on

/**
 * If the player touches the webs, it will ratio its speed
 * until the player escapes the webs.  In which case, the web
 * will disappear
 */

// If touching player
if (place_meeting(x,y, obj_player))
{
	if (!touched)
	{
		// Tell the spider that the web has been interacted with
		touched = true;
	
		// Store old speed (just in case)
		oldSpd = obj_player.origWalkSp;
	
		// Set player speed to ratio
		obj_player.walkSp = oldSpd * slowPercent;
	}
}
else if (touched)
{
	// Revert to old speed
	obj_player.walkSp = oldSpd;
	
	// Destroy self after use
	instance_destroy();
}
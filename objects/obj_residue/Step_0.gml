/// @description Outline/Show if mouse is over it

// Outline when player is on residue
image_index = place_meeting(x, y, obj_player);


// Smell the residue when sense is activated and player is standing on it
if (place_meeting(x,y, obj_player) && (obj_player.curSense == SENSE.TASTE))
{
	// Increment the smell progress
	smellProgress = min(smellProgress+1, 100); // Increment smell progress when clicked
} else {
	// Decrement the smellprogress
	smellProgress = max(smellProgress-1, 0); // Decrement smell progress when not clicked
}

// Reveal once smellProgress = 100%
if (smellProgress  >= 100) smelled = true;
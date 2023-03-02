/// @description Outline/Show if mouse is over it

// Outline when hovered
image_index = position_meeting(mouse_x, mouse_y, self);

if (place_meeting(x,y, obj_player) && (obj_player.curSense == SENSE.TASTE))
{
	smellProgress = min(smellProgress+1, 100); // Increment smell progress when clicked
} else {
	smellProgress = max(smellProgress-1, 0); // Decrement smell progress when not clicked
}

// Reveal once smellProgress = 100%
if (smellProgress  >= 100) smelled = true;
/// @description Outline/Show if mouse is over it

// Outline when hovered
image_index = position_meeting(mouse_x, mouse_y, self);

if (mouse_check_button(mb_left) && (position_meeting(mouse_x, mouse_y, self)))
{
	smellProgress = min(smellProgress+1, 100); // Increment smell progress when clicked
} else {
	smellProgress = max(smellProgress-1, 0); // Decrement smell progress when not clicked
}

// Reveal once smellProgress = 100%
if (smellProgress  >= 100) smelled = true;
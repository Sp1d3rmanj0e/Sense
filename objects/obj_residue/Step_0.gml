/// @description Outline/Show if mouse is over it

// Check if mouse is over residue
if (position_meeting(mouse_x, mouse_y, self))
{
	image_index = 0; // Outlined
	
	// Show the sense if clicked
	if (mouse_check_button_pressed(mb_left))
	{
		smelled = true;
	}
}
else // Mouse is not over residue
{
	image_index = 1; // Not outlined
}
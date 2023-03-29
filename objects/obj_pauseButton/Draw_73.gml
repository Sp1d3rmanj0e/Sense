/// @description Insert description here
// You can write your code in this editor

// Default border settings
draw_set_color(defaultColor);

// Check if mouse is hovering over
if (point_in_rectangle(mouse_x, mouse_y, x, y, x+width, y+height))
{
	draw_set_color(selColor);
	
	// Check if button was clicked
	var _clicked = mouse_check_button_pressed(mb_left);
	
	if (options[0] != -1) 
	{
		if (isToggle)
		{
		
			if (_clicked) // Toggles between 1 and 0 (the two options)
				selected = !selected; 
		}
		else
		{
			/*
			* If the mouse clicks on the left side,
			* decrement selected until it reaches 0
			* 
			* If the mouse clicks on the right side,
			* increment until selected is one less than
			* the array length.
			*/
		
			// Check if mouse is on the left side
			if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width/2, y+height))
			{
				draw_decor_arrow(x, y + height/2, height/2, 4, 5, 2);
			
				if (_clicked) // Decrement selected
					selected = max(selected-1, 0);
			}
			else // Mouse is on the right side
			{
				draw_decor_arrow(x+width, y + height/2, height/2, -4, 5, -2);
			
				if (_clicked) // Increment selected
					selected = min(selected+1, array_length(options)-1);
			}
		}
	}
	
	// Activate the button if clicked
	if (_clicked)
		event_user(0);
}


// Middle Center Alignment
draw_set_halign(fa_center);
draw_set_valign(fa_center);

// Draw only the title when the button
// has no options.  Otherwise, draw both.
if (options[0] != -1)
{
	// Draw the button name (1/4 inwards)
	draw_text(x + titleOffset, y + height/2, text);

	// Draw the selected value (2/3 inwards)
	draw_text(x + valueOffset, y + height/2, options[selected]);
}
else
{
	draw_text(x + width/2, y+height/2, text);	
}

// Reset Draw Alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw box around button
draw_roundrect(x, y, x+width, y+height, true);
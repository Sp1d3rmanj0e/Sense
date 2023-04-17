/// @description Insert description here
// You can write your code in this editor

// Set border color
draw_set_color(colorMain); 

// Draw border
draw_rectangle(paddingH, paddingV, room_width - paddingH, room_height - paddingV - bottomPadding, true);

var _width = room_width - paddingH*2; // How much space we have for the buttons
var _x1,_y1,_x2,_y2;

// Set to leaderboard font
draw_set_font(fnt_leaderboard);

#region difficulty buttons

// Draw buttons (4)
var _buttonWidth = _width/4 + 0.25; // How much space each button will take

for (var i = 0; i < 4; i++)
{
	// Get the button dimensions
	_x1 = paddingH + _buttonWidth * i;
	_y1 = paddingV;
	_x2 = paddingH + _buttonWidth*(i+1) -2;
	_y2 = paddingV + buttonHeight;
	
	// Check if mouse is hovering over button
	if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2))
	{
		draw_set_color(colorHover);
		
		if (mouse_check_button_pressed(mb_left))
		{
			difficultySel = i;
		}
	}
	
	// Draw the button
	draw_rectangle(_x1, _y1, _x2, _y2, true); // Outline
	
	// Fill button if it is selected
	if (difficultySel == i)
	{
		draw_set_color(colorFill);
		draw_rectangle(_x1, _y1, _x2, _y2, false);
		
		// Draw text white if selected
		draw_set_color(colorText)
	}
	else
	{
		// Draw text fill color if not selected
		draw_set_color(colorFill);
	}

	// Draw the text
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(_x1 + _buttonWidth/2, _y1 + buttonHeight/2,
			getDiffTitle(i));
			
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	



	
	// Reset color in case it got changed
	draw_set_color(colorMain); 
}

#endregion difficulty buttons

#region category buttons

// Get the button width for 2 options
_buttonWidth = _width/2;

// Draw the two buttons
for (var i = 0; i < 2; i++)
{
	// Set the default border color
	draw_set_color(colorMain);
	
	// Get the dimensions for both buttons
	_x1 = paddingH + _buttonWidth * i;
	_y1 = paddingV + buttonHeight +1;
	_x2 = paddingH + _buttonWidth * (i+1) -1;
	_y2 = paddingV + buttonHeight*2 +1;
	
	// Check if mouse is hovering over one of the buttons
	if (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2))
	{
		// Switch to hover color if hovered over
		draw_set_color(colorHover);
		
		// Check if clicked
		if (mouse_check_button_pressed(mb_left))
		{
			categorySel = i;
		}
	}
	
	draw_rectangle(_x1, _y1, _x2, _y2, true);
	
	// Draw a filled rectangle if button was selected
	if (categorySel == i)
	{
		// Set to fill color
		draw_set_color(colorFill);
		
		// Draw fill rectangle
		draw_rectangle(_x1, _y1, _x2, _y2, false);
			
		// Draw text white if selected
		draw_set_color(colorText)
	}
	else
	{
		// Draw text fill color if not selected
		draw_set_color(colorFill);
	}
	
	// Draw text to go on the buttons
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(_x1 + _buttonWidth/2, _y1 + buttonHeight/2, getCategoryTitle(i));
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Reset the color
	draw_set_color(colorMain);
}

#endregion category buttons

if (categorySel == 0) // Time completed
{
	draw_array(topTimeCompleted[difficultySel]);
}
else // Sense Use time
{
	draw_array(topSenseUseTime[difficultySel]);
}

// Reset font
draw_set_font(-1);
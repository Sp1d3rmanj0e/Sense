/// @description Insert description here
// You can write your code in this editor

// If clicked, tell parent to set this button as the selected button
if ((position_meeting(mouse_x, mouse_y, id)) 
&& (mouse_check_button_pressed(mb_left)))
{
	with(parent)
		change_sense(other.sense);
}
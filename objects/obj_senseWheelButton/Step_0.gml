/// @description Insert description here
// You can write your code in this editor

// Clicked checker
if ((position_meeting(mouse_x, mouse_y, id)) 
&& (mouse_check_button_pressed(mb_left)))
{
	with(parent) // Tell parent to set this button as the selected button
		change_sense(other.sense);
		
	if (instance_exists(obj_player))
		obj_player.curSense = sense;
}
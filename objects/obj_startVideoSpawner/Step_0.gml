/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_escape)
|| gamepad_button_check_pressed(global.connectedPad, gp_select)
|| gamepad_button_check_pressed(global.connectedPad, gp_start))
{
	event_user(0);
}
/// @description SKip

if (keyboard_check_pressed(vk_escape)
|| gamepad_button_check_pressed(global.connectedPad, gp_face3))
{
	event_user(0);
}
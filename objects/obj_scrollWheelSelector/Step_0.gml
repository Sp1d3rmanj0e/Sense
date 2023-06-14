/// @description Scrolling

if ((keyboard_check_pressed(vk_left))
|| (keyboard_check_pressed(ord("A"))
|| (gamepad_button_check_pressed(global.connectedPad, gp_padl))))
{
	scroll_right();
}

if ((keyboard_check_pressed(vk_right))
|| (keyboard_check_pressed(ord("D"))
|| (gamepad_button_check_pressed(global.connectedPad, gp_padr))))
{
	scroll_left  ();
}
/// @description Skip Cutscene

if (keyboard_check_pressed(vk_escape)
|| gamepad_button_check_pressed(global.connectedPad, gp_select)
|| gamepad_button_check_pressed(global.connectedPad, gp_start))
{
	layer_sequence_destroy(layID);
	room_goto(rm_selGadget);
}
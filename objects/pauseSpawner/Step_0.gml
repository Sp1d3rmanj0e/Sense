/// @description Open/Close
if (keyboard_check_pressed(vk_escape)
|| (gamepad_button_check_pressed(global.connectedPad, gp_start)))
{
	
audio_play_sound(snd_pauseMenuOpen, 1, 0);

if (!global.settingKeybind) // Don't leave the settings room until
							// the keybind being set is complete
{
	gamePaused = !gamePaused; // Toggle game paused

	if (gamePaused)
	{
		event_user(1);
	}
	else
	{
		event_user(0);
	}
}

}
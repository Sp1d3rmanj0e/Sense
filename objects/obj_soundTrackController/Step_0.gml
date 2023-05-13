/// @description

if (currentSound != noone)
{
	if (!audio_is_playing(currentSound) && alarm[0] == -1)
	{
		alarm[0] = 3 * room_speed;
	}
}
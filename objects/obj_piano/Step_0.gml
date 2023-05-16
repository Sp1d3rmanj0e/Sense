/// @description Insert description here
// You can write your code in this editor

// Check if player is close to the piano
if ((distance_to_object(obj_player) < 50)
	&& (point_direction(x, y, obj_player.x, obj_player.y) > 230)
	&& (point_direction(x, y, obj_player.x, obj_player.y) < 300))
{
	image_index = 1; // Highlighted
	
	// Play the jingle if the player interacts with it
	if (keyboard_check_pressed(global.kb_keyInteract) && (!playingSong)) 
	{
		music = audio_play_sound(snd_jingle, 1, 0);
		playingSong = true;
		alarm[0] = 15 * room_speed; // Time before playing song again
	}
}
else
{
	image_index = 0; // Not highlighted
	if (music != noone)
	{
		audio_stop_sound(music);
		music = noone;
		playingSong = false;
	}
}
/// @description Insert description here
// You can write your code in this editor

uptime = 10 * room_speed;
alarm[0] = uptime;

audio_play_sound(snd_Decoy_placed, 1, false);

// Lure vars
lureRadius = 10 * WORLD.CELL_SIZE;

with(enemies)
{
	if (distance_to_object(other.id) < other.lureRadius)
		goto(path, other.x, other.y, eSpeed, global.grid);
}

// Spawn sound control
if (!instance_exists(obj_soundControl))
	instance_create_layer(0, 0, "Instances", obj_soundControl);
	
// Create the emitter
sound = audio_emitter_create();
	
// Give the emitter default stats
audio_emitter_falloff(
	sound, lureRadius,
	obj_soundControl.start_dropping_off_at,
	obj_soundControl.multiplier);
						  
// Play the emitter on loop
audio_play_sound_on(sound, snd_decoyNoise, 1, 1);
	
// Place the emitter on its creator
audio_emitter_position(sound, x, y, 0);
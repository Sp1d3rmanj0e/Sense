/// @description

audio_stop_all();


var _newSound = noone;

if (room == rm_intro) _newSound = snd_mainMenu;
else if (room == rm_credits) _newSound = snd_credits;
else if (instance_exists(obj_player))
{
	switch(global.level)
	{
		case 1:  _newSound = snd_backgroundNoise1;
		case 2:  _newSound = snd_backgroundNoise2;
		case 3:  _newSound = snd_backgroundNoise3;
		case 4:  _newSound = snd_backgroundNoise4;
		case 5:  _newSound = snd_backgroundNoise5;
	}
}

if (_newSound != noone)
{
	audio_play_sound(_newSound, 2, true);
}
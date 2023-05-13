/// @description Play the soundtrack

/*
	This search checks songs in 3 different ways
	
	1) Check if the current room is any tutorial room
	
	2) Check if the current room matches a specific soundtrack
	
	3) Select a soundtrack based on the current level
	
*/

var _newSound = noone;

// Soundtrack to play if in any tutorial room
// All tutorial room names start with rm_tut.  If it has that, it's a tutorial room
if (string_copy(room_get_name(room), 1, 6) == "rm_tut")
{
	_newSound = snd_tutorial;
}


// Specific room soundtracks
switch(room)
{
	case rm_intro: _newSound = snd_mainMenu; break;
	case rm_credits: _newSound = snd_credits; break;
	case rm_leaderboard: 
	case rm_setScore: _newSound = snd_tutorial; break;
	case rm_selGadget: _newSound = snd_gadgetSelection; break;
}

// If we're on a room, select soundtrack based on level
if (instance_exists(obj_player))
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
	// If the new sound is the same as the old sound, no point
	// in restarting the soundtrack
	if (_newSound != currentSound)
	{
		currentSound = _newSound;
		audio_stop_all(); // Stop old sound before starting new sound
		audio_play_sound(_newSound, 2, 1);
	}
}
else
{
	audio_stop_all(); // There is no new soundtrack to replace the old one
	currentSound = noone;
}
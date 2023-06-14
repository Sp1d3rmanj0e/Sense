/// @description Scroll up one sense

/*

// Create a variable to store the theoretical new sense
// If no current sense is selected, assume it starts at 0
var _newCurSense = 0;
if (obj_player.curSense != SENSE.NONE)
{
	var _newCurSense = obj_player.curSense + 1;
	if (_newCurSense > 4) _newCurSense = 0;
}

// OUTLINE
// There are 5 senses from 0-4.  When scrolling up, if that
// number goes over 4, it will drop back to 0 and start again

// NOTE
// It must also be noted that if a sense is deactivated, the player
// should not be able to scroll to it.  In these cases, check to confirm
// that the sense is not deactivated.  If it is, go to the next one.

// EDGE CASE
// Only loop one time, though as if there is only one sense available, we
// do not want an infinite loop

// Loop through every other sense until a suitable replacement is found
for (var i = 0; i < 4; i++)
{
	// Loop through every lost sense there is.  If any match, 
	// check the next sense in line for replacement
	var _isValidNewSense = check_if_sense_is_lost(_newCurSense);
	
	if (!_isValidNewSense) 
	{
		// Get the next sense in line, then loop again
		_newCurSense++;
		if (_newCurSense > 4) _newCurSense = 0;
		continue;
	}
	
	// Replacement is found, set player's new sense to _newCurSense
	obj_player.curSense = _newCurSense;
	audio_play_sound(snd_senseWheelSwap, 1, false);
}

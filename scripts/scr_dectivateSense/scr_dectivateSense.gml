// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function deactivateSense(_sense)
{
	// Loop through the senses already deactivated
	// Check if the sense we want to deactivate is already deactivated
	// If not, deactivate it
	var senseAlreadyTaken = false;
	for (var i = 0; i < array_length(global.lostSenses); i++)
	{
		if (global.lostSenses[i] == _sense)
		{
			senseAlreadyTaken = true;
		}
	}
	
	// Deactivate the sense
	if (!senseAlreadyTaken)
		array_push(global.lostSenses, _sense);
}
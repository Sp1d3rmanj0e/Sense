/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

// Stores the sense it represents
sense = SENSE.NONE;

// Grow and shrink effects
minSize = 2;
maxSize = 2.2;
hover = 0;
changeSp = 0.15;

// Sense loss
deactivated = false; // Default to being on

// Turn off the button if sense is lost
var _sensesLost = global.lostSenses; // Get the lostSenses array
for (var i = 0; i < array_length(_sensesLost); i++)
{
	// If this button held a lost sense, deactivate (unactivatable)
	if (_sensesLost[i] == sense)
	{
		deactivated = true;
	}
}

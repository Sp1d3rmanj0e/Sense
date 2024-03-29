// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Loop through the senses already deactivated
// Check if the sense we want to deactivate is already deactivated
// If not, deactivate it
function deactivateSense(_sense)
{
	var senseAlreadyTaken = false;
	for (var i = 0; i < array_length(global.lostSenses); i++)
	{
		if (global.lostSenses[i] == _sense)
			senseAlreadyTaken = true;
	}
	
	// Deactivate the sense
	if (!senseAlreadyTaken)
		array_push(global.lostSenses, _sense);
	
	resetCounters(); // Reset so it doesn't carry to the next round
}

global.counters = [0, 0, 0, 0, 0]; // How much of each sense was used (Five 0s for each sense)

// Increments the counter based on which sense was used
function incrCounter(_sense)
{
	// FEEL HEAR SEE SMELL TASTE
	var _multiplier = [1.4, 1.2, 1, 10, 3]; // Increases the weight of using a sense. 
											 // (3 frames use time * 1.5 multiplier = 4.5 counters)
	var _mult = _multiplier[_sense];  // Gets the multiplier for set sense
	global.counters[_sense] += _mult; // Adds multiplier value to the sense counter
}

// Returns the sense most used
function getMaxSense()
{
	var _maxCounter = 0;
	var _maxSense = SENSE.NONE;
	
	log(string(global.counters));
	
	// Loop through all 5 senses
	for (var i = 0; i < 5; i++)
	{
		var _counter = global.counters[i]; // Get the counter value at specific sense
		
		// Check if counters on this sense are
		// higher than the current max counter
		if (_counter > _maxCounter) {
			_maxCounter = _counter;				// Store the highest counter value
			_maxSense   = i;					// Store the enum of said counter
		}
	}
	
	logVal("max sense", _maxSense);
	
	// Return the sense most used
	return _maxSense;
}

function resetCounters()
{
	global.counters = [0, 0, 0, 0, 0];
}

function resetLostSenses()
{
	global.lostSenses = [];
}

function resetLostGadgets()
{
	global.lostGadgets = [];
}

function getLoseSenseSequence(_sense)
{
	switch(_sense)
	{
		case SENSE.SEE: return sq_loseSenseSight;
		case SENSE.HEAR: return sq_loseSenseHear;
		case SENSE.SMELL: return sq_loseSenseSmell;
		case SENSE.TASTE: return sq_loseSenseTaste;
		case SENSE.FEEL: return sq_loseSenseFeel;
		default: return sq_loseSense;
	}
}
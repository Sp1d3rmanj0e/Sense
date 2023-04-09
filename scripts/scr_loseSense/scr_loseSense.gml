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
	//{SEE, HEAR, FEEL, TASTE, SMELL}
	var _multiplier = [1, 1.2, 1.4, 3, 1.3]; // Increases the weight of using a sense. 
											 // (3 frames use time * 1.5 multiplier = 4.5 counters)
	var _mult = _multiplier[_sense];  // Gets the multiplier for set sense
	global.counters[_sense] += _mult; // Adds multiplier value to the sense counter
}

// Returns the sense most used
function getMaxSense()
{
	var _maxCounter = 0;
	var _maxSense = SENSE.NONE;
	
	// Loop through all 5 senses
	for (var i = 0; i < 5; i++)
	{
		var _counter = global.counters[i]; // Get the counter value at specific sense
		
		// Check if counters on this sense are
		// higher than the current max counter
		if (_counter > _maxCounter) {
			_maxCounter = _counter;				// Store the highest counter value
			_maxSense   = numToSense(i); // Store the enum of said counter
		}
	}
	
	// Return the sense most used
	return _maxSense;
}

// Turns the number index into the enum version (SENSE.)
function numToSense(_num)
{
	switch(_num)
	{
		case 0: return SENSE.SEE;
		case 1: return SENSE.HEAR;
		case 2: return SENSE.FEEL;
		case 3: return SENSE.TASTE;
		case 4: return SENSE.SMELL;
		default: return SENSE.NONE;
	}
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
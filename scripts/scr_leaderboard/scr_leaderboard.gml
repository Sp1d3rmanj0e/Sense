
// Contains any and all leaderboard functions

function add_score(_name, _score, _difficulty, _category)
{
	// Initialize a var to store the array pointer
	var _array;
	
	if (_category == 0) // global.topTimeCompleted
		_array = global.topTimeCompleted;
	else // topSenseTimeUse
		_array = global.topSenseUseTime;
	
	var _numPanels = array_length(_array[_difficulty]);
	
	if (_numPanels != 0)
	{
		log("pushing normally");
		for (var i = 0; i < _numPanels; i++)
		{
			var _curScore = _array[_difficulty][i][1];
			
			// If score is better than current score,
			// Shift all scores further down one to the right,
			// Insert the new score, then
			// remove the last value of the array (because the length is now 13)
			if (_score < number_to_time(_curScore, false))
			{
				// Add an extra slot on the array (so the 12th slot has somewhere to go)
				// when it gets shifted right
				array_push(_array[_difficulty], -1);
				
				// Shift the arrays one to the right
				for (var j = _numPanels-1; j >= i; j--)
				{
					_array[_difficulty][j+1] = _array[_difficulty][j];
				}
				
				// Pop the last value
				array_pop(_array[_difficulty]);
				
				// Insert new score in the new empty space
				_array[_difficulty][i] = [_name, number_to_time(_score, true)];
				
				log("found new position");
				
				return; // Stop the function immediately after adding the value
			}
		}
		
		if (_numPanels < 12)
		{
			array_push(_array[_difficulty], [_name, number_to_time(_score, true)]);
		}
	}
	else
	{
		log("pushing abnormally");
		array_push(_array[_difficulty], [_name, number_to_time(_score, true)]);
	}
}

function get_rank(_time, _difficulty, _category)
{
	// Turn score from a string into a number
	_time = number_to_time(_time, false);
	
	// Initialize the array to check
	var _array;
	
	// Get the array for the correct category
	if (_category == 0)
		_array = global.topTimeCompleted;
	else
		_array = global.topSenseUseTime;
	
	for (var i = 0; i < array_length(_array[_difficulty]); i++)
	{
		var _curScore = number_to_time(_array[_difficulty][i][1], false);
		
		if (_time < _curScore)
			return i+1; // If the score did better than another one, return that new position
	}
	
	return -1; // Did not have a top 12 rank
}
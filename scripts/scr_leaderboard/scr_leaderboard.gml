
// Contains any and all leaderboard functions

/*
 * > Takes a player name, score, difficulty, and category
 * > Finds its rank among other players in the category
 * > Places their score on the leaderboard if applicable
 */
function add_score(_name, _score, _difficulty, _category)
{
	log("Player: " + _name + " with score: " + string(_score) + " on difficulty: " + string(_difficulty) + " on category: " + string(_category));

	var _numButtons = 10;
	
	// Initialize a var to store the array pointer
	var _array;
	
	if (_category == 0) // global.topTimeCompleted
		_array = global.topTimeCompleted;
	else // topSenseTimeUse
		_array = global.topSenseUseTime;
	
	var _numPanels = array_length(_array[_difficulty]);
	
	if (_numPanels != 0)
	{
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
				// (Only necessary if leaderboard at max capacity)
				if (_numPanels >= _numButtons)
					array_pop(_array[_difficulty]);
				
				// Insert new score in the new empty space
				_array[_difficulty][i] = [_name, number_to_time(_score, true)];
				
				log(string(_array[_difficulty]));
				
				save_leaderboard_data();
				
				return; // Stop the function immediately after adding the value
			}
		}
		
		// If there's an empty spot on the leaderboard,
		// fill that spot with new data
		if (_numPanels < _numButtons)
		{
			array_push(_array[_difficulty], [_name, number_to_time(_score, true)]);
		}
	}
	else
	{
		array_push(_array[_difficulty], [_name, number_to_time(_score, true)]);
	}
	
	save_leaderboard_data();
}

function get_rank(_time, _difficulty, _category)
{
	// Turn score from a string into a number
	_time = number_to_time(_time, false);
	
	logVal("Time", _time);
	
	// Initialize the array to check
	var _array;
	
	// Get the array for the correct category
	if (_category == 0)
		_array = global.topTimeCompleted;
	else
		_array = global.topSenseUseTime;
	
	// Only check array if there is stuff to check in the array
	if (array_length(_array[_difficulty]) > 0)
	{
		for (var i = 0; i < array_length(_array[_difficulty]); i++)
		{
			var _curScore = number_to_time(_array[_difficulty][i][1], false);
			
			logVal("Current score check", _curScore);
			
			if (_time < _curScore)
			{
				log("My time: " + string(_time) + ".  Time beat: " + string(_curScore));
				logImportant(string(i+1));
				return i+1; // If the score did better than another one, return that new position
			}
		}
		
		// If not all 10 spots are full, there will always be a spot for the new score no matter what
		if (i < 10) return i+1;
	}
	else // Otherwise, return first place because it's the only value
	{
		log("Time was only value");
		return 1;
	}
	
	log("Not a top 10 rank");
	return -1; // Did not have a top 10 rank
}

/*
 * @param _num - the value to change types
 * @param _toString - 
 *		True: Turns a number into a string
 *		Ex, 12.32 -> 12:32
 *		False: Turns a string in form ##:## to a num
 *		Ex, 12:32 -> 12.32
 */
function number_to_time(_num, _toString)
{
	// Turn the number into a string
	_num = string(_num);
	
	// Initialize vars because they might be used more than once
	var i;
	var _charAtInd;
	var _stringLen = string_length(_num);
	
	if (_toString)
	{
	
	// Check if the number is in format # or #.##
	// If it is the former, turn it into format #.##
	// and then return it
	var _hasDecimal = false;
	for (i = 0; i < _stringLen; i++)
	{
		_charAtInd = string_char_at(_num, i);
		
		if (_charAtInd == ".")
			_hasDecimal = true;
	}
	
	// If it had no decimal, append :00 to the end
	// and return it as it is
	// Ex, 1 -> 1:00
	if (!_hasDecimal)
		return _num + ":00";

	}
	
	// Replace "." with ":" (or V/V)
	// Ex, 1.23 -> 1:23
	var _return = "";
	
	for (i = 1; i < _stringLen+1; i++)
	{
		// Get the letter at position
		_charAtInd = string_char_at(_num, i);
		
		// If the letter was ".", replace it with ":" (or V/V)
		if ((_charAtInd == ".") && (_toString)) // . -> :
			_return += ":";
		else if ((_charAtInd == ":") && (!_toString)) // : -> .
			_return += ".";
		else
			_return += _charAtInd; // Otherwise, just readd the same letter
	}
	
	if (_toString)
	{
		// Return the fixed string
		return _return;
	}
	else
	{
		// Return the number
		return real(_return);
	}
}

function load_leaderboard_data()
{
	if (file_exists("savedgame.save"))
	{
		var _buffer = buffer_load("savedgame.save");
		var _string = buffer_read( _buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse( _string);
	
		show_debug_message(_loadData);
	
		// The array is stored as follows
		/*
			* [
			*  global.topTimeCompleted [
			*
			*   easy [ top12 [ [TITLE, VALUE] ] ]
			*   medium [ "" ]
			*   hard [ "" ]
			*   hardcore [ "" ]
			*
			*  ]
			*
			*  global.topSenseUseTime [ "" ]
			* ]
			*
			* In other words
			* [CATEGORY] > [DIFFICULTY] > [POSITION (1-12)] > [TITLE or VALUE]
			*/
	
		var _topTimeCompleted = _loadData[0];
		var _topSenseUseTime = _loadData[1];
	
		global.topTimeCompleted = _topTimeCompleted;
		global.topSenseUseTime = _topSenseUseTime;
	}
	else
	{
		global.topSenseUseTime  = [[],[],[],[]];
		global.topTimeCompleted = [[],[],[],[]];
	}
	
	if (global.ip != noone) load_leaderboard_data_server();
}

function save_leaderboard_data()
{
	// Get the array of data from leaderboard
	var _saveData = [global.topTimeCompleted, global.topSenseUseTime];

	// Turn all the data into a JSON string and save it via a buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "savedgame.save");
	buffer_delete(_buffer);

	show_debug_message("Game saved! " + _string);
	
	if (global.ip != noone) save_leaderboard_data_server();
}

function load_leaderboard_data_server()
{
	if (!instance_exists(obj_leaderboardServer))
		instance_create_layer(0, 0, "Instances", obj_leaderboardServer)
	
	with(obj_leaderboardServer)
	{
		sendListOverUDP(global.ip, 8080, [], msgType.GET_DATA);
	}
}

function save_leaderboard_data_server()
{
	
	if (!instance_exists(obj_leaderboardServer))
		instance_create_layer(0, 0, "Instances", obj_leaderboardServer)
	
	with(obj_leaderboardServer)
	{
		// Store the leaderboard into a single array
		var _saveData = [global.topTimeCompleted, global.topSenseUseTime];

		// Send the data to the server
		sendListOverUDP(global.ip, 8080, _saveData, msgType.STORE_DATA);
	}
}

// Special thanks to navidcrt at https://www.youtube.com/@navidrct for the code
function sendListOverUDP(ip, port, data, type){
	
	// Connect to the server
	network_connect_raw(global.client, ip, port);
	
	// Encode the data
	array_insert(data, 0, type); // add the action command at the start of the array
	var dataJson = json_stringify(data); // Turn the ds_list into a string
	var data_size = string_byte_length(dataJson); // Get the byte size of the string
	show_debug_message("> " + dataJson);
	
	// Send the data
	var buffer = buffer_create(data_size, buffer_fixed, 1);
	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_text, dataJson); // Add the data to the buffer
	network_send_udp_raw(global.client, ip, port, buffer, buffer_tell(buffer)); // Send the data to server
}
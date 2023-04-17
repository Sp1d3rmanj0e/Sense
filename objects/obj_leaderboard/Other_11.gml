/// @description Load Leaderboard Data

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
	global.topSenseUseTime  = [];
	global.topTimeCompleted = [];
}
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
	 *  topTimeCompleted [
	 *
	 *   easy [ top12 [ [TITLE, VALUE] ] ]
	 *   medium [ "" ]
	 *   hard [ "" ]
	 *   hardcore [ "" ]
	 *
	 *  ]
	 *
	 *  topSenseUseTime [ "" ]
	 * ]
	 *
	 * In other words
	 * [CATEGORY] > [DIFFICULTY] > [POSITION (1-12)] > [TITLE or VALUE]
	 */
	
	var _topTimeCompleted = _loadData[0];
	var _topSenseUseTime = _loadData[1];
	
	obj_leaderboard.topTimeCompleted = _topTimeCompleted;
	obj_leaderboard.topSenseUseTime = _topSenseUseTime;
}
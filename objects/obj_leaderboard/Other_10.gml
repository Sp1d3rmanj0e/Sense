/// @description Save Leaderboard Data

// Get the array of data from leaderboard
var _saveData = [global.topTimeCompleted, global.topSenseUseTime];

// Turn all the data into a JSON string and save it via a buffer
var _string = json_stringify(_saveData);
var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.save");
buffer_delete(_buffer);

show_debug_message("Game saved! " + _string);
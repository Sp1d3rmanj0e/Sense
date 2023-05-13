/// @description Get server data + load server leaderboard

if (async_load[? "size"] > 0) && (global.ip != noone)
{
	try {
		var _buffer = async_load[? "buffer"];
		buffer_seek(_buffer, buffer_seek_start, 0);
		var _data = buffer_read(_buffer, buffer_string);
	
		show_debug_message("Data before decoding: " + string(_data));
		var _dataDecoded = json_parse(_data);
		show_debug_message("< " + string(_dataDecoded));
	
		show_debug_message("Data after decoding: " + string(_dataDecoded));
	
		// _data[command, global.topTimeCompleted, global.topSenseUseTime]
		global.topTimeCompleted = _dataDecoded[1];
		global.topSenseUseTime = _dataDecoded[2];
	}
	catch(e)
	{
		log("Server doesn't exist");
		log(string(e));
	}
	
}

// Thanks to https://www.reddit.com/r/gamemaker/comments/27yoe1/gms_networking_how_to_get_clients_local_ipv4/
// for the information
if (global.ip == noone)
{
	global.ip = string(ds_map_find_value(async_load, "ip")); // Get the ip of the user
	load_leaderboard_data_server();
}
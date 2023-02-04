/// @description Move heartbeat across screen


#region beat move code
// Increment all x locations in ds_list (remove if too far along)
for (var i = 0; i < ds_list_size(beats); i++)
{
	// get the current value
	var _curVal = ds_list_find_value(beats, i);
	
	// If x is larger than end X location, remove it
	if (_curVal > endBeatX)
	{
		ds_list_delete(beats, i);
		
		// Lower i by 1 because location was removed
		i--;
	}
	else
	{
	// Increment value
	_curVal += beatSpeed;
	
	// Set new val in ds_list
	ds_list_set(beats, i, _curVal);
	}
}
#endregion
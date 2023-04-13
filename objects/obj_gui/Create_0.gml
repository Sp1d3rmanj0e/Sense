/// @description Insert description here
// You can write your code in this editor

#region healthbars
// View properties
camWidth = camera_get_view_width(view_camera[0]);
	
// Bar properties
healthbarWidth = 500;
usesBarWidth = 400;
barHeight = 20;
rightPadding = sprite_get_width(spr_gadget_button)*1.75; // Push the bars left from the right wall by this value
topPadding = 10; // Spacing between the roof and other bars
	
// Bar locations
barEnd			= camWidth - rightPadding;
healthbarStart	= barEnd - healthbarWidth;
usesBarStart	= barEnd - usesBarWidth;
#endregion healthbars

// Functions

function check_if_sense_is_lost(_sense)
{
	var _isValidSense = true
	
	for (var lostSenses = 0; lostSenses < array_length(global.lostSenses); lostSenses++)
	{
		if (_sense == global.lostSenses[lostSenses])
			_isValidSense = false;
	}
	
	return _isValidSense;
}
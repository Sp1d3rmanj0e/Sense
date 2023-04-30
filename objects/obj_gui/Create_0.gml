/// @description

#region healthbars
// View properties
camWidth = camera_get_view_width(view_camera[0]);
	
// Bar properties
healthbarWidth = 500;
usesBarWidth = 400;
barHeight = 20;
rightPadding = sprite_get_width(spr_gadget_button) + 48; // Push the bars left from the right wall by this value
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

function draw_healthbar_divider(_x, _y, _width, _height, _numDividers, _slantIntensity, _icon = noone)
{
	var _dividerX, _bottomY;
	
	var _spacingPerDivider = _width/(_numDividers+1);
	
	// Draw the dividers
	for (var i = 0; i < _numDividers; i++)
	{
		_dividerX = _x + _spacingPerDivider * (i+1);
		_bottomY = _y + _height;
		
		draw_line_width(_dividerX - _slantIntensity, _y-1,
						_dividerX + _slantIntensity, _bottomY+1, _slantIntensity*2);
	}
	
	// Draw line over and under the healthbar
	draw_line_width(_x-1, _y+_height, _x+_width, _y+_height, _slantIntensity);
	draw_line_width(_x-1, _y, _x+_width, _y, _slantIntensity);
	
	// Draw icons on the cells if there are any
	if (_icon != noone)
	{
		// Put an icon in every cell
		var _cells = _numDividers + 1;
		var _cellWidth = _width/_cells;
		for (i = 0; i < _cells; i++)
		{
			draw_sprite(_icon, 0, _x + _cellWidth/2 + _cellWidth*i, _y + _height/2);
		}
	}
}
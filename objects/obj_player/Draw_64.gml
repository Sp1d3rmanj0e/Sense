/// @description Insert description here
// You can write your code in this editor

function seconds_to_minutes_decimal(_secondsDecimal)
{
	var _minutes = floor(_secondsDecimal/0.60); // Finds how many minutes there were (excluding remaining seconds)
	var _seconds = _secondsDecimal mod 0.60; // Finds how many remaining seconds there are
	
	return _minutes + _seconds;
}

draw_set_color(c_white);
draw_text(10, 40, global.timeCompleted);
draw_text(10, 60, seconds_to_minutes_decimal(global.timeCompleted));
draw_text(10, 80, number_to_time(seconds_to_minutes_decimal(global.timeCompleted), true));
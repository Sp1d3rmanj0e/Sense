/// @description Initialize vars

load_leaderboard_data();

keyboard_string = "";

// Start cursor flashing
alarm[0] = 1;
cursorVisible = false;

// Get the drawing colors
colorMain   = make_color_rgb(125,0,25);
colorFill   = make_color_rgb(147,49,69);
colorText = make_color_rgb(177,171,171);
colorHover = c_white;

// Name input vars
name = "";

// Functions

// Will tell the player their score on a category
function draw_section(_x, _y, _width, _height, _title, _score, _difficulty, _category)
{
	logImportant(string(get_rank(_score,_difficulty,_category)));
	
	// Translate incoming params to usable data
	var _ranking = string(get_rank(_score, _difficulty, _category));
	if (_ranking == -1) _ranking = " >10"
	
	_score = number_to_time(_score, true);
	
	// Draw the title
	draw_set_color(colorText);
	draw_set_font(fnt_leaderboard);
	draw_set_halign(fa_center);
	draw_text(_x+_width/2, _y, _title);
	
	// Draw line under the title
	draw_set_color(colorMain);
	var _stringHeight = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
	var _lineWidth = 5;
	draw_line_width(_x, _y + _stringHeight, _x+_width, _y+_stringHeight, _lineWidth);
	
	// Bottom Quadrant setup
	draw_set_valign(fa_top);
	
	// Draw quadrant divider line
	draw_line_width(_x+_width/2, _y+_stringHeight, _x+_width/2, _y+_height-10, _lineWidth);
	
	// Draw the score/time (Quadrant III)
	draw_text(_x+_width*(1/4), _y + _height/2, "Time: " + _score);
	
	// Draw the ranking (Quadrant IV)
	draw_text(_x+_width*(3/4), _y + _height/2, "Rank: #" + _ranking);
	
	// Reset draw conditions
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(-1);
	draw_set_font(-1);
}

function draw_continue_button(_width, _height, _y)
{
	
	// Get coordinates of button
	var _x1, _y1, _x2, _y2;
	_x1 = room_width/2 - _width/2;
	_y1 = _y;
	_x2 = room_width/2 + _width/2;
	_y2 = _y + _height;
	
	// Check if mouse is touching button
	var _touchingMouse = (point_in_rectangle(mouse_x, mouse_y, _x1, _y1, _x2, _y2));
	
	// Change colors if hovered
	if (_touchingMouse) draw_set_color(colorHover);
	else				draw_set_color(colorMain);
	
	// Draw the button
	draw_roundrect(_x1, _y1, _x2, _y2, true);
		
	// Draw button text ("CONTINUE")
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(fnt_leaderboard);
	draw_text(room_width/2, _y1 + _height/2, "CONTINUE");
	
	return _touchingMouse;
}

// Ex. 10.79 -> 17:59
function seconds_to_minutes_decimal(_secondsDecimal)
{
	var _minutes = floor(_secondsDecimal/0.60); // Finds how many minutes there were (excluding remaining seconds)
	var _seconds = _secondsDecimal mod 0.60; // Finds how many remaining seconds there are
	
	return _minutes + _seconds;
}
/// @description Insert description here
// You can write your code in this editor

#region (UNUSED) Default scores for the people
/*
global.topTimeCompleted = [
					[["BEN DOVER0", 5.15],["JACK SPARROW", 5.16],
					["BEAN DOG", 7.12],["PIKACHU",7.56],
					["YOUR MOM", 8.43],["BLING CXIJN", 9.28],
					["HOO HAA", 10.00],["OOPSIE", 10.02],
					["COMPUTER MAN", 10.45],["ALEXAPLAYDESPACITO", 11.11]],
					
					[["BEN DOVER1", 5.15],["JACK SPARROW", 5.16],
					["BEAN DOG", 7.12],["PIKACHU",7.56],
					["YOUR MOM", 8.43],["BLING CXIJN", 9.28],
					["HOO HAA", 10.00],["OOPSIE", 10.02],
					["COMPUTER MAN", 10.45],["ALEXAPLAYDESPACITO", 11.11]],
					
					[["BEN DOVER2", 5.15],["JACK SPARROW", 5.16],
					["BEAN DOG", 7.12],["PIKACHU",7.56],
					["YOUR MOM", 8.43],["BLING CXIJN", 9.28],
					["HOO HAA", 10.00],["OOPSIE", 10.02]],
					
					[["BEN DOVER3", 5.15],["JACK SPARROW", 5.16],
					["BEAN DOG", 7.12],["PIKACHU",7.56],
					["YOUR MOM", 8.43],["BLING CXIJN", 9.28],
					["HOO HAA", 10.00],["OOPSIE", 10.02],
					["COMPUTER MAN", 10.45],["ALEXAPLAYDESPACITO", 11.11]]
					];
global.topSenseUseTime  = [
					[["BEN DOVER00", 1.11],["JACK SPARROW", 2],
					["BEAN DOG", 3],["PIKACHU", 4.44],
					["YOUR MOM", 5],["BLING CXIJN", 6],
					["HOO HAA", 7],["OOPSIE", 8.33],
					["COMPUTER MAN", 9],["ALEXAPLAYDESPACITO", 10]],
					
					[["BEN DOVER11", 1.11],["JACK SPARROW", 2],
					["BEAN DOG", 3],["PIKACHU", 4.44],
					["YOUR MOM", 5],["BLING CXIJN", 6],
					["HOO HAA", 7],["OOPSIE", 8.33],
					["COMPUTER MAN", 9],["ALEXAPLAYDESPACITO", 10]],
					
					[["BEN DOVER22", 1.11],["JACK SPARROW", 2],
					["BEAN DOG", 3],["PIKACHU", 4.44],
					["YOUR MOM", 5],["BLING CXIJN", 6],
					["HOO HAA", 7],["OOPSIE", 8.33],
					["COMPUTER MAN", 9],["ALEXAPLAYDESPACITO", 10]],
					
					[["BEN DOVER33", 1.11],["JACK SPARROW", 2],
					["BEAN DOG", 3],["PIKACHU", 4.44],
					["YOUR MOM", 5],["BLING CXIJN", 6],
					["HOO HAA", 7],["OOPSIE", 8.33],
					["COMPUTER MAN", 9],["ALEXAPLAYDESPACITO", 10]]
					];
					*/
#endregion

load_leaderboard_data();

//global.topSenseUseTime  = [[], [], [], []];
//global.topTimeCompleted = [[], [], [], []];

colorMain   = make_color_rgb(125,0,25);
colorFill   = make_color_rgb(147,49,69);
colorText = make_color_rgb(177,171,171);
colorHover = c_white;

// Border
paddingH = 50; // Left and right padding
paddingV = 25; // Top and bottom padding

scorePadding = 35; // Padding from inside walls to where the stuff is
bottomPadding = 100; // Spacing between the bottom of the screen and the bottom of the leaderboard
					// to make space for the back button

numButtons = 10;

// Looks
buttonHeight = 50;

// Interaction vars
difficultySel = 0;
categorySel = 0;

// Functions

function getDiffTitle(_num)
{
	switch(_num)
	{
		case 0: return "EASY";
		case 1: return "MEDIUM";
		case 2: return "HARD";
		case 3: return "HARDCORE";
		default: return "ERROR";
	}
}

function getCategoryTitle(_num)
{
	switch(_num)
	{
		case 0: return "TIME COMPLETED";
		case 1: return "LEAST TIME USING SENSES";
		default: return "ERROR";
	}
}

function draw_set_align_center()
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
}

function draw_reset_align()
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
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

/*
 * Takes paramaters and creates a leaderboard panel
 * Ex:
 * 
 * (x, y)
 *  / 
 * *___   __________________   
 * ( # ) ( TITLE     | VALUE)  I - Height
 * 
 * |------------------------| - Width
 *
 * @param _x, _y - top left location of the panel
 * @param _width, _height - dimensions of the panel
 * @param _number - the number it displays on the panel
 * @param _value - [TITLE, VALUE]
 */
 
function draw_panel(_x, _y, _width, _height, _number, _value)
{
	draw_set_color(colorFill);
	
	if (array_length(_value) > 0)
	{
		// Draw circle 
		var _radius = _height/2; // (The height of the panel is the diameter of the circle)
		draw_circle(_x + _radius, _y + _radius, _radius, false);
	
		draw_set_color(colorText);
	
		// Draw number
		draw_set_font(fnt_leaderboardButtons);
		draw_set_align_center();
		draw_text(_x + _radius, _y + _radius + 5, _number);
		draw_set_font(fnt_leaderboard);
		draw_reset_align();
	
		draw_set_color(colorMain);
	
		// Draw body
		draw_roundrect_color_ext(_x + _radius*2 + scorePadding/2, _y, _x + _width - scorePadding, _y + _height, 
									_radius*2, _radius*2, colorMain, colorMain, true);
	
		draw_set_valign(fa_center);
	
		// Draw body text
		var _text = _value[0];
		draw_text(_x + _radius*2 + scorePadding*1.5, _y + _radius, _text);
	
		// Draw body time
		var _time = _value[1];
		draw_text(_x + _width - (_width * (1/5)), _y + _radius, _time);
	}
	draw_reset_align();
}

function draw_array(_array)
{
	var _length = array_length(_array);
	var _halfOfButtons = numButtons/2;
	
	var _panelHeight = (room_height - ((paddingV * 2) + (buttonHeight * 2)) - bottomPadding) / _halfOfButtons;
	var _panelWidth = (room_width - paddingH*2 - scorePadding*2)/2//room_width /2; //(room_width - ((paddingH * 2) + (scorePadding * 2)) / 2);
	
	if (_length > 0) // Don't attempt to read an empty array
	{
		for (var i = 0; i < _length; i++)
		{
			if (i < _halfOfButtons) // First 5 panels
			{
				draw_panel(paddingH + scorePadding, 
							(paddingV + buttonHeight * 2) + _panelHeight * i + scorePadding/2,
							_panelWidth, _panelHeight-scorePadding, i+1, _array[i]);
			}
			else // Last 5 panels
			{
				draw_panel(paddingH + scorePadding + _panelWidth, 
							(paddingV + buttonHeight * 2) + _panelHeight * (i - _halfOfButtons) + scorePadding/2,
							_panelWidth, _panelHeight - scorePadding, i+1, _array[i]);
			}
		}
	}
	draw_set_font(-1);
}





// Tests
/*
add_score("HIGHEST SCORE", 0.01, 0, 0);
add_score("HIGHEST SCORE1", 1, 0, 0);
add_score("HIGHEST SCORE0.5", 0.5, 0, 0);
add_score("HIGHEST SCOR2", 2, 0, 0);
add_score("HIGHEST SCORE3", 3, 0, 0);
add_score("HIGHEST SCORE4", 4, 0, 0);
add_score("HIGHEST SCOR5", 5, 0, 0);
add_score("HIGHEST SCORE6", 6, 0, 0);
add_score("HIGHEST SCORE7", 7, 0, 0);
add_score("HIGHEST SCOR8", 8, 0, 0);
add_score("HIGHEST SCORE9", 9, 0, 0);
add_score("HIGHEST SCORE10", 0.02, 0, 0);

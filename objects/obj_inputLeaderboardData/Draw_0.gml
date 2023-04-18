/// @description Draw the stuff

// Score vars
var _timeScore  = seconds_to_minutes_decimal(global.timeCompleted);
var _senseScore = seconds_to_minutes_decimal(global.senseUseTime);


// Get player rank.  If lower than 12, don't ask for name
var _timeRank = get_rank(_timeScore, global.difficulty, 0);
var _senseRank = get_rank(_senseScore, global.difficulty, 1);

// If qualifies is true, the game will ask for a name
var _qualifies = ((_timeRank <= 10) || (_senseRank <= 10)) 
			  && ((_timeRank != -1) || (_senseRank != -1));
if (_qualifies)
{
	// Draw title ("ENTER YOUR NAME")
	draw_set_font(fnt_title);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(room_width/2, 20, "INPUT YOUR NAME");
	
	// Draw input name
	var _inputNameHeight = 260;
	draw_text(room_width/2, _inputNameHeight, name);
	
	// Draw cursor
	if (cursorVisible)
		draw_line_width(room_width/2 + string_width(name)/2 + 3, _inputNameHeight+7, room_width/2 + string_width(name)/2 + 3, 
				        _inputNameHeight + string_height("ABCDE")-12, 5);
	
	// Draw line under input name
	draw_set_color(colorMain);
	var _stringWidth = string_width("123456789012345"); // Length of 15 characters
	draw_line_width((room_width - _stringWidth)/2, _inputNameHeight + string_height("ABGQ")-5, 
					(room_width + _stringWidth)/2, _inputNameHeight + string_height("ABGQ")-5, 5);
					
	// If a name has been input, create a button to continue
	if (string_length(name) != 0)
	{
		var _buttonWidth = 200;
		var _buttonY = _inputNameHeight + 100;
		var _buttonHeight = 40;
	
		var _touchingMouse = draw_continue_button(_buttonWidth, _buttonHeight, _buttonY);
	
		// If clicked, submit score and go to leaderboard room
		if (_touchingMouse && mouse_check_button_pressed(mb_left))
		{
			load_leaderboard_data();
			
			// Only add the score if it was a top 10 score
			if (_timeRank != -1)
				add_score(name, _timeScore, _difficulty, 0);
			if (_senseRank != -1)
				add_score(name, _senseScore, _difficulty, 1);
			
			room_goto(rm_leaderboard);
		}
	}
}
else
{
	var _buttonWidth = 200;
	var _buttonY =  260;
	var _buttonHeight = 40;
	
	var _touchingMouse = draw_continue_button(_buttonWidth, _buttonHeight, _buttonY);
	
	// If clicked, submit score and go to leaderboard room
	if (_touchingMouse && mouse_check_button_pressed(mb_left))
	{
		add_score(name, _timeScore, _difficulty, 0);
		add_score(name, _senseScore, _difficulty, 1);
			
		room_goto(rm_leaderboard);
	}
}

// Draw score section
var _sectionHeight = 180;
var _sectionWallBuffer = 50;

// Draw the difficulty
draw_set_font(fnt_title);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_color(colorMain);

var _difficultyStr = "";
switch(_difficulty)
{
	case 0: _difficultyStr = "EASY"; break;
	case 1: _difficultyStr = "MEDIUM"; break;
	case 2: _difficultyStr = "HARD"; break;
	case 3: _difficultyStr = "HARDER"; break;
}
draw_text(room_width/2, room_height*(7/8), _difficultyStr);

// Reset draw conditions
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(-1);
draw_set_font(-1);

// Draw the player scores
draw_section(_sectionWallBuffer, room_height - 100-_sectionHeight, 500, 100, 
				"Time Completed", _timeScore, 0, 0); 
draw_section(room_width-_sectionWallBuffer-500, room_height - 100-_sectionHeight, 500, 100, 
				"Sense Use Time", _senseScore, 0, 1); 
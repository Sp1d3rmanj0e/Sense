/// @description Insert description here
// You can write your code in this editor

// Draw the base buttons (with rotation)
for (var i = 0; i < numSenses; i++)
{
	// Gets each sensebutton's respective angle along the circle
	var _angle = (i-curSense)*anglePerSense;
	
	// Draw the base buttons
	draw_sprite_ext(spr_senseSelButton, i, x, y, 1, 1, _angle, c_white, 1);
	
	// Draw the sense the button represents
	var _senseSprite = get_sense_sprite(i);
	var _spriteOffset = sprite_width/3;
	var _scale = 1; // Scale of the sense Icons
	
	draw_sprite_ext(_senseSprite, 0,
						x + lengthdir_x(_spriteOffset, _angle + anglePerSense/2),
						y + lengthdir_y(_spriteOffset, _angle + anglePerSense/2),
						_scale, _scale, 0, c_white, 1);
}

// Spin the circle when switching senses
if(switchToSense != curSense)
{
	curSense+= 0.1;
	
	if (curSense > numSenses)
		curSense = 0;
}
else // No longer spinning, making selected sense larger
{
	selSenseSize = min(selSenseSize+0.1, selSenseMaxSize);
	draw_sprite_ext(spr_senseSelButton, curSense, x, y,  // Draw the selected sense (growing animation as well)
					selSenseSize, selSenseSize, 
					0, c_white, 1);
}

// Button selection
// Gets the button the mouse is hovering over (accounting for existing rotation)
var _mouseAngle = point_direction(x, y, mouse_x, mouse_y);
var _selButton = (floor(_mouseAngle / anglePerSense) + 1 + (curSense-3)) mod 5;
if (_selButton < 0) _selButton += numSenses; // This effectively does what mod should be doing
											 // Ex, -2 -> 3
											 

// Draw the button Icons (with rotation)
for (var i = 0; i < numSenses; i++)
{
	// Gets each sensebutton's respective angle along the circle
	var _angle = (i-curSense)*anglePerSense;
	
	// Draw the sense the button represents
	var _senseSprite = get_sense_sprite(i);
	var _spriteOffset = sprite_width/3;
	var _scale = 1; // Scale of the sense Icons
	
	draw_sprite_ext(_senseSprite, 0,
						x + lengthdir_x(_spriteOffset, _angle + anglePerSense/2),
						y + lengthdir_y(_spriteOffset, _angle + anglePerSense/2),
						_scale, _scale, 0, c_white, 1);
}

// Draw outline for button hovered over
var _scale = 1;
if (_selButton == curSense)// Upscales the selection sprite if hovering over the larger button
	_scale = selSenseMaxSize;
if (switchToSense == curSense)
	draw_sprite_ext(spr_senseSelOutline, 0, x, y, _scale, _scale, round((_mouseAngle-180)/anglePerSense) * anglePerSense, c_white, 1);
											 

// Button clicked
// Switch to clicked sense
if (position_meeting(mouse_x, mouse_y, id) 
&& (mouse_check_button_pressed(mb_left))
&& (_selButton % 1 == 0))
	changeSense(_selButton);
	
draw_text(x, y+80, "Button hovered: " + string(_selButton));
draw_text(x, y+100, "Current sense: " + string(curSense));
draw_text(x, y+120, "Debug: " + string((floor(_mouseAngle / anglePerSense) + 1 + (curSense-3))));
/// @description Insert description here
// You can write your code in this editor

image_angle = startAngle + rotationOffset;

var _selected = (sense == parent.curSense);

// Default scale of the button assuming
// it isn't the selected one
var _scale = 1;

// Draw larger scale version of button if it is the selected sense
if (_selected) && (parent.curSense == parent.switchToSense)
	_scale = 1.25;
	
// Draw the button
draw_sprite_ext(sprite_index, image_index, x, y, 
					_scale, _scale, image_angle, 
					image_blend, image_alpha);
	
/*
// Draw the sense it represents
var _sprite = noone;
var _extend = 15;
switch(sense)
{
	case SENSE.SEE: _sprite = spr_sight;
	case SENSE.HEAR: _sprite = spr_hearing;
	case SENSE.SMELL: _sprite = spr_smell;
	case SENSE.FEEL: _sprite = spr_touch;
	case SENSE.TASTE: _sprite = spr_taste;
}

draw_sprite_ext(_sprite, 0, 
					x + lengthdir_x(_extend, image_angle), y + lengthdir_y(_extend, image_angle),
					_scale, _scale, 0, c_white, 1);
	
*/
	
// Draw outline if mouse is hovering over it
if position_meeting(mouse_x, mouse_y, id)
	draw_sprite_ext(spr_senseWheelButtonOutline, 0, x, y, _scale, _scale, image_angle, c_white, 1);
	
	
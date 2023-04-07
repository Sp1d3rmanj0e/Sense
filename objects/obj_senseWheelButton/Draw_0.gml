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
	
	
// Draw outline if mouse is hovering over it
if position_meeting(mouse_x, mouse_y, id)
	draw_sprite_ext(spr_senseWheelButtonOutline, 0, x, y, _scale, _scale, image_angle, c_white, 1);
	
// Draw sense icon on the button
// (The offset is to realign the icons with the correct buttons)
var _extend = 50;
var _angle = image_angle - obj_senseWheel.anglePerSense/2 - obj_senseWheel.anglePerSense*2; 
draw_sprite_ext(senseSprite, 0, 
					x + lengthdir_x(_extend, _angle), y + lengthdir_y(_extend, _angle),
					_scale, _scale, 0, c_white, 1);

// Draw the button that can be pressed to activate the button
_extend = 80;
draw_text_ext_transformed(x + lengthdir_x(_extend, _angle), y + lengthdir_y(_extend, _angle),
							hotkeyButton, 10, 200, _scale, _scale, 0);
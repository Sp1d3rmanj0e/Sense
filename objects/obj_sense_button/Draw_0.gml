/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player))
{
	if (deactivated)
	{
		image_index = 2; // Deactivated (Red)
	}
	else if (obj_player.curSense == sense)
	{
		image_index = 0; // Activated (Light Gray)
	}
	else
	{
		image_index = 1; // Available but not activated (Dark Gray)
	}
}

// Draw self
draw_sprite_ext(spr_sense_button, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

// Get the sense sprite to represent
var _sprite = noone;
switch(sense)
{
	case SENSE.FEEL:  _sprite = spr_touch   break;
	case SENSE.HEAR:  _sprite = spr_hearing break;
	case SENSE.SEE:   _sprite = spr_sight   break;
	case SENSE.SMELL: _sprite = spr_smell   break;
	case SENSE.TASTE: _sprite = spr_taste   break;
}

// Draw the sense icon on the button
draw_sprite_ext(_sprite, 0, x, y, image_xscale*0.75, image_yscale*0.75, 0, c_white, 1);
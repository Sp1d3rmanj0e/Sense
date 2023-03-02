/// @description Insert description here
// You can write your code in this editor

draw_self();

var _sprite = noone;

// Get a sprite based on the sense it represents
switch(sense)
{
	case SENSE.FEEL:  _sprite = spr_touch break;
	case SENSE.HEAR:  _sprite = spr_hearing   break;
	case SENSE.SEE:   _sprite = spr_sight   break;
	case SENSE.SMELL: _sprite = spr_smell  break;
	case SENSE.TASTE: _sprite = spr_taste break;
}

draw_sprite_ext(_sprite, 0, x, y, image_xscale * 0.75, image_yscale * 0.75, 0, c_white, 1);

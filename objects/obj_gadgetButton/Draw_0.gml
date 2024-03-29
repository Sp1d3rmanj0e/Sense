/// @description draw gadget icon

draw_self();

// Find which sprite to draw
var _gadgetSprite = noone;
switch(obj_player.curGadget)
{
	case GADGET.DASH: _gadgetSprite =		spr_dash_arrow_use;				break;
	case GADGET.GPS: _gadgetSprite =		spr_GPS_item;					break;
	case GADGET.LURE: _gadgetSprite =		spr_distraction_box_item;		break;
	case GADGET.TELEPORT: _gadgetSprite =	spr_teleporter_pad;				break;
	case GADGET.THERMAL: _gadgetSprite =	spr_night_vision_helmet_item;	break;
}

// Draw the gadget icon (origin is in top right, icon should be in the center)
if (_gadgetSprite != noone)
	draw_sprite_ext(_gadgetSprite, 0, x - sprite_width/2, y + sprite_height/2,
					1.5, 1.5, 0, c_white, 1);
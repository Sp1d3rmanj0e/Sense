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

#region Draw the hotkey info

draw_set_color(c_ltgray);

var _hotkeyString = getUnicodeString(get_hotkey());

// Get location for hotkey outline
var _x1 = x - string_width(_hotkeyString)/2 - sideBuffer;				// The left side of the roundrect
var _y1 = bbox_bottom - bottomPadding;									// The top of the roundrect
var _x2 = x + string_width(_hotkeyString)/2 + sideBuffer;				// The right side of the roundrect
var _y2 = bbox_bottom - bottomPadding + string_height(_hotkeyString);	// The bottom of the roundrect

// Draw outline for the hotkeys
draw_roundrect(_x1, _y1, _x2, _y2, false);
draw_set_color(c_dkgray);
draw_roundrect(_x1, _y1, _x2, _y2, true);

// Draw the hotkey text
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text(bbox_left + sprite_width/2, bbox_bottom - bottomPadding, _hotkeyString);
draw_set_halign(fa_left);

#endregion Draw the hotkey info
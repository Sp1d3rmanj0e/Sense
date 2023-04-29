/// @description

// Center self in the room
x = room_width/2;
y = room_height/2;

focusedGadget = 2;
drawBuffer = 350;

function get_gadget_sprite(_enum)
{
	// Mod doesn't work for negative numbers,
	// so when it gets below 0, put it back up by 5
	if (_enum < 0) _enum += 5;
	
	switch(_enum)
	{
		case 0: return spr_dash_item_active; break;
		case 1: return spr_placed_distraction_box; break;
		case 2: return spr_GPS_item_active; break;
		case 3: return spr_teleporter_pad; break;
		case 4: return spr_night_vision_helmet_item_active; break;
		default: return spr_fire1;
	}
}

function get_if_gadget_broken(_enum)
{
	for (var i = 0; i < array_length(global.lostGadgets); i++)
	{
		if (global.lostGadgets[i] == _enum)
		{
			show_debug_message(string(global.lostGadgets[i]) + " = " + string(_enum));
			return true; // Gadget found to be broken
		}
	}
	
	return false; // No matches found
}

// Animations
scrollSpeed = 7;
scroll = 0;

function scroll_right()
{
	scroll = scrollSpeed;
}

function scroll_left()
{
	scroll = -scrollSpeed;
}
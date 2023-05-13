/// @description

// Center self in the room
x = room_width/2;
y = room_height/2;

focusedGadget = irandom(4);
drawBuffer = 350;

function get_gadget_name(_gadget)
{
	switch(_gadget)
	{
		case GADGET.DASH:			return "Dash";
		case GADGET.GPS:			return "Tracker";
		case GADGET.LURE:			return "Decoy";
		case GADGET.TELEPORT:		return "Teleporter";
		case GADGET.THERMAL:		return "Thermal";
	}
	
	return "NO NAME";
}


function get_gadget_sprite(_enum)
{
	// Mod doesn't work for negative numbers,
	// so when it gets below 0, put it back up by 5
	if (_enum < 0) _enum += 5;
	
	switch(_enum)
	{
		case GADGET.DASH:		 return spr_dash_item_active; break;
		case GADGET.GPS:		 return spr_GPS_item_active; break;
		case GADGET.LURE:		 return spr_placed_distraction_box; break;
		case GADGET.TELEPORT:	 return spr_teleporter_pad; break;
		case GADGET.THERMAL:	 return spr_night_vision_helmet_item_active; break;
		default: return spr_fire1;
	}
}

function get_if_gadget_broken(_enum)
{
	// Mod doesn't work for negative numbers,
	// so when it gets below 0, put it back up by 5
	if (_enum < 0) _enum += 5;
	
	for (var i = 0; i < array_length(global.lostGadgets); i++)
	{
		if (global.lostGadgets[i] == _enum)
		{
			return true; // Gadget found to be broken
		}
	}
	
	return false; // No matches found
}

// Animations
scrollSpeed = 13;
scroll = 0;

function scroll_right()
{
	scroll = scrollSpeed;
}

function scroll_left()
{
	scroll = -scrollSpeed;
}
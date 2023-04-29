/// @description

//var _numWorkingGadgets = ds_list_size(workingGadgets);


#region scrolling

// If not actively scrolling, animate
if (scroll == 0)
{
	image_speed = 1;
}
else
{
	image_speed = 0;
	image_index = 0;
}

x += scroll;

// Lock on to new gadget once it has scrolled
// far enough in a directon
if (abs(x - room_width/2) >= drawBuffer)
{
	// Stop the auto scrolling
	scroll = 0;
	
	// Switch to the new gadget that has been selected
	focusedGadget -= sign(x - room_width/2);
	
	// Loop back around if scrolled too far
	focusedGadget = focusedGadget mod 5;
	if (focusedGadget < 0) focusedGadget = 4;

	// Go back to the center
	x = room_width/2;
}

#endregion scrolling

// Animate self as the currently focused gadget
sprite_index = get_gadget_sprite(focusedGadget);

draw_self();

for (var i = -2; i <= 2; i++)
{
	// Draw properties
	var _sprite = get_gadget_sprite((focusedGadget + i) mod 5); 
	var _broken = get_if_gadget_broken((focusedGadget + i) mod 5);
	if (_sprite < 0) _sprite += 4;
	var _offset = drawBuffer * i + (x - room_width/2);
	var _alpha  = 1 - abs(_offset)/drawBuffer/2; // 0, 50, 100, 50, 0
	var _scale   = 2 * (1 - abs(_offset)/drawBuffer/4);   // 0.50, 0.75, 1, 0.75, 0.50
	
	if (i != 0) // The center one is drawn differently
	{
		draw_sprite_ext(_sprite, 0, room_width/2 + _offset, y, _scale, _scale, 0, c_white, _alpha);
	}
	else
	{
		image_alpha = _alpha;
		image_xscale = _scale;
		image_yscale = _scale;
		
		if (_broken) image_speed = 0;
	}
	
	if (_broken)
	{
		draw_sprite_ext(spr_broken, 0, room_width/2 + _offset, y, _scale, _scale, 0, c_white, _alpha);
	}
}




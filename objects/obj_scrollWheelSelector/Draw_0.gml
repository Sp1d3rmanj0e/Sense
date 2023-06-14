/// @description

draw_set_color(c_white);

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

#region gadget sprites

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
	else // Is the currently selected gadget
	{
		// Don't animate if broken
		if (_broken) image_speed = 0;
		else // If not broken, check if hovered or clicked
		{
			_scale = 3;
				
			if (mouse_check_button_pressed(mb_left)
			|| (gamepad_button_check_pressed(global.connectedPad, gp_stickr))
			|| (keyboard_check_pressed(vk_space)))
			{
				global.nextRoundGadget = focusedGadget;
					
				// Get the next room to go to
				room_goto(get_next_room());
			}
		}
		
		image_alpha = _alpha;
		image_xscale = _scale;
		image_yscale = _scale;
		
		
	}
	
	if (_broken)
	{
		draw_sprite_ext(spr_broken, 0, room_width/2 + _offset, y, _scale, _scale, 0, c_white, _alpha);
	}
}

#endregion gadget sprites

#region buttons

// Scale if hovered over
// Scroll if clicked
var _rightScale = 1.75;
var _leftScale = 1.75;

var _checkBuffer = 500; // How far from the wall to consider an arrow hovered over

// Right side check
if (point_in_rectangle(mouse_x, mouse_y, room_width - _checkBuffer, 0, room_width, room_height))
{
	_rightScale = 2.5;
	
	if (mouse_check_button_pressed(mb_left)) scroll_left();
}

// Left side check
if (point_in_rectangle(mouse_x, mouse_y, 0, 0, _checkBuffer, room_height))
{
	_leftScale = 2.5;
	
	if (mouse_check_button_pressed(mb_left)) scroll_right();
}

// Draw the right button
draw_sprite_ext(spr_changeGadgetButton, 0, room_width - 80, room_height/2, _rightScale, _rightScale, 0, c_white, 1);

// Draw the left button
draw_sprite_ext(spr_changeGadgetButton, 0, 80, room_height/2, _leftScale * -1, _leftScale, 0, c_white, 1);


#endregion buttons

// Draw gadget name
draw_set_font(fnt_title);
draw_set_halign(fa_center);
draw_text(room_width/2, room_height * 0.60, get_gadget_name(focusedGadget));
draw_set_font(-1);
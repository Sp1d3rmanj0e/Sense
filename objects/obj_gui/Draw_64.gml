/// @description Draw player GUI

// Only draw player stats if player exists
if (instance_exists(obj_player))
{
	// Draw UI Backdrop
	draw_sprite(spr_ui_bar, 0, 677, 746);

	// Draw a hearbeat for every instance in the ds_list
	for (var i = 0; i < ds_list_size(beats); i++)
	{
		draw_sprite(spr_heart_rate, 0, ds_list_find_value(beats, i), 550);
	}

	// Draw heart rate covers
	draw_sprite(spr_heart_rate_caps, 0, 677, 589);

	
	/*
	#region Draw decorative sprite icons
	
	// Get the current gadget
	var _gadget = obj_player.curGadget; // Get the gadget from the player
	
	// Set up sprite information
	var _decSprites = decSprites[_gadget]; // Get the sprite array
	var _scale = 1.703125;
	var _lSprite = _decSprites[0]; // Get the sprites
	var _rSprite = _decSprites[1];

	// Increment the frames
	lSpriteFrame = (lSpriteFrame + sprite_get_speed(_lSprite) / room_speed) % sprite_get_number(_lSprite);
	rSpriteFrame = (rSpriteFrame + sprite_get_speed(_rSprite) / room_speed) % sprite_get_number(_rSprite);

	// Draw the sprites
	draw_sprite_ext(_lSprite, lSpriteFrame, 473, 618, _scale, _scale, 0, c_white, draw_get_alpha());
	draw_sprite_ext(_rSprite, rSpriteFrame, 782, 618, _scale, _scale, 0, c_white, draw_get_alpha());
	#endregion Decorative sprites
	*/
	
	// Draw healthbar
	draw_sprite(spr_healthBar, obj_player.playerHealth, 902, 642);
	
	/*
	#region create Health bar

	var _healthbarVPadding = 100; // Creating space at the bottom/top of the screen
								 // where the healthbar is not drawn
								 
	// Dimensions of the healthbar
	var _healthbarTop = _healthbarVPadding
	var _healthbarBottom = camera_get_view_height(view_camera[0]) - _healthbarVPadding;
	var _healthbarStartX = 10;
	var _healhbarWidth = 15;
	
	// Healthbar data
	var _healthPercent = obj_player.playerHealth/3 * 100;
	
	// Draws the healthbar on the midle left of the screen
	// The healthbaris vertical and red
	draw_healthbar(_healthbarStartX, _healthbarTop,
				   _healthbarStartX + _healhbarWidth,
				   _healthbarBottom, _healthPercent,
				   c_dkgray, c_red, c_red, 3, true, false);

	#endregion create Health bar
	*/
	

	
	// Bar values
	var _healthPercent = obj_player.playerHealth/3 * 100;
	var _usesPercent = 3/6 * 100; // Fix this later
	
	// Draw the bars
	draw_healthbar(healthbarStart, topPadding, barEnd, topPadding+barHeight,
					_healthPercent, c_dkgray, healtbarColor, healtbarColor, 1, true, false);
	draw_healthbar(usesBarStart, topPadding*2 + barHeight, barEnd, topPadding*2 + barHeight*2,
					_usesPercent, c_dkgray, usesBarColor, usesBarColor, 1, true, false);
	
	
}
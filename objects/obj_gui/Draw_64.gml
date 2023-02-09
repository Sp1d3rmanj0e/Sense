/// @description Draw player GUI

// Only draw player stats if player exists
if (instance_exists(obj_player))
{
	// Draw UI Backdrop
	draw_sprite(spr_ui_bar, 0, 0, 0);

	// Draw a hearbeat for every instance in the ds_list
	for (var i = 0; i < ds_list_size(beats); i++)
	{
		draw_sprite(spr_heart_rate, 0, ds_list_find_value(beats, i), beatY);
	}

	// Draw heart rate covers
	draw_sprite(spr_heart_rate_caps, 0, 359, 570);

	// Draw accent sprite icons (the ones on either side of the gadget icon)
	var _gadget = obj_player.curGadget; // Get the gadget from the player

	// Stores the decorative sprites to use for current gadget
	var _decSprites = decSprites[_gadget];

	// Draw the left sprite
	var _lSprite = _decSprites[0];
	
	// Draws the sprite at the exact speed intented
	lSpriteFrame = (lSpriteFrame+(sprite_get_speed(_lSprite)/room_speed)) % sprite_get_number(_lSprite);
	
	draw_sprite(_lSprite, lSpriteFrame, 481, 626);

	// Draw the right sprite
	var _rSprite = _decSprites[1];
	
	rSpriteFrame = (rSpriteFrame+(sprite_get_speed(_rSprite)/room_speed)) % sprite_get_number(_rSprite);
	
	draw_sprite(_rSprite, rSpriteFrame, 776, 626);
}
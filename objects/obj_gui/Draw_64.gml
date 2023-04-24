/// @description Draw player GUI

// Only draw player stats if player exists
if (instance_exists(obj_player))
{
	#region Draw the healthbar and the gadget uses bar
	
	// Bar values
	var _healthPercent = obj_player.playerHealth/obj_player.origPlayerHealth * 100; // Get the percent of player's health left
	
	var _usesPercent = 0;
	if (instance_exists(obj_gadgetButton))
		with(obj_gadgetButton)
		{
			_usesPercent = numGadgetUsesLeft/startingGadgetUses * 100; // Get the percent of gadget uses left
		}
	
	// Draw the healthbar and its divider
	draw_healthbar(healthbarStart, topPadding, barEnd, topPadding+barHeight,
					_healthPercent, c_dkgray, global.color_health, global.color_health, 1, true, false);
	draw_healthbar_divider(healthbarStart, topPadding, healthbarWidth, barHeight, 
							obj_player.origPlayerHealth-1, 3.3);
							
	// Draw the gadget uses bar and its divider
	draw_healthbar(usesBarStart, topPadding*2 + barHeight, barEnd, topPadding*2 + barHeight*2,
					_usesPercent, c_dkgray, global.color_gadget, global.color_gadget, 1, true, false);
	draw_healthbar_divider(usesBarStart, topPadding*2 + barHeight, usesBarWidth, barHeight, 
							obj_gadgetButton.startingGadgetUses-1, -3.3);
	
	#endregion Draw the healthbar and the gadget uses bar
}
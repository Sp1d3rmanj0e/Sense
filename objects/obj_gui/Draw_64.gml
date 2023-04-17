/// @description Draw player GUI

// Only draw player stats if player exists
if (instance_exists(obj_player))
{
	#region Draw the healthbar and the gadget uses bar
	
	// Bar values
	var _healthPercent = obj_player.playerHealth/3 * 100;
	
	var _usesPercent = 0;
	if (instance_exists(obj_gadgetButton))
		with(obj_gadgetButton)
		{
			_usesPercent = numGadgetUsesLeft/startingGadgetUses * 100;
		}
	
	// Draw the bars
	draw_healthbar(healthbarStart, topPadding, barEnd, topPadding+barHeight,
					_healthPercent, c_dkgray, global.color_health, global.color_health, 1, true, false);
	draw_healthbar(usesBarStart, topPadding*2 + barHeight, barEnd, topPadding*2 + barHeight*2,
					_usesPercent, c_dkgray, global.color_gadget, global.color_gadget, 1, true, false);
	
	#endregion Draw the healthbar and the gadget uses bar
}
/// @description Spawn Controllers + Stats

// Don't spawn any of this in intro cutscene
if (room != rm_2_introHallway) && (room != rm_4_introFightAftermath)
{
	// Spawn the Player's GUI
	if (!instance_exists(obj_gui))
		instance_create_layer(0, 0, "Instances", obj_gui);
	
	// Spawn the Sound Control
	if (!instance_exists(obj_soundControl))
		instance_create_layer(0, 0, "Instances", obj_soundControl);
	
	// Spawn the flashlight
	if (!instance_exists(obj_flashlight))
		instance_create_layer(x, y, "Instances", obj_flashlight);
	
	// Spawn the sanity demon spawner
	if (!instance_exists(demonSpawner))
		instance_create_layer(0, 0, "Instances", demonSpawner);

	// Spawn the pause menu
	if (!instance_exists(pauseSpawner))
		instance_create_layer(0, 0, "GUI", pauseSpawner);
}

#region player stats
// Get stats based on the current difficulty
playerHealth = scr_diffStats(3, 2, 1, 1); // Reset player health every round
hardcoreMode = scr_diffStats(false, false, false, true);
walkSp       = 4;

origPlayerHealth = playerHealth; // Save starting player health to compare it to
								 // Existing health
origWalkSp = walkSp; // Save walk speed just in case

curGadget = global.nextRoundGadget;

// Add the new gadget to the list of broken gadgets
// for next round only if it isn't already on there
// (Accounting for the room restarting multiple times, 
// we don't want to inundate the lostGadgets array with
// several of the same gadget)
var _gadgetAlreadyLost = false
for (var i = 0; i < array_length(global.lostGadgets); i++)
{
	
	if (global.lostGadgets[i] == curGadget)
		_gadgetAlreadyLost = true;
}

if (!_gadgetAlreadyLost)
{
	array_push(global.lostGadgets, curGadget);
	log("gadget was not already lost");
	log(string(global.lostGadgets));
}
	
#endregion
/// @description Spawn Controllers + Stats

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

#region player stats
// Get stats based on the current difficulty
playerHealth = scr_diffStats(3, 2, 1, 1); // Reset player health every round
hardcoreMode = scr_diffStats(false, false, false, true);
walkSp       = 4;

origWalkSp = walkSp; // Save walk speed just in case
#endregion
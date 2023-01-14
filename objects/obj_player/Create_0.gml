/// @description Insert description here
// You can write your code in this editor

// Set to fullscreen
window_set_fullscreen(true);

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Initialize player variables
playerHealth = 1;
hardcoreMode = false;

// Movement Control Initialization
hsp = 0;
vsp = 0;
walkSp = 4;
origWalkSp = walkSp; // Save walk speed just in case

// special vars
trashCollected = 0;
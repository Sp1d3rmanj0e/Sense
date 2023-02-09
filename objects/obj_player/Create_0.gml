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
moveX = 0;
moveY = 0;
hsp = 0;
vsp = 0;
walkSp = 4;
origWalkSp = walkSp; // Save walk speed just in case

// Gadget and sense storage
curGadget = GADGET.ECHO;
curSense = SENSE.NONE;

// special vars
trashCollected = 0;

// state code
state = PSTATE.NORMAL;
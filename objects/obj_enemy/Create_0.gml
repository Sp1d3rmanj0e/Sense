/// @description Insert description here
// You can write your code in this editor

// Enemy variables
eSpeed = 4;
idleTime = 4;
dir = 0;
viewConeDeg = 15;
maxSightDist = 5 * WORLD.TILE_SIZE; // 5 tile view range

// Other variables
task = -1;
newPath = true;
prevX = x;
prevY = y;

// Timers
idleTimer = -1;

// Create the path
path = path_add();
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
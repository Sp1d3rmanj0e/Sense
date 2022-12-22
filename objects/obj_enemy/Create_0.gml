/// @description Insert description here
// You can write your code in this editor

// Randomize
randomize();

// Enemy variables
eSpeed = 4000;
dir = 0;

// Mod Vars
//viewConeDeg = 45;
//maxSightDist = 5 * WORLD.CELL_SIZE; // 5 tile view range

// Other variables
newPath = true;
prevX = x;
prevY = y;

// Timers
idleTimer = -1;
idleTime = 0.01;
playerChaseTimer = -1;
playerChaseTime = 1;
enemyMemoryTimer = -1;
enemyMemoryTime = 1.75;

// Hover vars
hoverTimer = 0;
hover = 0;

// Create the path
path = path_add();
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
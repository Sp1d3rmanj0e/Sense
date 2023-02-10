/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize
randomize();

// Sight vars
viewConeDeg = 45;
maxViewDist = 5 * WORLD.CELL_SIZE;

// Path and movement
eSpeed = 4;
newPath = true;
path = path_add(); // Create a path for the enemy

// Scripts
stateScript = scr_spider;
animScript = scr_spiderA;

// Animation vars
prevX = x;
prevY = y;
dir = 0;

// Timers
idleTimer = -1;
idleTime = 4;

playerChaseTimer = -1;
playerChaseTime = 1;

enemyMemoryTimer = -1;
enemyMemoryTime = 1.75;

residueTimer = 8 * room_speed;

// Spawn residue
alarm[0] = residueTimer;

// Initialize state
state = STATE.WANDER;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");
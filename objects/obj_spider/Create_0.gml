/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize
randomize();

// Other variables
newPath = true;
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

// Create the path
path = path_add();

// Initialize state
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
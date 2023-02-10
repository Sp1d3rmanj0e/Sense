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
enemyMemoryTime = 3;
mimicFormTimer = -1;
mimicFormTime = 10;
residueTimer = 7 * room_speed;

// Residue spawn timer
alarm[0] = residueTimer;

// Counters
anger = 0;
maxAnger = 30;

// Hover vars
hoverTimer = 0;
hover = 0;

// Create the path
path = path_add();

// Initialize state
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");

// Holds data of which enemy is being copied
copyID = noone;

// Stores default data for mimic
defaultAnimScript = scr_mimicA;
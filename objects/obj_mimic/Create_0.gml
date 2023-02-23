/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize
randomize();

// Sight vars
viewConeDeg = 45;
maxViewDist = 1 * WORLD.CELL_SIZE;

// Path and movement
eSpeed = 7;
newPath = true;
path = path_add(); // Create a path for the enemy

// Scripts
stateScript = scr_mimic;
animScript = scr_mimicA;

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
enemyMemoryTime = scr_diffStats(1, 1.5, 2, 3);

mimicFormTimer = -1;
mimicFormTime = scr_diffStats(15, 20, 25, 30);

residueTimer = 7 * room_speed;

// Residue spawn timer
alarm[0] = residueTimer;

// Anger counters
anger = 0;
maxAnger = scr_diffStats(60, 48, 36, 24);

// Hover vars
hoverTimer = 0;
hover = 0;

// Initialize state
state = STATE.WANDER;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Holds id of which enemy is being copied
copyID = noone;

// Stores default data for mimic
defaultAnimScript = scr_mimicA;
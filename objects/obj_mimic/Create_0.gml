/// @description Set up vars

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
mimicFormTimer = -1;
mimicFormTime = 10;

// Create the path
path = path_add();

// Initialize state
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");

// Holds data of which enemy is being copied
copyID = noone;

// Stores default data for mimic
defaultSprite = spr_mimic;
defaultScript = scr_mimic;

// Add other enemy vars for if they clone them

// Eyeball
angryTimer = -1;
angryTime = 1 * room_speed;

// Janitor
targetId = noone;

// Spider
spiderWebTimer = 8 * room_speed;
spiderWebTime = -1;
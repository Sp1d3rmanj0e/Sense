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
playerChaseTime = 0.5;
enemyMemoryTimer = -1;
enemyMemoryTime = 1.75;
gooTimer = -1;
gooTime = 3;

// Hover vars
hoverTimer = 0;
hover = 0;

// Create the path
path = path_add();

// Initialize state
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
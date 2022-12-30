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

// Hover vars
hoverTimer = 0;
hover = 0;

// Create the path
path = path_add();

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
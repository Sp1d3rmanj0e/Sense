/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize
randomize();

// Aggro
passive = false;

// Sight vars
viewConeDeg = 45;
maxViewDist = 5 * WORLD.CELL_SIZE;

// Path and movement
eSpeed = scr_diffStats(3.5, 3.6, 3.7, 3.8);
newPath = true;
path = path_add(); // Create a path for the enemy

// Scripts
stateScript = scr_ghost;
animScript = scr_ghostA;

// Animation vars
prevX = x;
prevY = y;
dir = 0;

// Goo vars
canPlace = false;

// Timers
idleTimer = -1;
idleTime = 4;

enemyMemoryTimer = -1;
enemyMemoryTime = 1.75;

gooTimer = -1;
gooTime = 3;

// Hover vars
hoverTimer = 0;
hover = 0;

// Initialize state
state = STATE.WANDER;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");
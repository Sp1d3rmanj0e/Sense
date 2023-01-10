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

targetId = noone;

// Create the path
path = path_add();

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");

testX = 0;
testY = 0;

// Add audio noises
event_inherited();
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
residueTimer = 10 * room_speed;

// Spawn residue
alarm[0] = residueTimer;

// Tracks residue created
targetId = noone;

// Create the path
path = path_add();

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");

testX = 0;
testY = 0;

// Add audio noises
event_inherited();
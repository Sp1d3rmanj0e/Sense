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
path = path_add(); // Create a path for an enemy

// Scripts
stateScript = scr_janitor;
animScript = scr_janitorA;

// Animation vars
prevX = x;
prevY = y;
dir = 0;

// Timers
idleTimer = -1;
idleTime = 4;

residueTimer = 10 * room_speed;

// Spawn residue
alarm[0] = residueTimer;

// Tracker for cleanable residue
targetId = noone;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Add audio noises
event_inherited();
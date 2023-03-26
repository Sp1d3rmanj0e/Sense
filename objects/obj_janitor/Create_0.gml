/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize
randomize();

// Aggro
passive = true;

// Sight vars
viewConeDeg = 45;
maxViewDist = 5 * WORLD.CELL_SIZE;

// Path and movement
eSpeed = scr_diffStats(3.9, 2.2, 2.4, 1.6);
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
cleanTimer = -1;
cleanTime = scr_diffStats(5, 4, 3, 2);

// Spawn residue
residueTimer = 10 * room_speed;
alarm[0] = residueTimer;

// Tracker for cleanable residue
targetId = noone;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");
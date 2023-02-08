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
enemyMemoryTime = 1.75;
angryTimer = -1;
angryTime = 1 * room_speed;
eyebeamTimer = -1;
eyebeamTime = 2 * room_speed;

// Create the path
path = path_add();

// Initialize state
state = STATE.WANDER;

// Tilemap variables
tilemap = layer_tilemap_get_id("walls");
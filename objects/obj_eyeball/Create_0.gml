/// @description Set up vars

// Footstep and heat
event_inherited();

// Randomize seed
randomize();

// Sight vars
viewConeDeg = 45;
maxViewDist = 5 * WORLD.CELL_SIZE;

// Scripts
stateScript = scr_eyeball;
animScript = scr_eyeballA;

// Movement
wanderSpeed = scr_diffStats(2, 3, 4, 5);
chaseSpeed = scr_diffStats(6, 7, 8, 9);
eSpeed = wanderSpeed;

// Paths
newPath = true;
path = path_add(); // Create the enemy path

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
enemyMemoryTime = 1.75;

angryTimer = -1;
angryTime = scr_diffStats(1, 0.9, 0.8, 0.7) * room_speed;

residueTimer = 8 * room_speed;

// Start residue alarm
alarm[0] = residueTimer;

// Initialize state
state = STATE.WANDER;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");
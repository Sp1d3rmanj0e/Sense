/// @description Set up vars

// Footstep and heat
event_inherited();

emitter_set_foot_sound(snd_eyeball); // Change from generic foot sound to eyeball sound

// Randomize seed
randomize();

// Aggro
passive = false;

// Sight vars
viewConeDeg = 30;
maxViewDist = 5 * WORLD.CELL_SIZE;

// Scripts
stateScript = scr_eyeball;
animScript = scr_eyeballA;

// Movement
wanderSpeed = scr_diffStats(2, 2.2, 2.4, 2.6);
chaseSpeed = scr_diffStats(5, 5.2, 5.4, 5.6);
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

enemyMemoryTimer = -1;
enemyMemoryTime = 0.5;

angryTimer = -1;
angryTime = scr_diffStats(1, 0.9, 0.8, 0.7) * room_speed;

residueTimer = 8 * room_speed;

// Start residue alarm
alarm[0] = residueTimer;

// Initialize state
state = STATE.WANDER;
stunned = false;

// Get tilemap
tilemap = layer_tilemap_get_id("walls");
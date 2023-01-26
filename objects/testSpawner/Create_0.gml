/// @description Insert description here
// You can write your code in this editor

entities = 
[
	[obj_ghost,"Ghost",spr_ghost],
	[obj_eyeball,"Eyeball",spr_eyeballPassiveDemo],
	[obj_janitor,"Janitor",spr_JanitorFront],
	[obj_mimic,"Mimic",spr_mimic],
	[obj_sanityDemon,"Sanity Demon",spr_sanityDemon],
	[obj_spider,"Spider",spr_spider]
];

totalBars = 5; // How many different sections there will be

// Location on control panel
scrlY = 0;
scrlX = 0;
moveX = 0;
moveY = 0;

// Selected entity
selEntity = entities[0][1];

// Lights
lightsOn = false;

// Enemy speed
curSpd = 4;

// If sim is running
simRunning = false;

// How many entities spawning
entityCnt = 0;
maxEntities = 10;

// Enemy storage array for simulations
enemyArr = ds_grid_create(4,maxEntities);

// Enemy id storage
enemyID = ds_list_create();

lock = false;

// View range of enemy
viewRing = true;
viewRange = 4 * WORLD.CELL_SIZE;
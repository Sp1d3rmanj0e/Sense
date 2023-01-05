/// @description Insert description here
// You can write your code in this editor

// Set to fullscreen
window_set_fullscreen(true);

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Initialize player variables
playerHealth = 1;
hardcoreMode = false;

// Movement Control Initialization
hsp = 0;
vsp = 0;
walkSp = 5;
origWalkSp = walkSp; // Save walk speed just in case

room1 = Room1;
room2 = noone;
room3 = noone;
room4 = noone;
room5 = noone;

// Initialize level footstep noises
footCur = snd_FloorFootsteps;
footBasement = snd_GravelFootsteps;
footKitchen = snd_ConcreteFootsteps;
footMain = snd_FloorFootsteps;
footBedroom = snd_CarpetFootsteps;
footGrass = snd_GrassFootsteps;
footAttic = snd_FloorFootsteps;
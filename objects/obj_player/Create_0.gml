/// @description Insert description here
// You can write your code in this editor

// Set to fullscreen
window_set_fullscreen(true);

// Get tilemap
tilemap = layer_tilemap_get_id("walls");

// Movement Control Initialization
hsp = 0;
vsp = 0;
walkSp = 5;
origWalkSp = walkSp; // Save walk speed just in case

// Initialize level footstep noises
footCur = snd_FloorFootsteps;
footBasement = snd_GravelFootsteps;
footKitchen = snd_ConcreteFootsteps;
footMain = snd_FloorFootsteps;
footBedroom = snd_CarpetFootsteps;
footGrass = snd_GrassFootsteps;
footAttic = snd_FloorFootsteps;
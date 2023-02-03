/// @description Insert description here
// You can write your code in this editor

var _footNoise = getFootSound();

// Play selected footstep noise
footCur = audio_play_sound(_footNoise, 1, true);

// Timer for heat residue
heatSpawnTime = 0.5;
heatSpawnTimer = -1;
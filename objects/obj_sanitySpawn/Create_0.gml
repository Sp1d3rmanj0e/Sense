/// @description Insert description here
// You can write your code in this editor

// Choose a random costume
sprite_index = choose(spr_sanitySpawn, spr_sanitySpawn2, spr_sanitySpawn3,
					  spr_sanitySpawn4, spr_sanitySpawn5);

// Initialize variables
hiding = false;

// Timers
hidingTimer = -1;
hidingTime = irandom_range(1,3);
/// @description

// Go just below everything on the layer
depth++;

// Properties
realResidue = noone; // Actual residue
glitched = false; // If spawned by the mimic
smelled = false; // If hidden or not
smellProgress = 0; // Progress bar for smelling residue (0/100)

// Decay
alarm[0] = scr_diffStats(25, 20, 15, 10) * room_speed;
/// @description Insert description here
// You can write your code in this editor

// Set to random costume
image_index = irandom(image_number-1);

// Create garbage spawner if it doesn't exist in the room (only 1 garbage in a room)
if (!instance_exists(garbageSpawner))
	instance_create_layer(0,0,"Instances", garbageSpawner);
	
image_xscale = 0.625;
image_yscale = 0.625;
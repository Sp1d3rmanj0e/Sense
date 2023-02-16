/// @description Insert description here
// You can write your code in this editor

// Set to random costume
image_index = irandom(image_number-1);

if (!instance_exists(garbageSpawner))
{
	instance_create_layer(0,0,"Instances", garbageSpawner);
}
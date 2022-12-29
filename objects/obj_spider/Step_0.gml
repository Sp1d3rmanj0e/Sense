/// @description Interaction with environment

// Slowly decrement timer
if (spiderWebTime > 0) spiderWebTime--;
else 
{
	spiderWebTime = spiderWebTimer; // Reset timer
	instance_create_layer(x, y, "Senses", obj_web); // Spawn web
}
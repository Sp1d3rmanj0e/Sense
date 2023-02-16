/// @description Break the light if the sanity demon is near

if (distance_to_object(obj_sanityDemon) < (0.5 * WORLD.CELL_SIZE))
{
	alarm[0] = -1; // Prevent the light from turning on again
	toggleLight = false; // Turn the light off
	image_alpha = 0.02; // Effectively hide the light
}
/// @description Decrement sanity

// Decrement sanity to 0
if (sanity > 0) sanity--;

// Summon sanity demon if time ran out
else if (!instance_exists(obj_sanityDemon))
{
	instance_create_layer(startX, startY, "Instances", obj_sanityDemon);
}
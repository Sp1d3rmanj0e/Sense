/// @description Interations with environment (+Feeling Sense)

// Start the player speed as normal
walkSp = origWalkSp;

// If colliding with janitor, match speed with him
if (place_meeting(x, y, obj_janitor))
{
		walkSp = obj_janitor.eSpeed;
}

// Slow down if colliding with webs
var _id = instance_place(x, y, obj_residue); // Get id of residue
if (_id != noone) && (_id.realResidue == spr_resWeb) // Check if the residue are webs
{
	walkSp *= 0.66; // Reduce speed by 1/3
}





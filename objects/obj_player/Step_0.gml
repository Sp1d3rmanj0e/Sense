/// @description Speed Changes + Sense Loss

// Start the player speed as normal
walkSp = origWalkSp;

// Speed boost when taking damage
if (alarm[1] != -1)
{
	walkSp = 8.5;
}

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

// Increment sense counter
if (curSense != SENSE.NONE)
	incrCounter(curSense);
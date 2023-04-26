/// @description Speed Changes + Sense Loss + Sense Time Counters

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

// Increment sense counter (Taste is excluded because its counter is special)
if (curSense != SENSE.NONE) && (curSense != SENSE.TASTE)
{
	incrCounter(curSense);
}
else if (curSense == SENSE.TASTE) && (place_meeting(x, y, obj_residue))
{
	// Only increment the smell sense if a residue is actively being smelled
	incrCounter(SENSE.TASTE);
}


// Adds 1 second to the timer every second.
// During the scoring phase, a function will turn the seconds into
// minutes and seconds with seconds_to_minutes_decimal()
if (curSense != SENSE.NONE) global.senseUseTime += 0.01/room_speed;
global.timeCompleted += 0.01/room_speed;
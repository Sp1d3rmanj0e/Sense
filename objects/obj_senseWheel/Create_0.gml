/// @description Insert description here
// You can write your code in this editor


numSenses = 5;
anglePerSense = 360/numSenses;
curSense = 3;
switchToSense = curSense;

selSenseMinSize = 1;
selSenseMaxSize = 1.25;
selSenseSize = 1;

// Functions

// Switches the current sense to the new sense
// Which includes the rotation animation
function changeSense(_sense)
{
	switchToSense = _sense;
	selSenseSize = selSenseMinSize;
	
	// Set player's new sense
	set_sense(_sense);
}

// Returns the sprite of the current senseNum
// by translating the number into its respective
// enum and then finding the enum's respective sprite
function get_sense_sprite(_senseNum)
{
	_senseNum -= 2;
	_senseNum = _senseNum mod 2+1;
	
	switch(_senseNum)
	{
		case SENSE.HEAR: return spr_hearing;
		case SENSE.FEEL: return spr_touch;
		case SENSE.SEE: return spr_sight;
		case SENSE.SMELL: return spr_smell;
		case SENSE.TASTE: return spr_taste;
	}
	
	logImportant("NO SPRITE FOUND! obj_senseWheel");
	return noone;
}

// Sets the player's currently used sense to
// the selected sense
function set_sense(_senseNum)
{	
	obj_player.curSense = _senseNum;
}
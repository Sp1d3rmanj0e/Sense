/// @description Insert description here
// You can write your code in this editor

// Spin the circle when switching senses
if(switchToSense != curSense)
{
	curSense+= 0.1;
	
	if (curSense > numSenses)
		curSense = 0;
}

// Rotate all child buttons with the changing curSense
var _rotOffset = (curSense-0.1) * anglePerSense;
with(obj_senseWheelButton)
	rotationOffset = -_rotOffset;
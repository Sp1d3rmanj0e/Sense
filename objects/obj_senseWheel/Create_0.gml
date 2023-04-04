/// @description Insert description here
// You can write your code in this editor

numSenses = 5;
anglePerSense = 360/numSenses;
curSense = 0;
switchToSense = curSense;

for (var i = 0; i < numSenses; i++)
{
	instance_create_layer(x, y, layer, obj_senseWheelButton,
	{
		startAngle : i*anglePerSense,
		sense : i,
		parent : id
	})
}

function change_sense(_sense)
{
	switchToSense = _sense;
}
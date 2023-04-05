/// @description Insert description here
// You can write your code in this editor

event_inherited(); // Follow Camera

numSenses = 5;
anglePerSense = 360/numSenses;
curSense = 0;
switchToSense = curSense;

function get_sense_sprite(_sense)
{
	switch(_sense)
	{
		case SENSE.SEE: return spr_sight;
		case SENSE.FEEL: return spr_touch;
		case SENSE.HEAR: return spr_hearing;
		case SENSE.TASTE: return spr_taste;
		case SENSE.SMELL: return spr_smell;
		default:return noone;
	}
}

for (var i = 0; i < numSenses; i++)
{
	var _senseSprite = get_sense_sprite(i);
	
	instance_create_layer(x, y, layer, obj_senseWheelButton,
	{
		startAngle : i*anglePerSense,
		sense : i,
		parent : id,
		senseSprite : _senseSprite
	})
}



function change_sense(_sense)
{
	switchToSense = _sense;
}
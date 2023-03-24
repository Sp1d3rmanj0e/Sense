/// @description Insert description here
// You can write your code in this editor

if (heat > 0) heat--;
else instance_destroy();

var _progPerc = heat/maxHeat;

// Color
image_blend = merge_color(endColor, startColor, _progPerc);

// Won't go below 0.25
var _qtrPerc = clamp(_progPerc, 0.25, 1);

// Size
image_xscale = _qtrPerc
image_yscale = _qtrPerc

// Alpha - Hide if smell is not activated
if (obj_player.curSense == SENSE.SMELL)
{
	image_alpha = _qtrPerc
}
else
{
	image_alpha = 0;
}

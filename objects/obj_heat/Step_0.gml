/// @description Insert description here
// You can write your code in this editor

if (instance_exists(followID))
{
	x = followID.x;
	y = followID.y;
}

if (obj_player.curGadget != GADGET.THERMAL)
	instance_destroy();
/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_teleporter)) {
	instance_create_layer(x,y,"Instances",obj_teleporter);
}
else
{
	x = obj_teleporter.x;
	y = obj_teleporter.y;
	instance_destroy(obj_teleporter);
}
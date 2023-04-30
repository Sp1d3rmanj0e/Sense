/// @description TP player back, then destroy

if (room == roomToTpBackTo)
{
	// Teleport the player back
	with(obj_player)
	{
		x = other.playerSaveX;
		y = other.playerSaveY;
	}
	
	instance_destroy();
}
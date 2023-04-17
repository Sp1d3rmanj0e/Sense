// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getFootSound()
{
	var _footNoise;
	
	// Get room names
	room1 = rm_Gwall_1;
	room2 = rm_Gwall_2;
	room3 = rm_Gwall_3;
	room4 = rm_Gwall_4;
	room5 = rm_Gwall_5;

	// Initialize level footstep noises
	_footNoise = snd_FloorFootsteps;
	
	footBasement = snd_GravelFootsteps;
	footKitchen = snd_ConcreteFootsteps;
	footMain = snd_FloorFootsteps;
	footBedroom = snd_CarpetFootsteps;
	footGrass = snd_GrassFootsteps;
	footAttic = snd_FloorFootsteps;
	
	// Get footstep noise per room
	switch(room)
	{
		case room1:
			_footNoise = footMain;
			break;
		default:
			_footNoise = footMain;
	}
	
	return _footNoise;
}
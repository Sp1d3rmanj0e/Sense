// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getFootSound()
{
	var _footNoise;
	
	// Get room names
	room1 = Room1;
	room2 = kitchen_idea_1;
	room3 = map_idea_1;
	room4 = map_idea_2;
	room5 = map_idea_3;

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